
//{{BLOCK(fileout)

//======================================================================
//
//	fileout, 256x160@4, 
//	+ palette 20 entries, lz77 compressed
//	+ 135 tiles (t|f|p reduced) lz77 compressed
//	+ regular map (flat), lz77 compressed, 32x20 
//	Total size: 40 + 1476 + 476 = 1992
//
//	Time-stamp: 2026-05-31, 20:24:38
//	Exported by Cearn's GBA Image Transmogrifier, v0.9.2
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FILEOUT_H
#define GRIT_FILEOUT_H

#define fileoutTilesLen 1476
extern const unsigned char fileoutTiles[1476];

#define fileoutMapLen 476
extern const unsigned short fileoutMap[238];

#define fileoutPalLen 40
extern const unsigned char fileoutPal[40];

#endif // GRIT_FILEOUT_H

//}}BLOCK(fileout)
