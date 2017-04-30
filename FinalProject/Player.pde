//player class to shoot projectiles and draw ship
class Player {

  PVector position;
  boolean fireLaser;
  float angle;
  float shiftLeft;
  float shiftRight;



  Player(PVector position) {
    this.position=position;
    shiftLeft=-0.001;
    shiftRight=0.001;
  }
  //used to add projectiles to array and calculate velocity of projectile
  void loadWeapon() {
    if (fireLaser) {
      //makes it so the player cant fire laser when clicking on ship 
      if (mouseY>=575 || mouseY<=50) {
        fireLaser=false;
      } 
      //projectile only fired when player clicks in space not on ship
      else {
        laser.rewind();
        laser.play();
        //calculates angle between mouse click and projectile position
        angle = atan2(mouseX - position.x, mouseY - position.y);
        //creates new projectile object (angle is used to make projectile rotate)
        Projectiles p = new Projectiles(new PVector(position.x, position.y), new PVector(0, 0), angle*-1);
        //x and y velocity calculated using angle
        p.velocity.x = 10*sin(angle);                                                
        p.velocity.y = 10*cos(angle);

        lasers.add(p);
        fireLaser=false;
      }
    }
  }

  //used to display and move projectiles
  void fireWeapon() {
    for (int i=0; i<lasers.size(); i++) {
      Projectiles p = lasers.get(i);
      p.drawProjectile();
      p.updateProjectile();
    }
  }




  void update() {
    drawShipBottom();
    drawShipTop();
  }

  //drawing methods

  void drawShipBottom() {

    //bottom
    pushMatrix();
    translate(position.x, position.y);
    if (left) {
      rotate(degrees(shiftLeft));
    }
    if (right) {
      rotate(degrees(shiftRight));
    }
    fill(135, 135, 135);
    rectMode(CENTER);
    noStroke();
    rect(0, 125, 925, 200);
    rectMode(CORNER);
    strokeWeight(6);
    stroke(135, 135, 135);
    arc(0, 25, 925, 100, PI, TWO_PI, CENTER);
    stroke(1);
    noStroke();
    popMatrix();

    //left quad
    pushMatrix();
    fill(135, 135, 135);
    translate(75, 700);
    if (left) {
      rotate(degrees(shiftLeft));
    }
    if (right) {
      rotate(degrees(shiftRight));
    }
    quad(-100, 125, -100, 0, 75, -50, 75, 125);
    popMatrix();

    //right quad
    pushMatrix();
    translate(1125, 700);
    if (left) {
      rotate(degrees(shiftLeft));
    }
    if (right) {
      rotate(degrees(shiftRight));
    }
    quad(-75, 125, -75, -50, 100, 0, 100, 125);
    popMatrix();
  }

  void drawShipTop() {
    pushMatrix();
    translate(width/2, 0);

    fill(135, 135, 135);
    rectMode(CENTER);
    rect(0, 0, 1200, 108);
    rectMode(CORNER);
    popMatrix();

    pushMatrix();
    translate(50, 25);
    if (left) {
      rotate(degrees(shiftLeft));
    }
    if (right) {
      rotate(degrees(shiftRight));
    }
    //left quad
    quad(-75, 50, -75, -25, 50, -25, 50, 25);
    popMatrix();

    pushMatrix();
    translate(1150, 25);
    if (left) {
      rotate(degrees(shiftLeft));
    }
    if (right) {
      rotate(degrees(shiftRight));
    }
    //right quad
    quad(75, -25, 75, 50, -50, 25, -50, -25);
    popMatrix();
  }
}