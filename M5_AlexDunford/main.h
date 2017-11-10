#define NUMENEMY 3

#define ROOMNUMBER 6

#define ROWMASK 0xFF
#define COLMASK 0x1FF

int enemiesLeft;
int hOff;
int vOff;

volatile int currRoom; 
volatile unsigned short * currCollisionMap;
enum {ICE, FIRE, LIGHTNING, MEGA};
enum {NORTH, SOUTH, EAST, WEST};

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
    int attackTimer;
    int move;
    int attack;
    int attackRow;
    int attackCol;
    int attackWidth;
    int attackHeight;
    int health;
    int invuln;
    int iTimer;
    int element;
    int prevEntrance;
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
    int health;
    int active;
    int element;
    int type;
    int hitTimer;
} ENEMY;

typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int active;
} LIFE;

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

void goToRoom(int room);

void setupSounds();
void playSoundA( const unsigned char* sound, int length, int frequency, int loops);
void playSoundB( const unsigned char* sound, int length, int frequency, int loops);
void muteSound();
void unmuteSound();
void stopSound();

void setupInterrupts();
void interruptHandler();
void enterPlacement(PLAYER * player);