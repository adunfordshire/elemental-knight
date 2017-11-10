enum {DOWN, UP, RIGHT, LEFT, ATTACK};

//prototypes
void updateSplash();
void updateInstr();
void updateGame();
void updatePause();
void updateDeath();
void updateWin();

void updatePlayer(PLAYER * player);
void playerWalk(PLAYER * player);
void playerAttack(PLAYER * player);
void attackCheck(PLAYER * player, ENEMY * enemy);
void updateEnemy(ENEMY * enemy);
int playerEnemyCollision(PLAYER * player, ENEMY * enemy);