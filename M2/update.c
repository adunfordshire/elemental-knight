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

enum {DOWN, UP, RIGHT, LEFT, ATTACK};

void updateSplash() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToInstr();
    }
}
void updateInstr() {
    if (BUTTON_PRESSED(BUTTON_A)) {
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
    if (BUTTON_PRESSED(BUTTON_A)) {
        playerAttack(player);
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
    if (BUTTON_HELD(BUTTON_UP)) {
        player->dir = UP;
        if (player->worldRow > 0) {
            if (player->screenRow < 160 / 2 - player->height / 2 && vOff > 0) {
                vOff--;
            }
            player->worldRow--;
        }
        player->move = 1;
    }
    if (BUTTON_HELD(BUTTON_DOWN)) {
        player->dir = DOWN;
        if (player->worldRow < 256 - player->height) {
            if (player->screenRow > 160 / 2 - player->height / 2 && vOff < 96) {
                vOff++;
            }
            player->worldRow++;
        }
        player->move = 1;
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
        player->dir = LEFT;
        if (player->worldCol > 0) {
            if (player->screenCol < 240 / 2 - player->width / 2 && hOff > 0) {
                hOff--;
            }
            player->worldCol--;
        }
        player->move = 1;
    }
    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player->dir = RIGHT;
        if (player->worldCol < 256 - player->width) {
            if (player->screenCol > 240 / 2 - player->width / 2 && hOff < 16) {
                hOff++;
            }
            player->worldCol++;
        }
        player->move = 1;
    }
    if (player->move) {
        playerWalk(player);
    } else {
        player->currFrame = 0;
    }
    player->move = 0;
}

void playerWalk(PLAYER * player) {
    if (player->aniCounter % 20 == 0) {
        player->aniCounter = 0;
        if (player->currFrame == 2) {
            player->currFrame = 0;
        } else {
            player->currFrame++;
        }
    }
    player->aniCounter++;
}

void playerAttack(PLAYER * player) {
    //TODO: player attack animation
    player->attack = 1;
}

void attackCheck(PLAYER * player, ENEMY * enemy) {
    //TODO: add collision
    if (enemy->active && player->attack) {
        if (player->element == FIRE && enemy->element == ICE) {
            enemy->active = 0;
            enemiesLeft--;
        } else if (player->element == ICE && enemy->element == LIGHTNING) {
            enemy->active = 0;
            enemiesLeft--;
        } else if (player->element == LIGHTNING && enemy->element == FIRE) {
            enemy->active = 0;
            enemiesLeft--;
        }
    }
}

void updatePause() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
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