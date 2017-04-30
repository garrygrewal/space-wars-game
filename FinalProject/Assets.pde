/* Load all images, sounds, fonts, etc.
*/
PImage gauge;
PImage altitude;
PImage turns;
PImage turnsUpsidedown;
PImage button;
PImage buttonUpsidedown;
PImage switchButton;
PImage module;
PImage screen;
PImage screenScore;
PImage crossHair;
PImage howToPlayImage;
PFont font;

PImage fireExplosion;
PImage auraExplosion;

PImage  mechanic;
PImage money;
PImage rapidShot;

int randomPowerup;
int enemyDefeated;
int enemyRemaining;

Minim minim;

AudioPlayer laser;

//animation cycle variables

//arrays for anmiation cycle
PImage[] easyEnemyAnimation = new PImage[4];
PImage[] hardEnemyAnimation = new PImage[4];
PImage[] bossEnemyAnimation = new PImage[4];


//variables for loading stars, enemies, etc.
boolean addStars = true;
boolean addFastStars = false;

int easyEnemyTimer = millis();
int hardEnemyTimer = millis();
int bossEnemyTimer = millis();
int powerupTimer = millis();
int powerupCooldownTimer = 7500;




void loadAssets() {
  minim = new Minim(this);
  //for audio
  laser = minim.loadFile("laser.wav");
  //for text
  font = loadFont("EurostileRegular-48.vlw");
  //for cursor
  crossHair = loadImage("crosshair.png");
  //for HUD
  gauge = loadImage("gauge.png");
  altitude = loadImage("altitude.png");
  turns = loadImage("turns.png");
  turnsUpsidedown = loadImage("turns2.png");
  button = loadImage("button.png");
  buttonUpsidedown = loadImage("button2.png");
  switchButton = loadImage("switch.png");
  module = loadImage("module.png");
  screen = loadImage("screen.png");
  screenScore = loadImage("screen2.png");
  fireExplosion = loadImage("explosion0.png");
  auraExplosion = loadImage("explosion1.png");
  howToPlayImage = loadImage("howtoplay.png");
  
  mechanic = loadImage("powerup0.png");
  money = loadImage("powerup1.png");
  rapidShot = loadImage("powerup2.png");

  //animation
  loadAnimationCycle(4, "easyEnemy", easyEnemyAnimation);
  loadAnimationCycle(4, "hardEnemy", hardEnemyAnimation);
  loadAnimationCycle(4, "boss", bossEnemyAnimation);

  //change cursor to crosshair
  cursor(crossHair);
}
//loads animation images into array
void loadAnimationCycle(int numberofImages, String fileName, PImage[] store) {
  for (int i=0; i<numberofImages; i++) {
    PImage image = loadImage(fileName+i+".png");
    //resize image
    //image.resize(25,0);
    store[i]=image;
  }
}

//add stars for warp speed effect
void loadFastStars() {
  if (addFastStars) {
    //add faststars to arraylist
    for (int i=0; i<200; i++) {
      FastStars fs1 = new FastStars(new PVector(width/2, height/2), new PVector(random(-10, 10), random(-10, 10)));
      faststars.add(fs1);
    }
    addFastStars=false;
  }
}

//add planets and stars during gameplay
void loadStars() {
  if (addStars) {
    //add stars to arraylist
    for (int i=0; i<75; i++) {
      Stars star1 = new Stars(new PVector(random(0, 1200), random(0, 800)), new PVector(0, 0));
      stars.add(star1);
    }

    //add planets to arraylist
    for (int i=0; i<25; i++) {
      Planets planet1 = new Planets(new PVector(random(-500, 1700), random(-500, 1300)), new PVector(0, 0));
      planets.add(planet1);
    }
    addStars=false;
  }
}

//add 3 easy enemies 
void loadEasyEnemy() {
  if ((millis() >= easyEnemyTimer +5000) && enemies.size()<1) {
    EasyEnemy easyE = new EasyEnemy(new PVector(random(50, 1150), random(75, 550)), new PVector(1, 1));
    enemies.add(easyE);
    easyEnemyTimer = millis();
  }
}
//add 2 hard enemies
void loadHardEnemy() {
  if ((millis() >= hardEnemyTimer +3000) && enemies.size()<1) {
    HardEnemy hardE = new HardEnemy(new PVector(random(50, 1150), random(75, 550)), new PVector(2, 2));
    enemies.add(hardE);
    hardEnemyTimer = millis();
  }
}

//add 1 boss
void loadBoss() {
  if ((millis() >= bossEnemyTimer +1000) && enemies.size()<1) {
    Boss boss1 = new Boss(new PVector(random(50, 1150), random(75, 550)), new PVector(3, 3));
    enemies.add(boss1);
    bossEnemyTimer = millis();
  }
}

void loadPowerUp() {
  //add powerups to arraylist//testing with just 1 powerup right now
  if ((millis() >= powerupTimer + powerupCooldownTimer) && powerup.size()<1) {
    PowerUp power1 = new PowerUp(new PVector(random(50, 1150), random(75, 575)), new PVector(1, 1));
    powerup.add(power1);
    randomPowerup=(int)random(0,3);
    powerupTimer = millis();
  }
}