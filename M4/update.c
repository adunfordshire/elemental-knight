#include <stdlib.h>
#include "main.h"
#include "myLib.h"
#include "update.h"
#include "draw.h"
#include "sprites.h"
#include "splashBG.h"
#include "gameBG.h"
#include "pauseBG.h"
#include "winBG.h"
#include "loseBG.h"
#include "collisionMap.h"
#include "room1BG.h"
#include "room1CM.h"
#include "room2BG.h"
#include "room2CM.h"
#include "room4BG.h"
#include "room4CM.h"
#include "gameUI.h"
#include "instrBG.h"
#include "gameMusic.h"
#include "attackZap.h"

void updateSplash() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstr();
    }
}
void updateInstr() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToSplash();
    }
}

void updateGame() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
    }
    update();
    draw();
    waitForVblank();
}

void updatePlayer(PLAYER * player) {
    if (player->dir == UP) {
        player->attackRow = player->spriteRow - 16;
        player->attackCol = player->spriteCol - 8;
        player->attackHeight = 16;
        player->attackWidth = 32;
    } else if (player->dir == DOWN) {
        player->attackRow = player->spriteRow + 16;
        player->attackCol = player->spriteCol - 8;
        player->attackHeight = 16;
        player->attackWidth = 32;
    } else if (player->dir == LEFT) {
        player->attackRow = player->spriteRow - 8;
        player->attackCol = player->spriteCol - 16;
        player->attackHeight = 32;
        player->attackWidth = 16;
    } else if (player->dir == RIGHT) {
        player->attackRow = player->spriteRow - 8;
        player->attackCol = player->spriteCol + 16;
        player->attackHeight = 32;
        player->attackWidth = 16;
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        playSoundB(attackZap, ATTACKZAPLEN, ATTACKZAPFREQ, 0);
        player->attackTimer = 20;
        player->attack = 1;
    }
    if (BUTTON_PRESSED(BUTTON_R)) {
        if (player->element == LIGHTNING) {
            player->element = ICE;
        } else {
            player->element++;
        }
    }
    if (BUTTON_PRESSED(BUTTON_L)) {
        if (player->element == ICE) {
            player->element = LIGHTNING;
        } else {
            player->element--;
        }
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        player->element = MEGA;
    }
    if (BUTTON_HELD(BUTTON_UP)) {
        player->dir = UP;
        if (player->spriteRow > 0 && collisionMapBitmap[OFFSET(player->spriteRow - 1, player->spriteCol, 256)] 
            && collisionMapBitmap[OFFSET(player->spriteRow - 1, player->spriteCol + player->width - 1, 256)] 
            && collisionMapBitmap[OFFSET(player->spriteRow - 1, player->spriteCol + player->width/2 - 1, 256)]) {
            if (player->screenRow < 160 / 2 - player->height / 2 && vOff > 0) {
                vOff--;
            }
            player->worldRow--;
            player->spriteRow--;
        }
        player->move = 1;
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        player->dir = DOWN;
        if (player->spriteRow < 256 - player->height && collisionMapBitmap[OFFSET(player->spriteRow + player->width + 1, player->spriteCol, 256)] 
            && collisionMapBitmap[OFFSET(player->spriteRow + player->height, player->spriteCol + player->width - 1, 256)] 
            && collisionMapBitmap[OFFSET(player->spriteRow + player->height, player->spriteCol + player->width/2 - 1, 256)]) {
            if (player->screenRow > 160 / 2 - player->height / 2 && vOff < 96) {
                vOff++;
            }
            player->worldRow++;
            player->spriteRow++;
        }
        player->move = 1;
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        player->dir = LEFT;
        if (player->spriteCol > 0 && collisionMapBitmap[OFFSET(player->spriteRow, player->spriteCol - 1, 256)] 
            && collisionMapBitmap[OFFSET(player->spriteRow + player->height - 1, player->spriteCol - 1, 256)]
            && collisionMapBitmap[OFFSET(player->spriteRow + player->height/2 - 1, player->spriteCol - 1, 256)]) {
            if (player->screenCol < 240 / 2 - player->width / 2 && hOff > 0) {
                hOff--;
            }
            player->worldCol--;
            player->spriteCol--;
        }
        player->move = 1;
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player->dir = RIGHT;
        if (player->spriteCol < 256 - player->width && collisionMapBitmap[OFFSET(player->spriteRow, player->spriteCol + player->width, 256)] 
            && collisionMapBitmap[OFFSET(player->spriteRow + player->height - 1, player->spriteCol + player->width, 256)]
            && collisionMapBitmap[OFFSET(player->spriteRow + player->height/2 - 1, player->spriteCol + player->width, 256)]) {
            if (player->screenCol > 240 / 2 - player->width / 2 && hOff < 16) {
                hOff++;
            }
            player->worldCol++;
            player->spriteCol++;
        }
        player->move = 1;
    }

    playerAnimate(player);

    if (player->attackTimer > 0) {
        player->attackTimer--;
    }
    player->move = 0;
}

void playerAnimate(PLAYER * player) {
    if (player->move) {
        playerWalk(player);
    } else if (player->attackTimer > 0) {
        player->currFrame = 3;
    } else {
        player->currFrame = 0;
    }
}

void playerWalk(PLAYER * player) {
    if (player->aniCounter % 10 == 0) {
        player->aniCounter = 0;
        if (player->currFrame != 0) {
            player->currFrame = 0;
            player->aniSwap = -player->aniSwap;
        } else {
            if (player->aniSwap == 1) {
                player->currFrame = 2;
            } else if (player->aniSwap == -1) {
                player->currFrame = 1;
            }
        }
    }
    player->aniCounter++;
}

void attackCheck(PLAYER * player, ENEMY * enemy) {
    //TODO: add collision
    if (player->attackCol <= enemy->worldCol + enemy->width 
        && player->attackCol + player->attackWidth >= enemy->worldCol 
        && player->attackRow + player->attackHeight >= enemy->worldRow
        && player->attackRow <= enemy->worldRow + enemy->height) {
        if (enemy->active) {
            if (player->element == FIRE && enemy->element == ICE) {
                enemy->active = 0;
                enemiesLeft--;
            } else if (player->element == ICE && enemy->element == LIGHTNING) {
                enemy->active = 0;
                enemiesLeft--;
            } else if (player->element == LIGHTNING && enemy->element == FIRE) {
                enemy->active = 0;
                enemiesLeft--;
            } else if (player->element == MEGA) {
                enemy->active = 0;
                enemiesLeft--;
            }
        }
    }
}

void updateEnemy(ENEMY * enemy) {
    if (enemy->aniCounter % 15 == 0) {
        enemy->aniCounter = 0;
        if (enemy->currFrame == 3) {
         enemy->currFrame = 0;
        } else {
            enemy->currFrame++;
        }
    }
    enemy->aniCounter++;
}

void updatePause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToRoom(currRoom);
    }
    if (BUTTON_PRESSED(BUTTON_A)) {
        goToSplash();
    }
}
void updateDeath() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToSplash();
    }
}
void updateWin() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToSplash();
    }
}

void updateRoom0(PLAYER * player) {
    if (player->spriteRow < 16 && player->spriteCol > 111 && player->spriteCol + player->width < 144) {
        goToRoom(1);
    }
}
void updateRoom1(PLAYER * player) {
    if (player->spriteRow + player->height > 150 && player->spriteCol > 111 && player->spriteCol + player->width < 144) {
        goToRoom(0);
    }
}
void updateRoom2(PLAYER * player) {

}
void updateRoom4(PLAYER * player) {

}

int playerEnemyCollision(PLAYER * player, ENEMY * enemy) {
    if(player->spriteCol < enemy->worldCol + enemy->width
        && player->spriteCol + player->width > enemy->worldCol
        && player->spriteRow < enemy->worldRow + enemy->height
        && player->spriteRow + player->height > enemy->worldRow) {
        return 1;
    }
    return 0;
}