#pragma once

#include "../global.h"

/**
 * \file light_halo.h
 * \brief Contains functions for overworld light halos: NPCs using the palette tag
 *		  LIGHT_HALO_PAL_TAG, which ignore the DNS tint and are drawn semi-transparent.
 */

//Exported Functions
void UpdateLightHalos(void);
