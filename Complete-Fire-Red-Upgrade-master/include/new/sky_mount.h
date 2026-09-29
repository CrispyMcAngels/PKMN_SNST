#pragma once

#include "../global.h"

/**
 * \file sky_mount.c
 * \brief Lets the player ride a Pokemon in the sky (VAR_SKY_MOUNT), drawn like the surf blob.
 */

//Exported Functions
bool8 IsSkyMountActive(void);
void SkyMount_TryCreate(void);
void SkyMount_UpdatePlayerSprite(void);
void SkyMount_Start(void);
void SkyMount_End(void);
