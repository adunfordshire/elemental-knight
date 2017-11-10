
//{{BLOCK(room2BG)

//======================================================================
//
//	room2BG, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 4 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 128 + 2048 = 2688
//
//	Time-stamp: 2017-04-11, 22:30:28
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_ROOM2BG_H
#define GRIT_ROOM2BG_H

#define room2BGTilesLen 128
extern const unsigned short room2BGTiles[64];

#define room2BGMapLen 2048
extern const unsigned short room2BGMap[1024];

#define room2BGPalLen 512
extern const unsigned short room2BGPal[256];

#endif // GRIT_ROOM2BG_H

//}}BLOCK(room2BG)
