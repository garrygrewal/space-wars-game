//All game states here and some global variables

boolean powerActivated;  //for powerups
float textScale = 128; //used to make game title smaller on intro screen

//health and score
int playerHealth;
int score;

//this will be displayed when game is first opened
void introScreen() {
  loadStars();
  drawScene();
  drawShip();

  //space wars title
  textFont(font, textScale);
  fill(255, 245, 125);
  textAlign(CENTER);
  text("SPACE\nWARS", width/2, height/2-200);
  if (textScale>=48) {
    textScale-=1;
  }

  //start button
  Button startButton = new Button(new PVector(width/2-300, height/2));
  startButton.draw();
  startButton.startButton();

  //How to play Button
  Button howButton = new Button(new PVector(width/2+300, height/2));
  howButton.draw();
  howButton.howButton();

  textAlign(BASELINE);
}


//clear all arrays and advance to next level
void nextLevel() {
  //start player health at 100 when starting new level
  playerHealth=100;
  //reset cooldown timer for next level
  powerupCooldownTimer=7500;
  powerActivated=false;
  //remove all objects from arrays
  clearArrays();
  //load fast stars
  loadFastStars();
  //draw fast stars and travel at warpspeed
  drawFastStars();
  //draw player hud and ship
  drawShip();
  //if user hits space bar it switches to game state and level begins(fast stars dissappear, new stars and planets added)
  if (space) {
    addStars=true;
    //goes to next state depending on score(makes it so player travels at warp speed before every level begins
    if (score==0) {
      state = stage1State;
      enemyRemaining=3;
    } else if (enemyDefeated==3) {
      state = stage2State;
      enemyRemaining=4;
    } else if (enemyDefeated==7) {
      state = bossStage;
      enemyRemaining=1;
    } else if (enemyDefeated==7) {
      state = winState;
      enemyRemaining=0;
    }
  }
}


void startStage1() {
  //remove fast stars
  faststars.clear();
  //draw stars and planets again
  loadStars();
  drawScene();
  //load and draw weapon
  myPlayer.loadWeapon();
  myPlayer.fireWeapon();
  //load and draw easy enemies
  loadEasyEnemy();
  drawEnemy();
  loadPowerUp();
  drawPowerUp();
  //draw ship hud again
  drawShip();
  //testing right now if one enemy is killed advance to next level
  if (enemyDefeated==3) {
    levelComplete();
  }
  if (playerHealth<=0) {
    state=gameOverState;
  }
}

void startStage2() {
  //remove fast stars
  faststars.clear();
  //draw stars and planets again
  loadStars();
  drawScene();
  //load and draw weapon
  myPlayer.loadWeapon();
  myPlayer.fireWeapon();
  //load and draw enemies
  loadHardEnemy();
  drawEnemy();
  loadPowerUp();
  drawPowerUp();
  //draw ship hud again
  drawShip();
  //testing right now if one hard enemy is killed advance to boss level
  if (enemyDefeated==7) {
    levelComplete();
  }
  if (playerHealth<=0) {
    state=gameOverState;
  }
}

void bossStage() {
  //remove fast stars
  faststars.clear();
  //draw stars and planets again
  loadStars();
  drawScene();
  //load and draw weapon
  myPlayer.loadWeapon();
  myPlayer.fireWeapon();
  //load and draw boss
  loadBoss();
  drawEnemy();
  //draw ship hud again
  drawShip();
  if (enemyDefeated==8) {
    enemies.clear();
    state=winState;
  }
  if (playerHealth<=0) {
    state=gameOverState;
  }
}

void gameWin() {
  faststars.clear();
  //draw stars and planets again
  loadStars();
  drawScene();

  drawShip();
  //show some winning screen or something
  textFont(font, textScale);
  fill(255, 245, 125);
  textAlign(CENTER);
  text("YOU WIN!", width/2, height/2-200);
  if (textScale>=48) {
    textScale-=1;
  }
  //play again button
  Button playAgain = new Button(new PVector(width/2, height/2));
  playAgain.draw();
  playAgain.playAgain();

  textAlign(BASELINE);
}

void resetGame() {
  score=0;
  playerHealth=100;
  state=menuState;
}

void gameOver() {
  //runs if playerhealth=0
  faststars.clear();
  //draw stars and planets again
  loadStars();
  drawScene();

  drawShip();
  //show losing screen
  textFont(font, textScale);
  fill(255, 245, 125);
  textAlign(CENTER);
  text("GAME OVER!", width/2, height/2-200);
  if (textScale>=48) {
    textScale-=1;
  }

  //play again button
  Button playAgain = new Button(new PVector(width/2, height/2));
  playAgain.draw();
  playAgain.playAgain();

  textAlign(BASELINE);
}

void howToScreen() {
  loadStars();
  drawScene();
  drawShip();
  //screen shows how to play
  //runs when player clicks how to play
  drawHowToPlayImage();
  drawHowToPlayText();
  //draw backbutton
  Button back = new Button(new PVector(width/2, height/2+100));
  back.draw();
  back.backButton();
}

//runs after level is done/score is reached, then warp speed is displayed
void levelComplete() {
  enemies.clear();
  addFastStars=true;
  state=nextLevel;
}

void clearArrays() {
  //removes all objects from arraylists
  enemies.clear();
  powerup.clear();
  stars.clear();
  planets.clear();
  lasers.clear();
  enemyExplosion.clear();
  enemyProjectiles.clear();
}