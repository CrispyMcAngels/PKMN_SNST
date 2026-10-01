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
	board puzzles whose pieces are NPCs: the D-pad moves a cursor NPC from cell to cell, A picks up
	the piece under it or puts the carried one down (not on another piece), B puts the carried piece
	back where it was picked up. It runs until every piece is on its solution cell, then the script
	goes on. Used with callasm + waitstate; there's no way out other than solving it.

	Each piece's cell is kept in a var, so a script can set the starting layout before the map loads.
	The pieces' NPCs are moved to those cells when the puzzle starts.
*/

#define NO_PIECE 0
#define NO_CELL 0xFF
#define CELL_SPACING 2 //Tiles between two neighbouring cells
#define GLIDE_FRAMES 8 //Frames a move takes
#define LIFT_PIXELS 4 //How far a carried piece is raised
#define MAP_OFFSET 7 //Map coordinates in the overworld are 7 more than in AdvanceMap/HMA

#define SE_BOARD_MOVE SE_SELECT //Same sounds the old script used
#define SE_BOARD_MOVE_CARRYING SE_NOT_VERY_EFFECTIVE
#define SE_BOARD_EDGE SE_WALL_HIT
#define SE_BOARD_PICK_UP SE_HOP
#define SE_BOARD_PUT_DOWN SE_LOCK
#define SE_BOARD_ERROR SE_ERROR

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

#define tPuzzleLo data[0]
#define tPuzzleHi data[1]
#define tGlideFrames data[2] //Frames left in the current move
#define tGlideX data[3] //Where the moving NPCs started, in pixels from where they're going
#define tGlideY data[4]
#define tGlideCursor data[5] //Whether the cursor is moving too, or only a piece put back
#define tGlidePiece data[6] //Piece moving with the cursor or put back, or NO_PIECE

static void Task_BoardPuzzle(u8 taskId);

static const struct BoardPuzzle* GetPuzzle(struct Task* task)
{
	return (const struct BoardPuzzle*) (((u32) (u16) task->tPuzzleHi << 16) | (u16) task->tPuzzleLo);
}

static struct EventObject* GetObjectByLocalId(u8 localId)
{
	u8 objId = GetEventObjectIdByLocalId(localId);
	return (objId < EVENT_OBJECTS_COUNT) ? &gEventObjects[objId] : NULL;
}

static struct EventObject* GetPieceObject(const struct BoardPuzzle* puzzle, u8 piece)
{
	return GetObjectByLocalId(puzzle->firstPieceLocalId + piece - 1);
}

static u8 GetPieceCell(const struct BoardPuzzle* puzzle, u8 piece)
{
	return VarGet(puzzle->firstPieceVar + piece - 1);
}

static void PlaceObjectOnCell(const struct BoardPuzzle* puzzle, struct EventObject* obj, u8 cell)
{
	if (obj != NULL && cell < puzzle->numCells)
		MoveEventObjectToMapCoords(obj, puzzle->cells[cell].x + MAP_OFFSET, puzzle->cells[cell].y + MAP_OFFSET);
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

static bool8 IsSolved(const struct BoardPuzzle* puzzle)
{
	for (u8 piece = 1; piece <= puzzle->numPieces; ++piece)
	{
		if (GetPieceCell(puzzle, piece) != puzzle->solution[piece - 1])
			return FALSE;
	}

	return TRUE;
}

//Moves the gliding NPCs a step closer to where they really are (MoveEventObjectToMapCoords already put them there)
static void UpdateGlide(struct Task* task, const struct BoardPuzzle* puzzle)
{
	s16 x = task->tGlideX * task->tGlideFrames / GLIDE_FRAMES;
	s16 y = task->tGlideY * task->tGlideFrames / GLIDE_FRAMES;

	if (task->tGlideCursor)
		SetObjectOffset(GetObjectByLocalId(puzzle->cursorLocalId), x, y);

	if (task->tGlidePiece != NO_PIECE)
	{
		s16 lift = (task->tGlidePiece == VarGet(puzzle->carriedVar)) ? -LIFT_PIXELS : 0;
		SetObjectOffset(GetPieceObject(puzzle, task->tGlidePiece), x, y + lift);
	}
}

static void StartGlide(struct Task* task, const struct BoardPuzzle* puzzle, u8 fromCell, u8 toCell, bool8 withCursor, u8 piece)
{
	task->tGlideX = (puzzle->cells[fromCell].x - puzzle->cells[toCell].x) * 16;
	task->tGlideY = (puzzle->cells[fromCell].y - puzzle->cells[toCell].y) * 16;
	task->tGlideFrames = GLIDE_FRAMES;
	task->tGlideCursor = withCursor;
	task->tGlidePiece = piece;
	UpdateGlide(task, puzzle);
}

static void TryMoveCursor(struct Task* task, const struct BoardPuzzle* puzzle, s8 dirX, s8 dirY, bool8 newPress)
{
	u8 from = VarGet(puzzle->cursorVar);
	u8 to = FindCell(puzzle, puzzle->cells[from].x + dirX * CELL_SPACING, puzzle->cells[from].y + dirY * CELL_SPACING);
	u8 carried = VarGet(puzzle->carriedVar);

	if (to == NO_CELL)
	{
		if (newPress) //Not again and again while the button is held
			PlaySE(SE_BOARD_EDGE);
		return;
	}

	VarSet(puzzle->cursorVar, to);
	PlaceObjectOnCell(puzzle, GetObjectByLocalId(puzzle->cursorLocalId), to);
	if (carried != NO_PIECE)
		PlaceObjectOnCell(puzzle, GetPieceObject(puzzle, carried), to);

	StartGlide(task, puzzle, from, to, TRUE, carried);
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
			struct EventObject* obj = GetPieceObject(puzzle, pieceOnCell);
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
		struct EventObject* obj = GetPieceObject(puzzle, carried);
		VarSet(puzzle->firstPieceVar + carried - 1, cell);
		VarSet(puzzle->carriedVar, NO_PIECE);
		SetDrawnOnTop(obj, FALSE, 0);
		SetObjectOffset(obj, 0, 0);
		PlaySE(SE_BOARD_PUT_DOWN);
		return IsSolved(puzzle);
	}

	return FALSE;
}

static void PutBack(struct Task* task, const struct BoardPuzzle* puzzle)
{
	u8 carried = VarGet(puzzle->carriedVar);
	u8 origin;
	struct EventObject* obj;

	if (carried == NO_PIECE)
		return;

	origin = GetPieceCell(puzzle, carried); //Never changed while it was carried
	obj = GetPieceObject(puzzle, carried);
	VarSet(puzzle->carriedVar, NO_PIECE);
	SetDrawnOnTop(obj, FALSE, 0);
	PlaceObjectOnCell(puzzle, obj, origin);
	StartGlide(task, puzzle, VarGet(puzzle->cursorVar), origin, FALSE, carried);
	PlaySE(SE_BOARD_PUT_DOWN);
}

static void StartBoardPuzzle(const struct BoardPuzzle* puzzle)
{
	u8 taskId = CreateTask(Task_BoardPuzzle, 80);
	struct Task* task = &gTasks[taskId];
	struct EventObject* cursor = GetObjectByLocalId(puzzle->cursorLocalId);

	task->tPuzzleLo = (u32) puzzle & 0xFFFF;
	task->tPuzzleHi = (u32) puzzle >> 16;

	VarSet(puzzle->carriedVar, NO_PIECE);
	VarSet(puzzle->cursorVar, 0);
	for (u8 piece = 1; piece <= puzzle->numPieces; ++piece) //The NPCs always match the vars
	{
		struct EventObject* obj = GetPieceObject(puzzle, piece);
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

	if (task->tGlideFrames > 0) //Finish the move first
	{
		task->tGlideFrames--;
		UpdateGlide(task, puzzle);
		return;
	}

	if (JOY_NEW(A_BUTTON))
	{
		if (PickUpOrPutDown(puzzle))
		{
			SetDrawnOnTop(GetObjectByLocalId(puzzle->cursorLocalId), FALSE, 0);
			DestroyTask(taskId);
			EnableBothScriptContexts(); //Solved: the script goes on
		}
		return;
	}

	if (JOY_NEW(B_BUTTON))
	{
		PutBack(task, puzzle);
		return;
	}

	dpad = gMain.heldKeys & DPAD_ANY; //Held, so keeping a direction pressed keeps moving
	if (dpad & DPAD_UP)
		TryMoveCursor(task, puzzle, 0, -1, JOY_NEW(DPAD_UP));
	else if (dpad & DPAD_DOWN)
		TryMoveCursor(task, puzzle, 0, 1, JOY_NEW(DPAD_DOWN));
	else if (dpad & DPAD_LEFT)
		TryMoveCursor(task, puzzle, -1, 0, JOY_NEW(DPAD_LEFT));
	else if (dpad & DPAD_RIGHT)
		TryMoveCursor(task, puzzle, 1, 0, JOY_NEW(DPAD_RIGHT));
}

//Rovine Ancestrali puzzle (map 0.5). callasm, then waitstate: the script goes on once it's solved
void BoardPuzzle_StartRovine(void)
{
	StartBoardPuzzle(&sRovinePuzzle);
}
