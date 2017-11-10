#include <stdlib.h>
#include "myLib.h"
#include "main.h"
#include "update.h"
#include "draw.h"
#include "sprites.h"
#include "splashBG.h"
#include "gameBG.h"
#include "pauseBG.h"
#include "loseBG.h"
#include "collisionMap.h"
#include "gameUI.h"
#include "instrBG.h"
#include "gameMusic.h"
#include "attackZap.h"

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
    shadowOAM[PLAYERSPRITE].attr2 = (SPRITEOFFSET16((player->currFrame * 4), (player->dir * 4))) | (ATTR2_PALBANK(player->element));
}

void drawEnemy(OBJ_ATTR shadowOAM[], ENEMY enemy[], int enemyLen) {
    for (int i = 0; i < enemyLen; i++) {
        if (enemy[i].active) {
            shadowOAM[ENEMYSPRITE + i].attr0 = (ROWMASK & enemy[i].screenRow);
            shadowOAM[ENEMYSPRITE + i].attr1 = ATTR1_SIZE16 | (ROWMASK & enemy[i].screenCol);
            shadowOAM[ENEMYSPRITE + i].attr2 = SPRITEOFFSET16(enemy[i].currFrame * 2, (8 * 2)) | (ATTR2_PALBANK(enemy[i].element));
        } else {
            shadowOAM[ENEMYSPRITE + i].attr0 = ATTR0_HIDE;
        }
    }
}