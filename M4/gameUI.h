
//{{BLOCK(gameUI)

//======================================================================
//
//	gameUI, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 13 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 416 + 2048 = 2976
//
//	Time-stamp: 2017-04-04, 10:55:54
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_GAMEUI_H
#define GRIT_GAMEUI_H

#define gameUITilesLen 416
extern const unsigned short gameUITiles[208];

#define gameUIMapLen 2048
extern const unsigned short gameUIMap[1024];

#define gameUIPalLen 512
extern const unsigned short gameUIPal[256];

#endif // GRIT_GAMEUI_H

//}}BLOCK(gameUI)
