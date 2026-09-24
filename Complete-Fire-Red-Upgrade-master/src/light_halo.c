#include "defines.h"
#include "../include/field_weather.h"
#include "../include/gpu_regs.h"
#include "../include/sprite.h"
#include "../include/task.h"
#include "../include/constants/event_object_movement_constants.h"

#include "../include/new/character_customization.h"
#include "../include/new/light_halo.h"
/*
light_halo.c
	handles overworld light halos: NPCs whose graphics use LIGHT_HALO_PAL_TAG.
	Their palette is skipped by the DNS (see BlendFadedPalettes in dns.c) and their
	OAM is semi-transparent, so the map shows through them.
*/

#ifdef LIGHT_HALO_ON_TOP
	#define LIGHT_HALO_PRIORITY 1 //Above the map layers and every normal NPC, but still under the message box on BG0
	#define LIGHT_HALO_SUBPRIORITY 0 //In front of every other sprite
#else
	#define LIGHT_HALO_PRIORITY 2 //Same layer as regular NPCs
	#define LIGHT_HALO_SUBPRIORITY 0xFF //Behind every other NPC, since sprites can't blend with other sprites
#endif

#define LIGHT_HALO_BLDCNT (BLDCNT_TGT2_ALL & ~BLDCNT_TGT2_OBJ) //Semi-transparent sprites always count as the 1st target

//Called every frame from TransferPlttBuffer
void UpdateLightHalos(void)
{
	bool8 haloFound = FALSE;

	if (!FuncIsActiveTask(Task_WeatherMain)) //Not in the overworld
		return;

	for (u32 i = 0; i < EVENT_OBJECTS_COUNT; ++i)
	{
		struct EventObject* eventObj = &gEventObjects[i];
		if (!eventObj->active || eventObj->isPlayer)
			continue;

		NPCPtr graphicsInfo = GetEventObjectGraphicsInfo(GetEventObjectGraphicsId(eventObj));
		if (graphicsInfo->paletteTag1 != LIGHT_HALO_PAL_TAG)
			continue;

		struct Sprite* sprite = &gSprites[eventObj->spriteId];
		eventObj->fixedPriority = TRUE; //Stop the movement code from resorting the halo by its y position
		sprite->oam.priority = LIGHT_HALO_PRIORITY;
		sprite->subpriority = LIGHT_HALO_SUBPRIORITY;
		//Centre the halo on its tile instead of standing on it. Moving halos are left alone,
		//since walking steps are animated through pos2 as well
		if (eventObj->movementType == MOVEMENT_TYPE_NONE)
			sprite->pos2.y = graphicsInfo->height / 2 - 8;
		haloFound = TRUE;
	}

	if (haloFound)
	{
		u16 bldcnt = GetGpuReg(REG_OFFSET_BLDCNT);
		u16 winin = GetGpuReg(REG_OFFSET_WININ);

		//The overworld covers the screen with WIN0 without colour effects, which also disables semi-transparent sprites
		if ((winin & (WININ_WIN0_CLR | WININ_WIN1_CLR)) != (WININ_WIN0_CLR | WININ_WIN1_CLR))
			SetGpuReg(REG_OFFSET_WININ, winin | WININ_WIN0_CLR | WININ_WIN1_CLR);

		//Only take over blending if no layer is blended by something else (weather, hardware fades)
		if ((bldcnt & BLDCNT_TGT1_ALL) == 0)
		{
			u16 bldalpha = BLDALPHA_BLEND(LIGHT_HALO_ALPHA_HALO, LIGHT_HALO_ALPHA_BG);

			if (bldcnt != LIGHT_HALO_BLDCNT)
				SetGpuReg(REG_OFFSET_BLDCNT, LIGHT_HALO_BLDCNT);
			if (GetGpuReg(REG_OFFSET_BLDALPHA) != bldalpha)
				SetGpuReg(REG_OFFSET_BLDALPHA, bldalpha);
		}
	}
}
