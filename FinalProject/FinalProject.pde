/*SPACE WARS Created by Garry Grewal - IAT 167 Summer 2016

change enemyDefeated and enemyRemaining to make game easier/harder
*/
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


int state;
final int menuState = 1;
final int nextLevel = 2;
final int stage1State = 3;
final int stage2State = 4;
final int bossStage = 5;
final int winState = 6;
final int gameOverState = 7;
final int howToPlay = 8;

//object for heads up display(change the pvector position)
HUD hud1 = new HUD(new PVector(600, 700));
//object for player
Player myPlayer = new Player(new PVector(600, 625));

//arrayList for stars
ArrayList <Stars> stars = new ArrayList<Stars>();
//arrayList for planets
ArrayList <Planets> planets = new ArrayList<Planets>();
//arraylist for faststars
ArrayList <FastStars> faststars = new ArrayList<FastStars>();
//arraylist for projectiles
ArrayList<Projectiles> lasers = new ArrayList<Projectiles>();
//arraylist for enemies
ArrayList <Enemy> enemies = new ArrayList<Enemy>();
//arraylist for enemy projectiles
ArrayList <EnemyProjectile> enemyProjectiles = new ArrayList<EnemyProjectile>();
//arraylist for powerups
ArrayList <PowerUp> powerup = new ArrayList<PowerUp>();
//Arraylist for enemyExplosions
ArrayList <Explosion> enemyExplosion = new ArrayList<Explosion>();


void setup() {
  size(1200, 800);
  frameRate(60);
  loadAssets();
  state=menuState;
  score=0;
  enemyDefeated=0;
}

void draw() {
  switch(state) {
  case 1:
    introScreen();
    break;
  case 2:
    nextLevel();
    break;
  case 3:
    startStage1();
    break;
  case 4:
    startStage2();
    break;
  case 5:
    bossStage();
    break;
  case 6:
    gameWin();
    break;
  case 7:
    gameOver();
    break;
  case 8:
    howToScreen();
    break;
  default:
    break;
  }
}