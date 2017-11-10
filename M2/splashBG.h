
//{{BLOCK(splashBG)

//======================================================================
//
//	splashBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 46 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 1472 + 2048 = 4032
//
//	Time-stamp: 2017-03-16, 15:21:11
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SPLASHBG_H
#define GRIT_SPLASHBG_H

#define splashBGTilesLen 1472
extern const unsigned short splashBGTiles[736];

#define splashBGMapLen 2048
extern const unsigned short splashBGMap[1024];

#define splashBGPalLen 512
extern const unsigned short splashBGPal[256];

#endif // GRIT_SPLASHBG_H

//}}BLOCK(splashBG)
