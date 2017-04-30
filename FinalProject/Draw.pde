//draw functions

//draws the planets and stars in the background
void drawScene() {
  background(0);

  //for loop for moving stars(makes the ship look like its moving)
  for (int i=0; i<stars.size(); i++) {
    Stars s = stars.get(i);
    s.drawStars();
    s.update();
  }
  //for loop for moving planets(makes the ship look like its moving)
  for (int i=0; i<planets.size(); i++) {
    Planets p = planets.get(i);
    p.drawStars();
    p.update();
  }
}

void drawFastStars() {
  background(0);
  for (int i=0; i<faststars.size(); i++) {
    FastStars fs = faststars.get(i);
    fs.drawStars();
    fs.update();
  }
}

//to draw hud and ship
void drawShip() {
  myPlayer.update();
  hud1.drawHUD();
}

//for loop to draw enemies
void drawEnemy() {
  //for loop to draw easy enemies
  for (int i=0; i<enemies.size(); i++) {
    Enemy e = enemies.get(i);
    e.update();
  }
}

void drawPowerUp() {
  //for loop to draw powerups
  for (int i=0; i<powerup.size(); i++) {
    PowerUp p = powerup.get(i);
    p.update();
  }
}

void drawHowToPlayImage() {
  pushMatrix();
  translate(width/2, height/2);
  imageMode(CENTER);
  image(howToPlayImage, 0, 0);
  popMatrix();
}

void drawHowToPlayText() {
  pushMatrix();
  translate(0, 0);
  textFont(font, 20);
  text("Collect Powerups", 250, 175);
  text("WATCH OUT FOR AURA's \nLEFT BEHIND BY ENEMIES", 400,225);
  text("Dodge Aura's by using WSAD keys", 500,425);
  text("Fire Lasers by left clicking", 800, 125);
  popMatrix();
}