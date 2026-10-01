#include "defines.h"
#include "../include/event_data.h"
#include "../include/event_object_movement.h"
#include "../include/script.h"
#include "../include/sound.h"
#include "../include/sprite.h"
#include "../include/task.h"
#include "../include/constants/songs.h"

#include "../include/new/board_puzzle.h"
/*
board_puzzle.c
	puzzles whose pieces are NPCs, controlled straight from the buttons while a script waits
	(callasm, then waitstate). They run until solved, then the script goes on; there's no other way out.
	NPCs glide to their new cells with a pixel offset, so their pictures never switch to walking frames.

	Board puzzles (Rovine Ancestrali): the D-pad moves a cursor NPC from cell to cell, A picks up the
	piece under it or puts the carried one down (not on another piece), B puts the carried piece back
	where it was picked up. Each piece's cell is kept in a var.

	Band puzzles (Passo Tuono): left/right moves a cursor NPC from band to band, up/down scrolls the
	band under it by one face. Each band is two NPCs (its top and bottom half) and its position is
	kept in a var.

	The starting layout comes from the vars (a script sets them before the map loads); the NPCs are
	moved to match them when the puzzle starts.
*/

#define NO_PIECE 0
#define NO_CELL 0xFF
#define CELL_SPACING 2 //Tiles between two neighbouring cells, bands or band positions
#define GLIDE_FRAMES 8 //Frames a move takes
#define LIFT_PIXELS 4 //How far a carried piece is raised
#define MAP_OFFSET 7 //Map coordinates in the overworld are 7 more than in AdvanceMap/HMA

#define SE_BOARD_MOVE SE_SELECT //Same sounds the old scripts used
#define SE_BOARD_MOVE_CARRYING SE_NOT_VERY_EFFECTIVE
#define SE_BOARD_EDGE SE_WALL_HIT
#define SE_BOARD_PICK_UP SE_HOP
#define SE_BOARD_PUT_DOWN SE_LOCK
#define SE_BOARD_ERROR SE_ERROR
#define SE_BAND_SCROLL SE_NOT_VERY_EFFECTIVE

struct BoardCell
{
	u8 x, y; //Map coordinates as in AdvanceMap/HMA
};

struct BoardPuzzle
{
	const struct BoardCell* cells;
	const u8* solution; //Cell each piece must end on
	u8 numCells;
	u8 numPieces;
	u8 cursorLocalId;
	u8 firstPieceLocalId; //Pieces are this NPC and the ones after it
	u16 carriedVar; //Piece being carried (1 = the first piece) or NO_PIECE
	u16 cursorVar; //Cell under the cursor
	u16 firstPieceVar; //Cell of each piece: this var and the ones after it
};

struct BandPuzzle
{
	const u8* bandX; //x of each band, and of the cursor over it
	const u8* solution; //Position each band must end at
	u8 numBands;
	u8 numPositions; //Position 0 is the lowest; each one up moves the band up a face (CELL_SPACING tiles)
	u8 cursorLocalId;
	u8 cursorY;
	u8 firstBandLocalId; //Band 0's top half; its bottom half is the next NPC, then band 1's top half, and so on
	u8 topY; //y of a band's top half at position 0
	u8 bottomY; //y of a band's bottom half at position 0
	u16 selectedVar; //Band under the cursor
	u16 firstPositionVar; //Position of each band: this var and the ones after it
};

//Rovine Ancestrali (map 0.5): a cross of 21 cells; the 9 pieces form a picture in the 3x3 centre
static const struct BoardCell sRovineCells[] =
{
	                {5, 1}, {7, 1}, {9, 1},
	        {3, 3}, {5, 3}, {7, 3}, {9, 3}, {11, 3},
	        {3, 5}, {5, 5}, {7, 5}, {9, 5}, {11, 5},
	        {3, 7}, {5, 7}, {7, 7}, {9, 7}, {11, 7},
	                {5, 9}, {7, 9}, {9, 9},
};

static const u8 sRovineSolution[] = {4, 5, 6, 9, 10, 11, 14, 15, 16};

static const struct BoardPuzzle sRovinePuzzle =
{
	.cells = sRovineCells,
	.solution = sRovineSolution,
	.numCells = ARRAY_COUNT(sRovineCells),
	.numPieces = ARRAY_COUNT(sRovineSolution),
	.cursorLocalId = 10,
	.firstPieceLocalId = 1,
	.carriedVar = 0x4054,
	.cursorVar = 0x4055,
	.firstPieceVar = 0x4056,
};

//Passo Tuono (map 0.22): 4 bands of 4 faces; the cursor sits on the row where the faces are read
static const u8 sPassoTuonoBandX[] = {4, 6, 8, 10};
static const u8 sPassoTuonoSolution[] = {2, 0, 3, 1};

static const struct BandPuzzle sPassoTuonoPuzzle =
{
	.bandX = sPassoTuonoBandX,
	.solution = sPassoTuonoSolution,
	.numBands = ARRAY_COUNT(sPassoTuonoBandX),
	.numPositions = 4,
	.cursorLocalId = 1,
	.cursorY = 9,
	.firstBandLocalId = 2,
	.topY = 11,
	.bottomY = 15,
	.selectedVar = 0x4054,
	.firstPositionVar = 0x4055,
};

#define tPuzzleLo data[0]
#define tPuzzleHi data[1]
#define tGlideFrames data[2] //Frames left in the current move
#define tGlideX data[3] //Where the moving NPCs started, in pixels from where they're going
#define tGlideY data[4]
#define tGlideIdA data[5] //Local ids of the (up to 2) gliding NPCs, 0 for none
#define tGlideIdB data[6]
#define tGlideLiftId data[7] //Gliding NPC drawn raised (a carried piece), 0 for none

static void Task_BoardPuzzle(u8 taskId);
static void Task_BandPuzzle(u8 taskId);

//Shared//

static const void* GetPuzzle(struct Task* task)
{
	return (const void*) (((u32) (u16) task->tPuzzleHi << 16) | (u16) task->tPuzzleLo);
}

static u8 CreatePuzzleTask(TaskFunc func, const void* puzzle)
{
	u8 taskId = CreateTask(func, 80);
	gTasks[taskId].tPuzzleLo = (u32) puzzle & 0xFFFF;
	gTasks[taskId].tPuzzleHi = (u32) puzzle >> 16;
	return taskId;
}

static struct EventObject* GetObjectByLocalId(u8 localId)
{
	u8 objId = GetEventObjectIdByLocalId(localId);
	return (objId < EVENT_OBJECTS_COUNT) ? &gEventObjects[objId] : NULL;
}

static void PlaceObject(struct EventObject* obj, u8 x, u8 y)
{
	if (obj != NULL)
		MoveEventObjectToMapCoords(obj, x + MAP_OFFSET, y + MAP_OFFSET);
}

static void SetObjectOffset(struct EventObject* obj, s16 x, s16 y)
{
	if (obj != NULL)
	{
		gSprites[obj->spriteId].pos2.x = x;
		gSprites[obj->spriteId].pos2.y = y;
	}
}

//The cursor, then a carried piece, are drawn over the other pieces
static void SetDrawnOnTop(struct EventObject* obj, bool8 onTop, u8 subpriority)
{
	if (obj != NULL)
	{
		obj->fixedPriority = onTop;
		if (onTop)
			gSprites[obj->spriteId].subpriority = subpriority;
	}
}

//Moves the gliding NPCs a step closer to where they really are (they were already put there)
static void UpdateGlide(struct Task* task)
{
	s16 x = task->tGlideX * task->tGlideFrames / GLIDE_FRAMES;
	s16 y = task->tGlideY * task->tGlideFrames / GLIDE_FRAMES;

	if (task->tGlideIdA != 0)
		SetObjectOffset(GetObjectByLocalId(task->tGlideIdA), x, y);

	if (task->tGlideIdB != 0)
		SetObjectOffset(GetObjectByLocalId(task->tGlideIdB), x, y - (task->tGlideIdB == task->tGlideLiftId ? LIFT_PIXELS : 0));
}

//distX/distY: tiles from where the NPCs were to where they've been put
static void StartGlide(struct Task* task, s16 distX, s16 distY, u8 localIdA, u8 localIdB, u8 liftedLocalId)
{
	task->tGlideX = -distX * 16;
	task->tGlideY = -distY * 16;
	task->tGlideFrames = GLIDE_FRAMES;
	task->tGlideIdA = localIdA;
	task->tGlideIdB = localIdB;
	task->tGlideLiftId = liftedLocalId;
	UpdateGlide(task);
}

//Returns TRUE while a move is still gliding
static bool8 ContinueGlide(struct Task* task)
{
	if (task->tGlideFrames == 0)
		return FALSE;

	task->tGlideFrames--;
	UpdateGlide(task);
	return TRUE;
}

static void FinishPuzzle(u8 taskId, u8 cursorLocalId)
{
	SetDrawnOnTop(GetObjectByLocalId(cursorLocalId), FALSE, 0);
	DestroyTask(taskId);
	EnableBothScriptContexts(); //Solved: the script goes on
}

//Board puzzles//

static u8 GetPieceLocalId(const struct BoardPuzzle* puzzle, u8 piece)
{
	return puzzle->firstPieceLocalId + piece - 1;
}

static u8 GetPieceCell(const struct BoardPuzzle* puzzle, u8 piece)
{
	return VarGet(puzzle->firstPieceVar + piece - 1);
}

static void PlaceObjectOnCell(const struct BoardPuzzle* puzzle, struct EventObject* obj, u8 cell)
{
	if (cell < puzzle->numCells)
		PlaceObject(obj, puzzle->cells[cell].x, puzzle->cells[cell].y);
}

//Returns the piece on a cell, leaving out the carried one (it still has the cell it was picked up from)
static u8 GetPieceOnCell(const struct BoardPuzzle* puzzle, u8 cell)
{
	u8 carried = VarGet(puzzle->carriedVar);

	for (u8 piece = 1; piece <= puzzle->numPieces; ++piece)
	{
		if (piece != carried && GetPieceCell(puzzle, piece) == cell)
			return piece;
	}

	return NO_PIECE;
}

static u8 FindCell(const struct BoardPuzzle* puzzle, s16 x, s16 y)
{
	for (u8 cell = 0; cell < puzzle->numCells; ++cell)
	{
		if (puzzle->cells[cell].x == x && puzzle->cells[cell].y == y)
			return cell;
	}

	return NO_CELL;
}

static bool8 IsBoardSolved(const struct BoardPuzzle* puzzle)
{
	for (u8 piece = 1; piece <= puzzle->numPieces; ++piece)
	{
		if (GetPieceCell(puzzle, piece) != puzzle->solution[piece - 1])
			return FALSE;
	}

	return TRUE;
}

static void TryMoveBoardCursor(struct Task* task, const struct BoardPuzzle* puzzle, s8 dirX, s8 dirY, bool8 newPress)
{
	u8 from = VarGet(puzzle->cursorVar);
	u8 to = FindCell(puzzle, puzzle->cells[from].x + dirX * CELL_SPACING, puzzle->cells[from].y + dirY * CELL_SPACING);
	u8 carried = VarGet(puzzle->carriedVar);
	u8 carriedLocalId = (carried != NO_PIECE) ? GetPieceLocalId(puzzle, carried) : 0;

	if (to == NO_CELL)
	{
		if (newPress) //Not again and again while the button is held
			PlaySE(SE_BOARD_EDGE);
		return;
	}

	VarSet(puzzle->cursorVar, to);
	PlaceObjectOnCell(puzzle, GetObjectByLocalId(puzzle->cursorLocalId), to);
	if (carried != NO_PIECE)
		PlaceObjectOnCell(puzzle, GetObjectByLocalId(carriedLocalId), to);

	StartGlide(task, dirX * CELL_SPACING, dirY * CELL_SPACING, puzzle->cursorLocalId, carriedLocalId, carriedLocalId);
	PlaySE(carried != NO_PIECE ? SE_BOARD_MOVE_CARRYING : SE_BOARD_MOVE);
}

//Returns TRUE if the puzzle is solved
static bool8 PickUpOrPutDown(const struct BoardPuzzle* puzzle)
{
	u8 cell = VarGet(puzzle->cursorVar);
	u8 carried = VarGet(puzzle->carriedVar);
	u8 pieceOnCell = GetPieceOnCell(puzzle, cell);

	if (carried == NO_PIECE)
	{
		if (pieceOnCell != NO_PIECE)
		{
			struct EventObject* obj = GetObjectByLocalId(GetPieceLocalId(puzzle, pieceOnCell));
			VarSet(puzzle->carriedVar, pieceOnCell);
			SetDrawnOnTop(obj, TRUE, 1);
			SetObjectOffset(obj, 0, -LIFT_PIXELS);
			PlaySE(SE_BOARD_PICK_UP);
		}
	}
	else if (pieceOnCell != NO_PIECE) //Occupied
	{
		PlaySE(SE_BOARD_ERROR);
	}
	else
	{
		struct EventObject* obj = GetObjectByLocalId(GetPieceLocalId(puzzle, carried));
		VarSet(puzzle->firstPieceVar + carried - 1, cell);
		VarSet(puzzle->carriedVar, NO_PIECE);
		SetDrawnOnTop(obj, FALSE, 0);
		SetObjectOffset(obj, 0, 0);
		PlaySE(SE_BOARD_PUT_DOWN);
		return IsBoardSolved(puzzle);
	}

	return FALSE;
}

static void PutBack(struct Task* task, const struct BoardPuzzle* puzzle)
{
	u8 carried = VarGet(puzzle->carriedVar);
	u8 origin, cursorCell, localId;
	struct EventObject* obj;

	if (carried == NO_PIECE)
		return;

	origin = GetPieceCell(puzzle, carried); //Never changed while it was carried
	cursorCell = VarGet(puzzle->cursorVar);
	localId = GetPieceLocalId(puzzle, carried);
	obj = GetObjectByLocalId(localId);
	VarSet(puzzle->carriedVar, NO_PIECE);
	SetDrawnOnTop(obj, FALSE, 0);
	PlaceObjectOnCell(puzzle, obj, origin);
	StartGlide(task, puzzle->cells[origin].x - puzzle->cells[cursorCell].x, puzzle->cells[origin].y - puzzle->cells[cursorCell].y, 0, localId, 0);
	PlaySE(SE_BOARD_PUT_DOWN);
}

static void StartBoardPuzzle(const struct BoardPuzzle* puzzle)
{
	struct EventObject* cursor = GetObjectByLocalId(puzzle->cursorLocalId);

	CreatePuzzleTask(Task_BoardPuzzle, puzzle);
	VarSet(puzzle->carriedVar, NO_PIECE);
	VarSet(puzzle->cursorVar, 0);
	for (u8 piece = 1; piece <= puzzle->numPieces; ++piece) //The NPCs always match the vars
	{
		struct EventObject* obj = GetObjectByLocalId(GetPieceLocalId(puzzle, piece));
		PlaceObjectOnCell(puzzle, obj, GetPieceCell(puzzle, piece));
		SetObjectOffset(obj, 0, 0);
	}

	PlaceObjectOnCell(puzzle, cursor, 0);
	SetObjectOffset(cursor, 0, 0);
	SetDrawnOnTop(cursor, TRUE, 0);
}

static void Task_BoardPuzzle(u8 taskId)
{
	struct Task* task = &gTasks[taskId];
	const struct BoardPuzzle* puzzle = GetPuzzle(task);
	u16 dpad;

	if (ContinueGlide(task)) //Finish the move first
		return;

	if (JOY_NEW(A_BUTTON))
	{
		if (PickUpOrPutDown(puzzle))
			FinishPuzzle(taskId, puzzle->cursorLocalId);
		return;
	}

	if (JOY_NEW(B_BUTTON))
	{
		PutBack(task, puzzle);
		return;
	}

	dpad = gMain.heldKeys & DPAD_ANY; //Held, so keeping a direction pressed keeps moving
	if (dpad & DPAD_UP)
		TryMoveBoardCursor(task, puzzle, 0, -1, JOY_NEW(DPAD_UP));
	else if (dpad & DPAD_DOWN)
		TryMoveBoardCursor(task, puzzle, 0, 1, JOY_NEW(DPAD_DOWN));
	else if (dpad & DPAD_LEFT)
		TryMoveBoardCursor(task, puzzle, -1, 0, JOY_NEW(DPAD_LEFT));
	else if (dpad & DPAD_RIGHT)
		TryMoveBoardCursor(task, puzzle, 1, 0, JOY_NEW(DPAD_RIGHT));
}

//Band puzzles//

static u8 GetBandPosition(const struct BandPuzzle* puzzle, u8 band)
{
	return VarGet(puzzle->firstPositionVar + band);
}

static u8 GetBandTopLocalId(const struct BandPuzzle* puzzle, u8 band)
{
	return puzzle->firstBandLocalId + band * 2;
}

static void PlaceBand(const struct BandPuzzle* puzzle, u8 band, u8 position)
{
	u8 top = GetBandTopLocalId(puzzle, band);
	u8 rise = position * CELL_SPACING;

	PlaceObject(GetObjectByLocalId(top), puzzle->bandX[band], puzzle->topY - rise);
	PlaceObject(GetObjectByLocalId(top + 1), puzzle->bandX[band], puzzle->bottomY - rise);
}

static bool8 IsBandPuzzleSolved(const struct BandPuzzle* puzzle)
{
	for (u8 band = 0; band < puzzle->numBands; ++band)
	{
		if (GetBandPosition(puzzle, band) != puzzle->solution[band])
			return FALSE;
	}

	return TRUE;
}

static void TryMoveBandCursor(struct Task* task, const struct BandPuzzle* puzzle, s8 dir, bool8 newPress)
{
	s8 to = VarGet(puzzle->selectedVar) + dir;

	if (to < 0 || to >= puzzle->numBands)
	{
		if (newPress)
			PlaySE(SE_BOARD_EDGE);
		return;
	}

	VarSet(puzzle->selectedVar, to);
	PlaceObject(GetObjectByLocalId(puzzle->cursorLocalId), puzzle->bandX[to], puzzle->cursorY);
	StartGlide(task, dir * CELL_SPACING, 0, puzzle->cursorLocalId, 0, 0);
	PlaySE(SE_BOARD_MOVE);
}

//dir: 1 scrolls the band up (the next face shows under the cursor), -1 down
static void TryScrollBand(struct Task* task, const struct BandPuzzle* puzzle, s8 dir, bool8 newPress)
{
	u8 band = VarGet(puzzle->selectedVar);
	s8 to = GetBandPosition(puzzle, band) + dir;
	u8 top = GetBandTopLocalId(puzzle, band);

	if (to < 0 || to >= puzzle->numPositions)
	{
		if (newPress)
			PlaySE(SE_BOARD_EDGE);
		return;
	}

	VarSet(puzzle->firstPositionVar + band, to);
	PlaceBand(puzzle, band, to);
	StartGlide(task, 0, -dir * CELL_SPACING, top, top + 1, 0);
	PlaySE(SE_BAND_SCROLL);
}

static void StartBandPuzzle(const struct BandPuzzle* puzzle)
{
	struct EventObject* cursor = GetObjectByLocalId(puzzle->cursorLocalId);

	CreatePuzzleTask(Task_BandPuzzle, puzzle);
	VarSet(puzzle->selectedVar, 0);
	for (u8 band = 0; band < puzzle->numBands; ++band) //The NPCs always match the vars
		PlaceBand(puzzle, band, GetBandPosition(puzzle, band));

	PlaceObject(cursor, puzzle->bandX[0], puzzle->cursorY);
	SetObjectOffset(cursor, 0, 0);
	SetDrawnOnTop(cursor, TRUE, 0);
}

static void Task_BandPuzzle(u8 taskId)
{
	struct Task* task = &gTasks[taskId];
	const struct BandPuzzle* puzzle = GetPuzzle(task);
	u16 dpad;

	if (ContinueGlide(task))
	{
		if (task->tGlideFrames == 0 && IsBandPuzzleSolved(puzzle)) //Done once the last band has stopped
			FinishPuzzle(taskId, puzzle->cursorLocalId);
		return;
	}

	dpad = gMain.heldKeys & DPAD_ANY; //Held, so keeping a direction pressed keeps moving
	if (dpad & DPAD_UP)
		TryScrollBand(task, puzzle, 1, JOY_NEW(DPAD_UP));
	else if (dpad & DPAD_DOWN)
		TryScrollBand(task, puzzle, -1, JOY_NEW(DPAD_DOWN));
	else if (dpad & DPAD_LEFT)
		TryMoveBandCursor(task, puzzle, -1, JOY_NEW(DPAD_LEFT));
	else if (dpad & DPAD_RIGHT)
		TryMoveBandCursor(task, puzzle, 1, JOY_NEW(DPAD_RIGHT));
}

//Starters (callasm, then waitstate: the script goes on once the puzzle is solved)//

//Rovine Ancestrali, map 0.5
void BoardPuzzle_StartRovine(void)
{
	StartBoardPuzzle(&sRovinePuzzle);
}

//Passo Tuono, map 0.22
void BandPuzzle_StartPassoTuono(void)
{
	StartBandPuzzle(&sPassoTuonoPuzzle);
}
