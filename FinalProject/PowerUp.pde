//class for power ups like extra health and rapid fire
class PowerUp extends Enemy {

  int powerupLengthTime;

  PowerUp(PVector position, PVector velocity) {
    super(position, velocity);
    health = 100;
    powerupLengthTime = millis();
    powerActivated=false;
  }

  void drawPowerUp() {
    pushMatrix();
    translate(position.x, position.y);
    scale(enemyScale);
    imageMode(CENTER);
    if (randomPowerup==0) {
      image(mechanic, 0, 0);
    } else if (randomPowerup==1) {
      image(money, 0, 0);
    } else if (randomPowerup==2) {
      image(rapidShot, 0, 0);
    }
    popMatrix();
  }

  void update() {
    drawPowerUp();
    move();
    checkHit();
  }

  void move() {
    position.add(velocity);

    if (startScaleUp) {
      enemyScale+=0.01;
      //radius increases as scale increases
      radius+=0.75;
    } else if (startScaleDown) {
      enemyScale-=0.01;
      //radius decreases as scale decreases
      radius-=0.75;
    }
    if (enemyScale>=1) {
      startScaleDown=true;
      startScaleUp=false;
    }
    if (enemyScale<=0.5) {
      startScaleUp=true;
      startScaleDown=false;
    }

    if (position.x>width-25 || position.x<0+25) {
      velocity.x *= -1;
    }
    if (position.y>550 || position.y<25) {
      velocity.y *= -1;
    }
    //remove powerup after some time and generate a new one
    
  }

  void checkHit() {
    for (int i=0; i<lasers.size(); i++) {
      Projectiles p = lasers.get(i);
      for (int j=0; j<powerup.size(); j++) {
        PowerUp pu = powerup.get(j);
        if (p.hitPowerUp(pu)) {
          //if powerup is mechanic, boost health by 50
          //if statement for mechanic powerup is in enemy class
          //if statement for insta kill powerup is in enemy class
          if (randomPowerup==0) {
            playerHealth+=50;
          }
          pu.health -=100;
          lasers.remove(p);
          powerup.remove(this);
          powerActivated=true;
          powerupCooldownTimer+=15000;  //makes it so powerups come at longer timer segments
        }
        //if projectile is off screen remove it from arraylist
        if (p.position.x < -25|| p.position.x > width+25 || p.position.y < -25 || p.position.y > height+25) {
          lasers.remove(p);
        }
      }
    }
  }
}