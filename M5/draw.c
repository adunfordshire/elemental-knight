#include <stdlib.h>
#include "myLib.h"
#include "main.h"
#include "update.h"
#include "draw.h"
#include "sprites.h"
#include "splashBG.h"
#include "splash3BG.h"
#include "splash2BG.h"
#include "gameBG.h"
#include "pauseBG.h"
#include "loseBG.h"
#include "collisionMap.h"
#include "room1BG.h"
#include "room1CM.h"
#include "room2BG.h"
#include "room2CM.h"
#include "room3BG.h"
#include "room3CM.h"
#include "room4BG.h"
#include "room4CM.h"
#include "room5BG.h"
#include "room5CM.h"
#include "fogBG.h"
#include "instrBG.h"
#include "gameMusic.h"
#include "attackZap.h"
#include "winSong.h"

void drawPlayer(OBJ_ATTR shadowOAM[], PLAYER * player) {
    if (player->dir == UP) {
        shadowOAM[PLAYERSPRITE].attr0 = (ROWMASK & (player->screenRow - 8));
        shadowOAM[PLAYERSPRITE].attr1 = ATTR1_SIZE32 | (COLMASK & player->screenCol);
    } else if (player->dir == DOWN) {
        shadowOAM[PLAYERSPRITE].attr0 = (ROWMASK & (player->screenRow + 8));
        shadowOAM[PLAYERSPRITE].attr1 = ATTR1_SIZE32 | (COLMASK & player->screenCol);
    } else if (player->dir == LEFT) {
        shadowOAM[PLAYERSPRITE].attr0 = (ROWMASK & (player->screenRow));
        shadowOAM[PLAYERSPRITE].attr1 = ATTR1_SIZE32 | (COLMASK & (player->screenCol - 8));
    } else if (player->dir == RIGHT) {
        shadowOAM[PLAYERSPRITE].attr0 = (ROWMASK & (player->screenRow));
        shadowOAM[PLAYERSPRITE].attr1 = ATTR1_SIZE32 | (COLMASK & (player->screenCol + 8));
    }
    shadowOAM[PLAYERSPRITE].attr2 = (SPRITEOFFSET16((player->currFrame * 4), (player->dir * 4))) | (ATTR2_PALBANK(player->element)) | ATTR2_PRIORITY(2);
}

void drawEnemy(OBJ_ATTR shadowOAM[], ENEMY enemy[], int enemyLen) {
    for (int i = 0; i < enemyLen; i++) {
        if (enemy[i].active) {
            shadowOAM[ENEMYSPRITE + i].attr0 = (ROWMASK & enemy[i].screenRow);
            if (!enemy[i].type) {
                shadowOAM[ENEMYSPRITE + i].attr1 = ATTR1_SIZE16 | (ROWMASK & enemy[i].screenCol);
                shadowOAM[ENEMYSPRITE + i].attr2 = SPRITEOFFSET16(enemy[i].currFrame * 2, (8 * 2)) | (ATTR2_PALBANK(enemy[i].element)) | ATTR2_PRIORITY(2);
            } else {
                shadowOAM[ENEMYSPRITE + i].attr1 = ATTR1_SIZE32 | (ROWMASK & enemy[i].screenCol);
                shadowOAM[ENEMYSPRITE + i].attr2 = SPRITEOFFSET16(enemy[i].currFrame * 4, (9 * 2)) | (ATTR2_PALBANK(enemy[i].element)) | ATTR2_PRIORITY(2);
            }
        } else {
            shadowOAM[ENEMYSPRITE + i].attr0 = ATTR0_HIDE;
        }
    }
}

void drawLife(OBJ_ATTR shadowOAM[], LIFE life[]) {
    for (int i = 0; i < 4; i++) {
        if (life[i].active) {
            shadowOAM[4 + i].attr0 = (ROWMASK & life[i].screenRow);
            shadowOAM[4 + i].attr1 = ATTR1_SIZE16 | (ROWMASK & life[i].screenCol);
            shadowOAM[4 + i].attr2 = SPRITEOFFSET16(5 * 2, (8  * 2)) | (ATTR2_PALBANK(3));
        } else {
            shadowOAM[4 + i].attr0 = ATTR0_HIDE;
        }
    }
}