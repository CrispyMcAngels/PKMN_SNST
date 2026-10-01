#pragma once

#include "../global.h"

/**
 * \file bg3_parallax.h
 * \brief Contains functions relating to BG3 parallax: an image shown on the bottom
 *		  map layer that scrolls slower than the map, to give a sense of depth.
 */

//Exported Functions
void UpdateParallaxScroll(void);
void TryRefreshParallaxAfterConnection(void);
void TryRefreshParallaxAfterWeatherChange(void);

//Functions Hooked In
void ParallaxDrawMetatile(s32 metatileLayerType, const u16* tiles, u16 offset);
void ParallaxDrawWholeMapView(void);
