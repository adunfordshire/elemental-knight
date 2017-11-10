#include <stdlib.h>
#include "myLib.h"
#include "main.h"
#include "update.h"
#include "draw.h"
#include "sprites.h"
#include "splashBG.h"
#include "gameBG.h"
#include "pauseBG.h"
#include "winBG.h"

/* So far I have implemented moving, changing elements, and attacking enemies with different elements.
    Additionally, there is screen scrolling and a simple background. I have not implemented the collision map yet.
    If you kill all the enemies, you can get to the win screen. 
    I have not implemented collision yet (so you can't get to a lose state, as I am going to go to office hours for assistance regarding the best
    player sprite size and shape to implement that. 
    CONTROLS:
    Use the directional pad to move
    Press A to attack; L and R switches elements BLUE = ICE, RED = FIRE, YELLOW + LIGHTNING
    Depending on the element you have selected when you 'attack,' the corresponding enemy will die:
        ICE KILLS LIGHTNING (YELLOW)
        FIRE KILLS ICE (BLUE)
        LIGHTNING KILLS FIRE (RED)

    Press start to pause; at the pause menu, press start to unpause or A to restart the game
    At the win screen: press start to restart the game
*/

enum {SPLASH, INSTR, GAME, PAUSE, DEATH, WIN};
int state;

OBJ_ATTR shadowOAM[128];

PLAYER player;
ENEMY enemy[NUMENEMY];

int hOff;
int vOff;

int enemiesLeft;

unsigned int buttons;
unsigned int oldButtons;

int main() {

    goToSplash();

    while (1) {
        oldButtons = buttons;
        buttons = BUTTONS;

        switch(state) {
            case SPLASH:
                updateSplash();
                break;
            case INSTR:
                updateInstr();
                break;
            case GAME:
                updateGame();
                break;
            case PAUSE:
                updatePause();
                break;
            case DEATH:
                updateDeath();
                break;
            case WIN:
                updateWin();
                break;
        }
    }
    return 0;
}

void init() {
    vOff = 96;
    hOff = 8;
    enemiesLeft = NUMENEMY;
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
    loadPalette(splashBGPal);
    DMANow(3, splashBGTiles, &CHARBLOCKBASE[0], splashBGTilesLen / 2 | DMA_ON);
    DMANow(3, splashBGMap, &SCREENBLOCKBASE[30], splashBGMapLen / 2 | DMA_ON);

    //Sprite shadowOAM
    DMANow(3, spritesTiles, &CHARBLOCKBASE[4], spritesTilesLen / 2 | DMA_ON);
    DMANow(3, spritesPal, SPRITE_PALETTE, spritesPalLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}
void update() {
    if (enemiesLeft == 0) {
        goToWin();
    }
    updatePlayer(&player);
    updateLocations();
    for (int i = 0; i < NUMENEMY; i++) {
        attackCheck(&player, &enemy[i]);
    }
    player.attack = 0;
}
void draw() {
    drawPlayer(shadowOAM, &player);
    drawEnemy(shadowOAM, enemy, NUMENEMY);
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void goToSplash() {
    init();

    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;

    player.worldRow = 240 - player.height/2;
    player.worldCol = 112;
    player.width = 16;
    player.height = 16;
    player.element = ICE;

    enemy[0].worldRow = 30;
    enemy[0].worldCol = 112;
    enemy[0].element = ICE;
    enemy[0].active = 1;

    enemy[1].worldRow = 60;
    enemy[1].worldCol = 200;
    enemy[1].element = FIRE;
    enemy[1].active = 1;

    enemy[2].worldRow = 60;
    enemy[2].worldCol = 50;
    enemy[2].element = LIGHTNING;
    enemy[2].active = 1;

    state = SPLASH;
}
void goToInstr() {
    //TODO: set instrbg
    state = INSTR;
}
void goToGame() {
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
    loadPalette(gameBGPal);
    DMANow(3, gameBGTiles, &CHARBLOCKBASE[0], gameBGTilesLen / 2 | DMA_ON);
    DMANow(3, gameBGMap, &SCREENBLOCKBASE[30], gameBGMapLen / 2 | DMA_ON);
    state = GAME;
}
void goToPause() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
    loadPalette(pauseBGPal);
    DMANow(3, pauseBGTiles, &CHARBLOCKBASE[0], pauseBGTilesLen / 2 | DMA_ON);
    DMANow(3, pauseBGMap, &SCREENBLOCKBASE[30], pauseBGMapLen / 2 | DMA_ON);
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    state = PAUSE;
}
void goToDeath() {
    //TODO: set Deathbg
    state = DEATH;
}
void goToWin() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
    loadPalette(winBGPal);
    DMANow(3, winBGTiles, &CHARBLOCKBASE[0], winBGTilesLen / 2 | DMA_ON);
    DMANow(3, winBGMap, &SCREENBLOCKBASE[30], winBGMapLen / 2 | DMA_ON);
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    state = WIN;
}

void updateLocations() {
    REG_BG0HOFS = hOff;
    REG_BG0VOFS = vOff;

    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;

    for (int i = 0; i < NUMENEMY; i++) {
        enemy[i].screenRow = enemy[i].worldRow - vOff;
        enemy[i].screenCol = enemy[i].worldCol - hOff;
    }
}

void hideSprites() {
    for (int i = 0; i < 128; i++) {
        shadowOAM[i].attr0 = ATTR0_HIDE;
    }
}