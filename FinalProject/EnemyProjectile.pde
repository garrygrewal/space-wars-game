//class for aura's left behind by enemies, these enemy projectiles are the only thing that damage the players health
class EnemyProjectile extends Enemy {

  float projectileScale;

  EnemyProjectile(PVector position, PVector velocity) {
    super(position, velocity);
    projectileScale=0.1;
  }

  void drawEnemyProjectile() {
    pushMatrix();
    translate(position.x, position.y);
    scale(projectileScale);
    imageMode(CENTER);
    image(auraExplosion,0,0);
    popMatrix();
  }

  void updateEnemyProjectile() {
    
    //make bombs move when keys are pressed
    position.add(velocity);
    if (right) {
      velocity = new PVector(-4, 2);
    } else if (left) {
      velocity = new PVector(4, 2);
    } else {
      velocity = new PVector(0,0);
    }
    
    //bomb goes off screen, player dodged it so just remove from array but dont decrease health
    if(position.x<=0-50 || position.x>=width+50 || position.y<=0-50 || position.y>=height+50){
      enemyProjectiles.remove(this);
    }
    //scale increases makes it look like projectile is coming closer
    projectileScale+=0.01;
    //if projectile scale is greater than 10, ship takes hit
    if (projectileScale>=2) {
      playerHealth-=10;
      
      projectileScale=1;
      enemyProjectiles.remove(this);
    }
  }
}