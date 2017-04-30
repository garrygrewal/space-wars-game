//class to display score health and other things
class HUD {

  PVector position;
  float side;
  float shiftLeft;
  float shiftRight;

  HUD(PVector position) {
    this.position=position;
    shiftLeft = -0.001;
    shiftRight = 0.001;
    side=0;
  }

  void drawHUD() {
    drawMessage();
    //display score
    drawScore();
    //display health
    drawHealth();
    //display enemies remaining
    drawEnemyRemaining();
    //display PImages
    drawImages();
  }

  void drawScore() {
    pushMatrix();
    translate(position.x+200, position.y-675);
    imageMode(CENTER);
    image(screenScore, 0, 0);

    textFont(font, 20);
    fill(0, 255, 0);
    text("SCORE: "+score, -80, 5);
    popMatrix();
  }

  void drawHealth() {
    pushMatrix();
    translate(position.x-200, position.y-675);
    imageMode(CENTER);
    image(screenScore, 0, 0);

    textFont(font, 20);
    fill(0, 255, 0);
    text("HEALTH: "+playerHealth, -80, 5);
    popMatrix();
  }


  void drawMessage() {
    pushMatrix();
    translate(position.x, position.y);
    if (left) {
      rotate(degrees(shiftLeft));
    }
    if (right) {
      rotate(degrees(shiftRight));
    }

    imageMode(CENTER);
    image(screen, 0, 0);
    if (powerActivated) {
      textFont(font, 20);
      fill(0, 255, 0);
      text("POWER UP: ", -75, 0);
      textFont(font, 16);
      if (randomPowerup==0) {
        text("MECHANIC - \n(HEALTH +50)", -50, +25);
      } else if (randomPowerup==1) {
        text("MONEY - (SCORE X2)", -75, +25);
      } else if (randomPowerup==2) {
        text("RAPID SHOT - \n(DAMAGE X2)", -50, +25);
      }
    } 

    if (state==nextLevel) {
      textFont(font, 20);
      fill(0, 255, 0);
      text("Next Level Starting... \n\n   PRESS   SPACE \n      TO  SLOW \n           DOWN", -80, -27.5);
    }
    if (state==menuState) {
      textFont(font, 20);
      fill(0, 255, 0);
      text("    Created by \n  Garry Grewal", -65, -25);
    }
    if (state==stage1State) {
      textFont(font, 20);
      fill(0, 255, 0);
      text("STAGE 1", -35, -35);
    }
    if (state==stage2State) {
      textFont(font, 20);
      fill(0, 255, 0);
      text("STAGE 2", -35, -35);
    }
    if (state==bossStage) {
      textFont(font, 20);
      fill(0, 255, 0);
      text("BOSS LEVEL", -50, -35);
    }
    popMatrix();
  }

  void drawEnemyRemaining() {
    pushMatrix();
    translate(position.x-250, position.y-30);
    if (left) {
      rotate(degrees(shiftLeft));
    }
    if (right) {
      rotate(degrees(shiftRight));
    }
    fill(0);
    strokeWeight(1);
    stroke(255,0,0);
    arc(0, 0, 250, 75, PI, TWO_PI, CENTER);
    textFont(font, 14);
    fill(0, 255, 0);
    text("Enemies Remaining: "+enemyRemaining, -60, -10);
    strokeWeight(3);
    stroke(255);
    popMatrix();
  }

  void drawImages() {
    pushMatrix();
    translate(position.x, position.y);
    imageMode(CORNER);
    turns.resize(0, 50);
    turnsUpsidedown.resize(0, 50);
    switchButton.resize(50, 30);
    module.resize(80, 100);
    image(turns, 0, -700);
    image(turns, 25, -700);
    image(turns, 350, -700);
    image(turns, 375, -700);
    image(turns, -455, -700);
    image(turns, -430, -700);
    image(buttonUpsidedown, -50, -700);
    image(buttonUpsidedown, -75, -700);
    image(buttonUpsidedown, -375, -700);
    image(buttonUpsidedown, -400, -700);
    if (left) {
      rotate(degrees(shiftLeft));
    }
    if (right) {
      rotate(degrees(shiftRight));
    }
    image(gauge, -300, -25);
    image(gauge, -225, -25);
    image(gauge, -225, 40);
    image(gauge, -300, 40);
    image(altitude, 300, -25);
    image(turnsUpsidedown, 250, -25);
    image(turnsUpsidedown, 225, -25);
    image(turnsUpsidedown, 200, -25);
    image(turnsUpsidedown, 175, -25);
    image(button, 200, 25);
    image(button, 225, 25);
    image(button, 250, 25);
    image(switchButton, -160, -25);
    image(switchButton, -160, 10);
    image(switchButton, 110, -25);
    image(switchButton, 110, 10);
    image(module, -400, -15);

    popMatrix();
  }
}