
//{{BLOCK(instrBG)

//======================================================================
//
//	instrBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 232 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 7424 + 2048 = 9984
//
//	Time-stamp: 2017-04-24, 23:32:34
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRBG_H
#define GRIT_INSTRBG_H

#define instrBGTilesLen 7424
extern const unsigned short instrBGTiles[3712];

#define instrBGMapLen 2048
extern const unsigned short instrBGMap[1024];

#define instrBGPalLen 512
extern const unsigned short instrBGPal[256];

#endif // GRIT_INSTRBG_H

//}}BLOCK(instrBG)
