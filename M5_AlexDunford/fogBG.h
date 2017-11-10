
//{{BLOCK(fogBG)

//======================================================================
//
//	fogBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 693 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 22176 + 2048 = 24736
//
//	Time-stamp: 2017-04-24, 18:10:14
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_FOGBG_H
#define GRIT_FOGBG_H

#define fogBGTilesLen 22176
extern const unsigned short fogBGTiles[11088];

#define fogBGMapLen 2048
extern const unsigned short fogBGMap[1024];

#define fogBGPalLen 512
extern const unsigned short fogBGPal[256];

#endif // GRIT_FOGBG_H

//}}BLOCK(fogBG)
