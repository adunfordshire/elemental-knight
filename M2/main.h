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
    int height;
    int width;
    int dir;
    int prevDir;
    int currFrame;
    int aniCounter;
    int move;
    int attack;
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
    int anicounter;
    int anistate;
    int active;
    int element;
} ENEMY;

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