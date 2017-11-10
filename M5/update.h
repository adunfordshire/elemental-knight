enum {DOWN, UP, RIGHT, LEFT, ATTACK};

//prototypes
void updateSplash();
void updateInstr();
void updateGame();
void updatePause();
void updateDeath();
void updateWin();

void updateRoom0(PLAYER * player);
void updateRoom1(PLAYER * player);
void updateRoom2(PLAYER * player);
void updateRoom3(PLAYER * player);
void updateRoom4(PLAYER * player);
void updateRoom5(PLAYER * player);

void updatePlayer(PLAYER * player);
void playerAnimate(PLAYER * player);
void playerWalk(PLAYER * player);
void attackCheck(PLAYER * player, ENEMY * enemy);
void updateEnemy(ENEMY * enemy);
void moveBoss(ENEMY * enemy);
int playerEnemyCollision(PLAYER * player, ENEMY * enemy);
void enemyHit(PLAYER * player, ENEMY * enemy);
void playerHit(PLAYER * player, LIFE life[]);