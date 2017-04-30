//superclass for enemies
class Enemy { 

  PVector position;
  PVector velocity;
  float health;
  float radius;
  float enemyScale; //used to make enemy appear as though he is moving
  float explosionScale; //used for explosion image
  boolean startScaleUp;
  boolean startScaleDown;
  boolean fireEnemyProjectile;
  boolean explosionVisible; //used for scaling explosion

  //for animation
  //PImage[] currentEasyAnimation;
  //PImage[] currentHardAnimation;
  //PImage[] currentBossAnimation;
  int currentImage;

  Enemy(PVector position, PVector velocity) {
    this.position=position;
    this.velocity=velocity;
    enemyScale = 0.01;
    radius=0.25;
    startScaleUp=true;
    startScaleDown=false;
    fireEnemyProjectile=false;
    currentImage=0;
  }

  //draws easy enemy
  void drawEnemy() {
    pushMatrix();
    translate(position.x, position.y);
    strokeWeight(0);
    scale(enemyScale);
    imageMode(CENTER);
    image(easyEnemyAnimation[currentImage], 0, 0);
    popMatrix();
  }

  void update() {
    drawEnemy();
    move();
    checkHit();
  }

  //moves enemy around and checks for boundaries
  void move() {
    position.add(velocity);

    loadEnemyProjectile();
    fireEnemyProjectile();

    displayEnemyExplosion();

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
      //fire projectile then start to scale down =true 
      //enemyScale=5;
      //radius=125;
      startScaleDown=true;
      //fire enemy projectile when there are less than 1 projectiles on screen
      if (enemyProjectiles.size()<1) {
        fireEnemyProjectile=true;
        currentImage=3;
      }
      startScaleUp=false;
    }
    if (enemyScale<=0.5) {
      currentImage=0;
      //enemyScale=0.5;
      //radius=12.5;
      startScaleUp=true;
      startScaleDown=false;
    }


    if (position.x>width-25) {
      velocity.x *= -1;
      currentImage=1;
    }
    if (position.x<0+25) {
      velocity.x *= -1;
      currentImage=2;
    }
    if (position.y>550 || position.y<25) {
      velocity.y *= -1;
      currentImage=0;
    }
  }

  //checks if laser hits enemy
  void checkHit() {
    for (int i=0; i<lasers.size(); i++) {
      Projectiles p = lasers.get(i);
      for (int j=0; j<enemies.size(); j++) {
        Enemy e = enemies.get(j);
        if (p.hitEnemy(e)) {
          //if powerup is double xp make score + 20
          if (randomPowerup==1) {
            loadEnemyExplosion();
            lasers.remove(p);
            e.health -=10;
            score+=20;
          } else if (randomPowerup==2) { //if powerup is double damage, make enemy health -20
            loadEnemyExplosion();
            lasers.remove(p);
            e.health -=20;
            score+=10;
          } else {
            //if laser hits enemy subtract the health of enemy
            loadEnemyExplosion();
            e.health -=10;
            lasers.remove(p);
            score+=10;
          }
        }
        //if projectile is off screen remove it from arraylist
        if (p.position.x < -25|| p.position.x > width+25 || p.position.y < -25 || p.position.y > height+25) {
          lasers.remove(p);
        }
        //if health of enemy is zero remove them from arraylist
        if (health<=0) {
          enemies.remove(this);
          enemyDefeated+=1;
          enemyRemaining-=1;
        }
      }
    }
  }

  void loadEnemyProjectile() {
    if (fireEnemyProjectile) {
      //add 1 new projectile to array 
      EnemyProjectile ep = new EnemyProjectile(new PVector(position.x, position.y), new PVector(0, 0));
      enemyProjectiles.add(ep);

      fireEnemyProjectile=false;
    }
  }

  void fireEnemyProjectile() {
    for (int i=0; i<enemyProjectiles.size(); i++) {
      EnemyProjectile pp = enemyProjectiles.get(i);
      pp.drawEnemyProjectile();
      pp.updateEnemyProjectile();
    }
  }

  void loadEnemyExplosion() {
    //add 1 enemy explosion to array
    Explosion e = new Explosion(new PVector(position.x, position.y), new PVector(0, 0));
    enemyExplosion.add(e);
  }

  void displayEnemyExplosion() {
    for (int i=0; i<enemyExplosion.size(); i++) {
      Explosion ee = enemyExplosion.get(i);
      ee.drawExplosion();
      ee.updateExplosion();
    }
  }
}