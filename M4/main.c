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

/* Okay basically all of the game mechanics are there, but a few are not implemented correctly.
    Namely:
        * entering a new room should also update to a collision map. I need to reqwrite my collision code to allow for changes
        * the win condition is still reliant on total enemies killed, but that isn't really the end game condition
        * Player character still needs an attack animation
        * Player should not die instantly when touching enemies. I need some iFrame implementation
    I believe I have an okay system down for switching between rooms. I may streamline the code to fewer functions when I get everything else working.
    I will add at least two more enemy types to the final game, but the skull ones are useful for testing and I like their art well enough
    There are some sound issues I need to correct (sound not pausing on pause screen).
Some plans for polish:
    * actual dungeon textures
    * finished dungeon with boss
    * multiple other enemies
    * enemy movement
    * player attack animation
    * sounds to indicate damage
    * knockback/other effects to indicate damage
    * hand-drawn title and other screens
    * menu selection with d-pad
    * dungeon fog with transparency
    * enemy death animation (shrinking or poof or something)
*/

void (*state)();
void (*room)(PLAYER * player);

OBJ_ATTR shadowOAM[128];

PLAYER player;
ENEMY enemy[NUMENEMY];

SOUND soundA;
SOUND soundB;

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

        state();
    }
    return 0;
}

void init() {
    setupInterrupts();
    setupSounds();

    enemiesLeft = NUMENEMY;

    //Sprite shadowOAM
    DMANow(3, spritesTiles, &CHARBLOCKBASE[4], spritesTilesLen / 2 | DMA_ON);
    DMANow(3, spritesPal, SPRITE_PALETTE, spritesPalLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
}
void update() {
    room(&player);

    if (player.health <= 0) {
        goToDeath();
    }
    if (enemiesLeft == 0) {
        goToWin();
    }
    updatePlayer(&player);
    updateLocations();
    for (int i = 0; i < NUMENEMY; i++) {
        updateEnemy(&enemy[i]);
        if (enemy[i].active) {
            if (playerEnemyCollision(&player, &enemy[i])) {
                player.health--;
            }
        }
    }
    if (player.attack) {
        for (int i = 0; i < NUMENEMY; i++) {
            attackCheck(&player, &enemy[i]);
        }
        player.attack = 0;
    }
}
void draw() {
    drawPlayer(shadowOAM, &player);
    drawEnemy(shadowOAM, enemy, NUMENEMY);
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void goToSplash() {
    init();

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
    loadPalette(splashBGPal);
    DMANow(3, splashBGTiles, &CHARBLOCKBASE[0], splashBGTilesLen / 2 | DMA_ON);
    DMANow(3, splashBGMap, &SCREENBLOCKBASE[30], splashBGMapLen / 2 | DMA_ON);

    state = updateSplash;
}
void goToInstr() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
    loadPalette(instrBGPal);
    DMANow(3, instrBGTiles, &CHARBLOCKBASE[0], instrBGTilesLen / 2 | DMA_ON);
    DMANow(3, instrBGMap, &SCREENBLOCKBASE[30], instrBGMapLen / 2 | DMA_ON);
    state = updateInstr;
}
void goToGame() {
    REG_DISPCTL = MODE0 | BG0_ENABLE  | SPRITE_ENABLE;

    playSoundA(gameMusic, GAMEMUSICLEN, GAMEMUSICFREQ, 1);

    goToRoom(0);
}
void goToPause() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
    loadPalette(pauseBGPal);
    DMANow(3, pauseBGTiles, &CHARBLOCKBASE[0], pauseBGTilesLen / 2 | DMA_ON);
    DMANow(3, pauseBGMap, &SCREENBLOCKBASE[30], pauseBGMapLen / 2 | DMA_ON);
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;
    state = updatePause;
}
void goToDeath() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
    loadPalette(loseBGPal);
    DMANow(3, loseBGTiles, &CHARBLOCKBASE[0], loseBGTilesLen / 2 | DMA_ON);
    DMANow(3, loseBGMap, &SCREENBLOCKBASE[30], loseBGMapLen / 2 | DMA_ON);
    state = updateDeath;
}
void goToWin() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
    loadPalette(winBGPal);
    DMANow(3, winBGTiles, &CHARBLOCKBASE[0], winBGTilesLen / 2 | DMA_ON);
    DMANow(3, winBGMap, &SCREENBLOCKBASE[30], winBGMapLen / 2 | DMA_ON);
    REG_BG0HOFS = 0;
    REG_BG0VOFS = 0;

    state = updateWin;
}

void goToRoom(int roomNum) {
    if (roomNum == 0) {
        REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
        REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(29);
        loadPalette(gameBGPal);
        DMANow(3, gameBGTiles, &CHARBLOCKBASE[1], gameBGTilesLen / 2 | DMA_ON);
        DMANow(3, gameBGMap, &SCREENBLOCKBASE[29], gameBGMapLen / 2 | DMA_ON);

        REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
        DMANow(3, gameUITiles, &CHARBLOCKBASE[0], gameUITilesLen / 2 | DMA_ON);
        DMANow(3, gameUIMap, &SCREENBLOCKBASE[30], gameUIMapLen / 2 | DMA_ON);

        vOff = 96;
        hOff = 8;

        REG_BG0HOFS = 0;
        REG_BG0VOFS = 0;

        player.width = 16;
        player.height = 16;
        player.worldRow = 256 - player.height - 8;
        player.worldCol = 256 / 2 - player.width;
        player.spriteRow = player.worldRow + 8;
        player.spriteCol = player.worldCol + 8;
        player.dir = UP;
        player.element = ICE;
        player.health = 3;
        player.aniSwap = 1;

        enemy[0].worldRow = 30;
        enemy[0].worldCol = 112;
        enemy[0].width = 16;
        enemy[0].height = 16;
        enemy[0].element = LIGHTNING;
        enemy[0].active = 1;

        enemy[1].worldRow = 60;
        enemy[1].worldCol = 200;
        enemy[1].width = 16;
        enemy[1].height = 16;
        enemy[1].element = ICE;
        enemy[1].active = 1;

        enemy[2].worldRow = 60;
        enemy[2].worldCol = 50;
        enemy[2].width = 16;
        enemy[2].height = 16;
        enemy[2].element = FIRE;
        enemy[2].active = 1;

        currRoom = 0;

        room = updateRoom0;
        state = updateGame;
    } else if (roomNum == 1) {
        REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
        REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(29);
        loadPalette(room1BGPal);
        DMANow(3, room1BGTiles, &CHARBLOCKBASE[1], room1BGTilesLen / 2 | DMA_ON);
        DMANow(3, room1BGMap, &SCREENBLOCKBASE[29], room1BGMapLen / 2 | DMA_ON);

        REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
        DMANow(3, gameUITiles, &CHARBLOCKBASE[0], gameUITilesLen / 2 | DMA_ON);
        DMANow(3, gameUIMap, &SCREENBLOCKBASE[30], gameUIMapLen / 2 | DMA_ON);

        vOff = 0;
        hOff = 0;

        REG_BG0HOFS = 0;
        REG_BG0VOFS = 0;
        player.worldRow = 160 - player.height - 28;
        player.worldCol = 256 / 2 - player.width;
        player.spriteRow = player.worldRow + 8;
        player.spriteCol = player.worldCol + 8;

        enemy[0].worldRow = 30;
        enemy[0].worldCol = 112;
        enemy[0].width = 16;
        enemy[0].height = 16;
        enemy[0].element = LIGHTNING;
        enemy[0].active = 1;

        enemy[1].worldRow = 60;
        enemy[1].worldCol = 200;
        enemy[1].width = 16;
        enemy[1].height = 16;
        enemy[1].element = ICE;
        enemy[1].active = 1;

        enemy[2].worldRow = 60;
        enemy[2].worldCol = 50;
        enemy[2].width = 16;
        enemy[2].height = 16;
        enemy[2].element = FIRE;
        enemy[2].active = 1;

        currRoom = 1;

        room = updateRoom1;
        state = updateGame;
    } else if (roomNum == 2) {
        REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
        REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(29);
        loadPalette(room2BGPal);
        DMANow(3, room2BGTiles, &CHARBLOCKBASE[1], room2BGTilesLen / 2 | DMA_ON);
        DMANow(3, room2BGMap, &SCREENBLOCKBASE[29], room2BGMapLen / 2 | DMA_ON);
        room = updateRoom2;
        state = updateGame;
    } else if (roomNum == 3) {
        //room 3 not implemented: boss room
    } else if (roomNum == 4) {
        REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
        REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(29);
        loadPalette(room4BGPal);
        DMANow(3, room4BGTiles, &CHARBLOCKBASE[1], room4BGTilesLen / 2 | DMA_ON);
        DMANow(3, room4BGMap, &SCREENBLOCKBASE[29], room4BGMapLen / 2 | DMA_ON);
        room = updateRoom4;
        state = updateGame;
    }
}

void updateLocations() {
    REG_BG1HOFS = hOff;
    REG_BG1VOFS = vOff;
    
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

void setupSounds()
{
    REG_SOUNDCNT_X = SND_ENABLED;

    REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_TO_BOTH | 
                     DSA_TIMER0 | 
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 | 
                     DSB_OUTPUT_TO_BOTH | 
                     DSB_TIMER1 | 
                     DSB_FIFO_RESET;

    REG_SOUNDCNT_L = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency, int loops) {
        dma[1].cnt = 0;
    
        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
    
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
    
        REG_TM0CNT = 0;
    
        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;
    
        //TODO: FINISH THIS FUNCTION
        // Assign all the appropriate struct values (excluding priority)
        soundA.isPlaying = 1;
        soundA.length = length;
        soundA.data = sound;
        soundA.frequency = frequency;
        soundA.loops = loops;
        soundA.duration = ((VBLANK_FREQ * length) / frequency);
        soundA.vbCount = 0;
}

void playSoundB( const unsigned char* sound, int length, int frequency, int loops) {

        dma[2].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
    
        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;
    
        // TODO: FINISH THIS FUNCTION
        // Assign all the appropriate struct values
        soundB.isPlaying = 1;
        soundB.length = length;
        soundB.data = sound;
        soundB.frequency = frequency;
        soundB.loops = loops;
        soundB.duration = ((VBLANK_FREQ * length) / frequency);
        soundB.vbCount = 0;
}

void pauseSound()
{
    // TODO: WRITE THIS FUNCTION
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    REG_TM0CNT = 0;
    REG_TM1CNT = 0;
}

void unpauseSound()
{
    // TODO: WRITE THIS FUNCTION
    soundA.isPlaying = 1;
    soundB.isPlaying = 1;
    REG_TM0CNT = TIMER_ON;
    REG_TM1CNT = TIMER_ON;
}

void stopSound()
{
    // TODO: WRITE THIS FUNCTION
    dma[1].cnt = 0;
    soundA.isPlaying = 0;
    REG_TM0CNT = 0;
    dma[2].cnt = 0;
    soundB.isPlaying = 0;
    REG_TM1CNT = 0;
}

void setupInterrupts()
{
    REG_IME = 0;
    // TODO: SET UP THE INTERRUPT HANDLER HERE
    // HINT: THERE IS A REGISTER THAT NEEDS TO POINT TO A INTERRUPT FUNCTION
    // HINT: THAT INTERRUPT FUNCTION HAS TO BE CAST TO SOMETHING...
    REG_INTERRUPT = (unsigned int)interruptHandler;
    REG_IE |= INT_VBLANK;
    REG_DISPSTAT |= INT_VBLANK_ENABLE;
    REG_IME = 1;
}

void interruptHandler()
{
    REG_IME = 0;
    if(REG_IF & INT_VBLANK)
    {
        //TODO: FINISH THIS FUNCTION
        // This should be where you determine if a sound if finished or not
        if (soundA.isPlaying) {
            soundA.vbCount++;
            if (soundA.vbCount > soundA.duration) {
                if (soundA.loops) {
                    playSoundA(soundA.data, soundA.length, soundA.frequency, soundA.loops);
                } else {
                    dma[1].cnt = 0;
                    soundA.isPlaying = 0;
                    REG_TM0CNT = 0;
                }
            }
        }
        if (soundB.isPlaying) {
            soundB.vbCount++;
            if (soundB.vbCount > soundB.duration) {
                if (soundB.loops) {
                    playSoundB(soundB.data, soundB.length, soundB.frequency, soundB.loops);
                } else {
                    dma[2].cnt = 0;
                    soundB.isPlaying = 0;
                    REG_TM1CNT = 0;
                }
            }
        }

        REG_IF = INT_VBLANK; 
    }

    REG_IME = 1;
}