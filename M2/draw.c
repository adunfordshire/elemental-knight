#include <stdlib.h>
#include "myLib.h"
#include "main.h"
#include "update.h"
#include "draw.h"
#include "sprites.h"
#include "splashBG.h"
#include "gameBG.h"
#include "pauseBG.h"

void drawPlayer(OBJ_ATTR shadowOAM[], PLAYER * player) {
    shadowOAM[PLAYERSPRITE].attr0 = (ROWMASK & player->screenRow);
    shadowOAM[PLAYERSPRITE].attr1 = ATTR1_SIZE16 | (COLMASK & player->screenCol);
    shadowOAM[PLAYERSPRITE].attr2 = SPRITEOFFSET16((player->element * 6) + player->currFrame * 2, player->dir * 2);
}

void drawEnemy(OBJ_ATTR shadowOAM[], ENEMY enemy[], int enemyLen) {
    for (int i = 0; i < enemyLen; i++) {
        if (enemy[i].active) {
            shadowOAM[ENEMYSPRITE + i].attr0 = (ROWMASK & enemy[i].screenRow);
            shadowOAM[ENEMYSPRITE + i].attr1 = ATTR1_SIZE16 | (ROWMASK & enemy[i].screenCol);
            shadowOAM[ENEMYSPRITE + i].attr2 = SPRITEOFFSET16(0, (enemy[i].element + 4) * 2);
        } else {
            shadowOAM[ENEMYSPRITE + i].attr0 = ATTR0_HIDE;
        }
    }
}