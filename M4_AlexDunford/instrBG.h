
//{{BLOCK(instrBG)

//======================================================================
//
//	instrBG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 212 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 6784 + 2048 = 9344
//
//	Time-stamp: 2017-04-11, 23:43:36
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRBG_H
#define GRIT_INSTRBG_H

#define instrBGTilesLen 6784
extern const unsigned short instrBGTiles[3392];

#define instrBGMapLen 2048
extern const unsigned short instrBGMap[1024];

#define instrBGPalLen 512
extern const unsigned short instrBGPal[256];

#endif // GRIT_INSTRBG_H

//}}BLOCK(instrBG)
