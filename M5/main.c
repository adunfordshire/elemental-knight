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

/*
    Kill the boss at the end of the dungeon! You can keep walking forward to get to the boss room or you can explore the dungeon and see the other rooms that I didn't add anything fun to!
    Change your element to match the enemy in order to damage it!

    Special features:
        Alpha Blending with fog in the dungeon
        Sprite palette swapping with element changes
        function pointers for states (Twice! 1 set for the actual game states and another for the different room update functions)
        All hand-drawn custom art! Please dont judge my dungeon for looking awful :(
        Boss movement pattern - Scary!
        Hit indication by flashing! Wow!

        Music and sound is not custom:
            Dungeon Song: Magnus Pålsson - Pushing Onwards
            Attack sound: some random sound from Fire Emblem
            Win song: another random sound from Fire Emblem
*/

void (*state)();
void (*room)(PLAYER * player);

OBJ_ATTR shadowOAM[128];

PLAYER player;
ENEMY enemy[NUMENEMY];
LIFE life[4];

SOUND soundA;
SOUND soundB;

int hOff;
int vOff;
int h0Off;
int v0Off;

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
    stopSound();
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
                playerHit(&player, life);
            }
        }
    }
    if (player.attack) {
        for (int i = 0; i < NUMENEMY; i++) {
            attackCheck(&player, &enemy[i]);
        }
        player.attack = 0;
    }
    if (currRoom == 3) {
        moveBoss(&enemy[0]);
        if (!enemy[0].active) {
            goToWin();
        }
    }
    v0Off--;
    REG_BG0HOFS = h0Off;
    REG_BG0VOFS = v0Off/3;
}
void draw() {
    drawPlayer(shadowOAM, &player);
    drawEnemy(shadowOAM, enemy, NUMENEMY);
    drawLife(shadowOAM, life);
    DMANow(3, shadowOAM, OAM, 128 * 4);
}

void goToSplash() {
    init();

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
    loadPalette(splashBGPal);
    DMANow(3, splashBGTiles, &CHARBLOCKBASE[0], splashBGTilesLen / 2 | DMA_ON);
    DMANow(3, splashBGMap, &SCREENBLOCKBASE[30], splashBGMapLen / 2 | DMA_ON);

    vOff = 0;
    hOff = 0;
    REG_BG1HOFS = hOff;
    REG_BG1VOFS = vOff;

    REG_BLDMOD = 0;
    REG_COLEV = 0;

    life[0].active = 0;
    life[1].screenRow = 2;
    life[1].screenCol = 0;
    life[1].active = 1;
    life[2].screenRow = 2;
    life[2].screenCol = 16;
    life[2].active = 1;
    life[3].screenRow = 2;
    life[3].screenCol = 32;
    life[3].active = 1;

    player.prevEntrance = NORTH;
    currRoom = 0;

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
    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(29) | 2;
    REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30) | 1;
        DMANow(3, fogBGTiles, &CHARBLOCKBASE[0], fogBGTilesLen / 2 | DMA_ON);
        DMANow(3, fogBGMap, &SCREENBLOCKBASE[30], fogBGMapLen / 2 | DMA_ON);

        REG_BLDMOD = OBJ_B | BG1_B | BG0_A | BACKDROP_B | NORMAL_TRANS;
        REG_COLEV = WEIGHTOFA(2) | WEIGHTOFB(16);

    playSoundA(gameMusic, GAMEMUSICLEN, GAMEMUSICFREQ, 1);

    goToRoom(currRoom);
}
void goToPause() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
    loadPalette(pauseBGPal);
    DMANow(3, pauseBGTiles, &CHARBLOCKBASE[0], pauseBGTilesLen / 2 | DMA_ON);
    DMANow(3, pauseBGMap, &SCREENBLOCKBASE[30], pauseBGMapLen / 2 | DMA_ON);

    v0Off = 0;
    h0Off = 0;

    REG_BG0HOFS = v0Off;
    REG_BG0VOFS = h0Off;

    REG_BLDMOD = 0;
    REG_COLEV = 0;

    state = updatePause;
}
void goToDeath() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
    loadPalette(loseBGPal);
    DMANow(3, loseBGTiles, &CHARBLOCKBASE[0], loseBGTilesLen / 2 | DMA_ON);
    DMANow(3, loseBGMap, &SCREENBLOCKBASE[30], loseBGMapLen / 2 | DMA_ON);

    v0Off = 0;
    h0Off = 0;

    REG_BG0HOFS = v0Off;
    REG_BG0VOFS = h0Off;

    REG_BLDMOD = 0;
    REG_COLEV = 0;

    stopSound();

    state = updateDeath;
}
void goToWin() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE0 | CBB(0) | SBB(30);
    loadPalette(winBGPal);
    DMANow(3, winBGTiles, &CHARBLOCKBASE[0], winBGTilesLen / 2 | DMA_ON);
    DMANow(3, winBGMap, &SCREENBLOCKBASE[30], winBGMapLen / 2 | DMA_ON);

    v0Off = 0;
    h0Off = 0;

    REG_BG0HOFS = v0Off;
    REG_BG0VOFS = h0Off;

    REG_BLDMOD = 0;
    REG_COLEV = 0;

    playSoundA(winSong, WINSONGLEN, WINSONGFREQ, 0);

    state = updateWin;
}

void goToRoom(int roomNum) {
    if (roomNum == 0) {
        REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
        REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(29) | 2;
        loadPalette(gameBGPal);
        DMANow(3, gameBGTiles, &CHARBLOCKBASE[1], gameBGTilesLen / 2 | DMA_ON);
        DMANow(3, gameBGMap, &SCREENBLOCKBASE[29], gameBGMapLen / 2 | DMA_ON);

        REG_BG0HOFS = 0;
        REG_BG0VOFS = 0;

        if (player.prevEntrance == SOUTH) {
            vOff = 0;
            hOff = 0;
            enterPlacement(&player);
        } else {
            vOff = 96;
            hOff = 8;
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
            player.invuln = 0;
            player.prevEntrance = NORTH;
            player.iTimer = 0;
            player.attackTimer = 0;
        }

        enemy[0].worldRow = 60;
        enemy[0].worldCol = 116;
        enemy[0].width = 16;
        enemy[0].height = 16;
        enemy[0].element = LIGHTNING;
        enemy[0].health = 1;
        enemy[0].active = 1;
        enemy[0].type = 0;
        enemy[0].hitTimer = 0;

        enemy[1].worldRow = 60;
        enemy[1].worldCol = 200;
        enemy[1].width = 16;
        enemy[1].height = 16;
        enemy[1].element = ICE;
        enemy[1].health = 1;
        enemy[1].active = 1;
        enemy[1].type = 0;
        enemy[1].hitTimer = 0;

        enemy[2].worldRow = 60;
        enemy[2].worldCol = 50;
        enemy[2].width = 16;
        enemy[2].height = 16;
        enemy[2].element = FIRE;
        enemy[2].health = 1;
        enemy[2].active = 1;
        enemy[2].type = 0;
        enemy[2].hitTimer = 0;

        currRoom = 0;
        currCollisionMap = collisionMapBitmap;

        room = updateRoom0;
        state = updateGame;
    } else if (roomNum == 1) {
        REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
        REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(29) | 2;
        loadPalette(room1BGPal);
        DMANow(3, room1BGTiles, &CHARBLOCKBASE[1], room1BGTilesLen / 2 | DMA_ON);
        DMANow(3, room1BGMap, &SCREENBLOCKBASE[29], room1BGMapLen / 2 | DMA_ON);

        vOff = 0;
        hOff = 0;

        REG_BG0HOFS = 0;
        REG_BG0VOFS = 0;

        enterPlacement(&player);

        enemy[0].worldRow = 30;
        enemy[0].worldCol = 112;
        enemy[0].width = 16;
        enemy[0].height = 16;
        enemy[0].element = LIGHTNING;
        enemy[0].health = 1;
        enemy[0].active = 1;
        enemy[0].type = 0;
        enemy[0].hitTimer = 0;

        enemy[1].worldRow = 60;
        enemy[1].worldCol = 200;
        enemy[1].width = 16;
        enemy[1].height = 16;
        enemy[1].element = ICE;
        enemy[1].health = 1;
        enemy[1].active = 1;
        enemy[1].type = 0;
        enemy[1].hitTimer = 0;

        enemy[2].worldRow = 60;
        enemy[2].worldCol = 50;
        enemy[2].width = 16;
        enemy[2].height = 16;
        enemy[2].element = FIRE;
        enemy[2].health = 1;
        enemy[2].active = 1;
        enemy[2].type = 0;
        enemy[2].hitTimer = 0;

        currRoom = 1;
        currCollisionMap = room1CMBitmap;

        room = updateRoom1;
        state = updateGame;
    } else if (roomNum == 2) {
        REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
        REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(29) | 2;
        loadPalette(room2BGPal);
        DMANow(3, room2BGTiles, &CHARBLOCKBASE[1], room2BGTilesLen / 2 | DMA_ON);
        DMANow(3, room2BGMap, &SCREENBLOCKBASE[29], room2BGMapLen / 2 | DMA_ON);

        enterPlacement(&player);

        enemy[0].active = 0;
        enemy[0].hitTimer = 0;
        enemy[1].active = 0;
        enemy[1].hitTimer = 0;
        enemy[2].active = 0;
        enemy[2].hitTimer = 0;

        currRoom = 2;
        currCollisionMap = room2CMBitmap;

        room = updateRoom2;
        state = updateGame;
    } else if (roomNum == 3) {
        REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
        REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(29) | 2;
        loadPalette(room3BGPal);
        DMANow(3, room3BGTiles, &CHARBLOCKBASE[1], room3BGTilesLen / 2 | DMA_ON);
        DMANow(3, room3BGMap, &SCREENBLOCKBASE[29], room3BGMapLen / 2 | DMA_ON);

        enterPlacement(&player);

        enemy[0].worldRow = 30;
        enemy[0].worldCol = 112;
        enemy[0].width = 32;
        enemy[0].height = 32;
        enemy[0].element = ICE;
        enemy[0].active = 1;
        enemy[0].health = 3;
        enemy[0].type = 1;
        enemy[0].hitTimer = 0;

        enemy[1].active = 0;
        enemy[2].active = 0;

        currRoom = 3;
        currCollisionMap = room3CMBitmap;

        room = updateRoom3;
        state = updateGame;
    } else if (roomNum == 4) {
        REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
        REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(29) | 2;
        loadPalette(room4BGPal);
        DMANow(3, room4BGTiles, &CHARBLOCKBASE[1], room4BGTilesLen / 2 | DMA_ON);
        DMANow(3, room4BGMap, &SCREENBLOCKBASE[29], room4BGMapLen / 2 | DMA_ON);

        enterPlacement(&player);

        currRoom = 4;
        currCollisionMap = room4CMBitmap;

        room = updateRoom4;
        state = updateGame;
    } else if (roomNum == 5) {
        REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;
        REG_BG1CNT = BG_SIZE0 | CBB(1) | SBB(29) | 2;
        loadPalette(room5BGPal);
        DMANow(3, room5BGTiles, &CHARBLOCKBASE[1], room5BGTilesLen / 2 | DMA_ON);
        DMANow(3, room5BGMap, &SCREENBLOCKBASE[29], room5BGMapLen / 2 | DMA_ON);

        enterPlacement(&player);

        currRoom = 5;
        currCollisionMap = room5CMBitmap;

        room = updateRoom5;
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
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    REG_TM0CNT = 0;
    REG_TM1CNT = 0;
}

void unpauseSound()
{
    soundA.isPlaying = 1;
    soundB.isPlaying = 1;
    REG_TM0CNT = TIMER_ON;
    REG_TM1CNT = TIMER_ON;
}

void stopSound()
{
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

void enterPlacement(PLAYER * player) {
    if (player->prevEntrance == NORTH) {
        player->worldRow = 160 - player->height - 20;
        player->worldCol = 240 / 2 - 8;
        player->spriteRow = player->worldRow + 8;
        player->spriteCol = player->worldCol + 8;
        vOff = 0;
        hOff = 0;
    } else if (player->prevEntrance == SOUTH) {
        player->worldRow = 0;
        player->worldCol = 240 / 2 - 8;
        player->spriteRow = player->worldRow + 8;
        player->spriteCol = player->worldCol + 8;
        vOff = 0;
        hOff = 0;
    } else if (player->prevEntrance == EAST) {
        player->worldRow = 160 / 2 - player->height;
        player->worldCol = 0;
        player->spriteRow = player->worldRow + 8;
        player->spriteCol = player->worldCol + 8;
        vOff = 0;
        hOff = 0;
    } else if (player->prevEntrance == WEST) {
        player->worldRow = 160 / 2 - player->height;
        player->worldCol = 240 - player->width - 20;
        player->spriteRow = player->worldRow + 8;
        player->spriteCol = player->worldCol + 8;
        vOff = 0;
        hOff = 0;
    }
}