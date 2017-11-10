#include <stdlib.h>
#include "main.h"
#include "myLib.h"
#include "update.h"
#include "draw.h"
#include "sprites.h"
#include "splashBG.h"
#include "splash3BG.h"
#include "splash2BG.h"
#include "gameBG.h"
#include "pauseBG.h"
#include "winBG.h"
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

int select = 0;
volatile int dir = 0;

void updateSplash() {
    
    if (select == 0) {
        loadPalette(splash2BGPal);
        DMANow(3, splash2BGTiles, &CHARBLOCKBASE[0], splash2BGTilesLen / 2 | DMA_ON);
        DMANow(3, splash2BGMap, &SCREENBLOCKBASE[30], splash2BGMapLen / 2 | DMA_ON);
        if (BUTTON_PRESSED(BUTTON_A) || BUTTON_PRESSED(BUTTON_START)) {
            goToGame();
        }
    } else {
        loadPalette(splash3BGPal);
        DMANow(3, splash3BGTiles, &CHARBLOCKBASE[0], splash3BGTilesLen / 2 | DMA_ON);
        DMANow(3, splash3BGMap, &SCREENBLOCKBASE[30], splash3BGMapLen / 2 | DMA_ON);
        if (BUTTON_PRESSED(BUTTON_A) || BUTTON_PRESSED(BUTTON_START)) {
            goToInstr();
        }
    }
    if (BUTTON_PRESSED(BUTTON_UP)) {
        select = 0;
    }
    if (BUTTON_PRESSED(BUTTON_DOWN)) {
        select = 1;
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
        if (player->spriteRow > 0 && currCollisionMap[OFFSET(player->spriteRow - 1, player->spriteCol, 256)] 
            && currCollisionMap[OFFSET(player->spriteRow - 1, player->spriteCol + player->width - 1, 256)] 
            && currCollisionMap[OFFSET(player->spriteRow - 1, player->spriteCol + player->width/2 - 1, 256)]) {
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
        if (player->spriteRow < 256 - player->height && currCollisionMap[OFFSET(player->spriteRow + player->width + 1, player->spriteCol, 256)] 
            && currCollisionMap[OFFSET(player->spriteRow + player->height, player->spriteCol + player->width - 1, 256)] 
            && currCollisionMap[OFFSET(player->spriteRow + player->height, player->spriteCol + player->width/2 - 1, 256)]) {
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
        if (player->spriteCol > 0 && currCollisionMap[OFFSET(player->spriteRow, player->spriteCol - 1, 256)] 
            && currCollisionMap[OFFSET(player->spriteRow + player->height - 1, player->spriteCol - 1, 256)]
            && currCollisionMap[OFFSET(player->spriteRow + player->height/2 - 1, player->spriteCol - 1, 256)]) {
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
        if (player->spriteCol < 256 - player->width && currCollisionMap[OFFSET(player->spriteRow, player->spriteCol + player->width, 256)] 
            && currCollisionMap[OFFSET(player->spriteRow + player->height - 1, player->spriteCol + player->width, 256)]
            && currCollisionMap[OFFSET(player->spriteRow + player->height/2 - 1, player->spriteCol + player->width, 256)]) {
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
    if (player->iTimer > 0) {
        player->iTimer--;
    } else {
        player->invuln = 0;
    }
    player->move = 0;
}

void playerAnimate(PLAYER * player) {
    if (player->attackTimer > 0) {
        if (player->attackTimer > 15) {
            player->currFrame = 3;
        } else {
            player->currFrame = 4;
        }
    } else if (player->move) {
        playerWalk(player);
    } else if (player->iTimer > 0) {
        if (player->iTimer % 5 == 0) {
            player->currFrame = 5;
        } else {
            player->currFrame = 6;
        }
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
            if (player->element == FIRE && enemy->element == FIRE) {
                enemyHit(player, enemy);
            } else if (player->element == ICE && enemy->element == ICE) {
                enemyHit(player, enemy);
            } else if (player->element == LIGHTNING && enemy->element == LIGHTNING) {
                enemyHit(player, enemy);
            } else if (player->element == MEGA) {
                enemyHit(player, enemy);
            }
        }
    }
}

void updateEnemy(ENEMY * enemy) {
    if (enemy->hitTimer > 0) {
        enemy->currFrame = 4;
        enemy->hitTimer--;
    } else {
        if (enemy->aniCounter % 15 == 0) {
            enemy->aniCounter = 0;
            if (enemy->currFrame >= 3) {
                enemy->currFrame = 0;
            } else {
                enemy->currFrame++;
            }
        }
        enemy->aniCounter++;
    }
}

void moveBoss(ENEMY * enemy) {
    if (dir == 0) {
        if (enemy->worldCol + enemy->width < 222) {
            enemy->worldCol++;
        } else {
            dir = 1;
            if (enemy->element == LIGHTNING) {
                enemy->element = ICE;
            } else {
                enemy->element++;
            }
        }
    } else if (dir == 1) {
        if (enemy->worldRow + enemy->height < 140) {
            enemy->worldRow++;
        } else {
            dir = 2;
            if (enemy->element == LIGHTNING) {
                enemy->element = ICE;
            } else {
                enemy->element++;
            }
        }
    } else if (dir == 2) {
        if (enemy->worldCol > 16) {
            enemy->worldCol--;
        } else {
            dir = 3;
            if (enemy->element == LIGHTNING) {
                enemy->element = ICE;
            } else {
                enemy->element++;
            }
        }
    } else if (dir == 3) {
        if (enemy->worldRow > 24) {
            enemy->worldRow--;
        } else {
            dir = 0;
            if (enemy->element == LIGHTNING) {
                enemy->element = ICE;
            } else {
                enemy->element++;
            }
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

void updateRoom0(PLAYER * player) {
    if (player->spriteRow <= 4 && player->spriteCol >= 104 && player->spriteCol + player->width < 138) {
        player->prevEntrance = NORTH;
        goToRoom(1);
    }
}
void updateRoom1(PLAYER * player) {
    if (player->spriteRow + player->height >= 150 && player->spriteCol >= 104 && player->spriteCol + player->width <= 138) {
        player->prevEntrance = SOUTH;
        goToRoom(0);
    }
    if (player->spriteRow >= 64 && player->spriteRow + player->height <= 95 && player->spriteCol < 4) {
        player->prevEntrance = WEST;
        goToRoom(2);
    }
    if (player->spriteRow <= 4 && player->spriteCol >= 104 && player->spriteCol + player->width < 138) {
        player->prevEntrance = NORTH;
        goToRoom(3);
    }
    if (player->spriteRow >= 64 && player->spriteRow + player->height <= 95 && player->spriteCol + player->width >= 238) {
        player->prevEntrance = EAST;
        goToRoom(4);
    }
}
void updateRoom2(PLAYER * player) {
    if (player->spriteRow >= 64 && player->spriteRow + player->height <= 95 && player->spriteCol + player->width >= 238) {
        player->prevEntrance = EAST;
        goToRoom(1);
    }
    if (player->spriteRow <= 4 && player->spriteCol >= 104 && player->spriteCol + player->width < 138) {
        player->prevEntrance = NORTH;
        goToRoom(5);
    }
}
void updateRoom3(PLAYER * player) {
    if (player->spriteRow + player->height >= 150 && player->spriteCol >= 104 && player->spriteCol + player->width <= 138) {
        player->prevEntrance = SOUTH;
        goToRoom(1);
    }
}
void updateRoom4(PLAYER * player) {
    if (player->spriteRow >= 64 && player->spriteRow + player->height <= 95 && player->spriteCol < 4) {
        player->prevEntrance = WEST;
        goToRoom(1);
    }
}
void updateRoom5(PLAYER * player) {
    if (player->spriteRow + player->height >= 150 && player->spriteCol >= 104 && player->spriteCol + player->width <= 138) {
        player->prevEntrance = SOUTH;
        goToRoom(2);
    }
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

void enemyHit(PLAYER * player, ENEMY * enemy) {
    enemy->health--;
    enemy->hitTimer = 10;
    if (enemy->health <= 0) {
        enemy->active = 0;
    }
}

void playerHit(PLAYER * player, LIFE life[]) {
    if (!player->invuln) {
        life[player->health].active = 0;
        player->health--;
        // if (player->dir == UP) {
        //     player->worldRow += 20;
        //     player->spriteRow += 20;
        // } else if (player->dir == DOWN) {
        //     player->worldRow -= 20;
        //     player->spriteRow -= 20;
        // } else if (player->dir == LEFT) {
        //     player->worldCol += 20;
        //     player->spriteCol += 20;
        // } else if (player->dir == RIGHT) {
        //     player->worldCol -= 20;
        //     player->spriteCol -= 20;
        // }
        player->invuln = 1;
        player->iTimer = 30;
    }
}