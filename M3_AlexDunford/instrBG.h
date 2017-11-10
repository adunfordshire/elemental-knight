
//{{BLOCK(instrBG)

//======================================================================
//
//	instrBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 182 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 5824 + 2048 = 8384
//
//	Time-stamp: 2017-04-04, 22:10:15
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRBG_H
#define GRIT_INSTRBG_H

#define instrBGTilesLen 5824
extern const unsigned short instrBGTiles[2912];

#define instrBGMapLen 2048
extern const unsigned short instrBGMap[1024];

#define instrBGPalLen 512
extern const unsigned short instrBGPal[256];

#endif // GRIT_INSTRBG_H

//}}BLOCK(instrBG)
