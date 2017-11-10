#define NUMENEMY 3

#define ROWMASK 0xFF
#define COLMASK 0x1FF

int enemiesLeft;
int hOff;
int vOff;
enum {ICE, FIRE, LIGHTNING};

typedef struct {
    int worldRow;
    int worldCol;
    int screenRow;
    int screenCol;
    int spriteRow;
    int spriteCol;
    int height;
    int width;
    int dir;
    int prevDir;
    int currFrame;
    int aniCounter;
    int aniSwap;
    int move;
    int attack;
    int attackRow;
    int attackCol;
    int attackWidth;
    int attackHeight;
    int health;
    int element;
} PLAYER;

typedef struct {
    int worldRow;
    int worldCol;
    int screenRow;
    int screenCol;
    int height;
    int width;
    int currFrame;
    int aniCounter;
    int anistate;
    int active;
    int element;
} ENEMY;

typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vbCount;
}SOUND;

//Prototypes
void init();
void update();
void draw();
void hideSprites();
void updateLocations();

void goToSplash();
void goToInstr();
void goToGame();
void goToPause();
void goToDeath();
void goToWin();

void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);
void muteSound();
void unmuteSound();
void stopSound();

void setupInterrupts();
void interruptHandler();