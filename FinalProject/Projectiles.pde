//projectile class for creating projectiles like lasers
class Projectiles extends Player {

  PVector velocity;

  Projectiles(PVector position, PVector velocity, float angle) {
    super(position);
    this.velocity=velocity;
    this.angle=angle;
  }


  void updateProjectile() {
    position.add(velocity);
  }

  void drawProjectile() {
    pushMatrix();
    translate(position.x, position.y);
    strokeWeight(0);
    rotate(angle);
    fill(0, 255, 0);
    rect(0, 0, 3, 50);
    popMatrix();
  }
  
  //collision detection(bounding box)
  boolean hitEnemy(Enemy s) {
    if (abs(position.x-s.position.x)< s.radius/2 && abs(position.y-s.position.y)< s.radius/2) {
      return true;
    } 
    return false;
  }
  boolean hitPowerUp(PowerUp p) {
    if (abs(position.x-p.position.x)< p.radius/2 && abs(position.y-p.position.y)< p.radius/2) {
      return true;
    } 
    return false;
  }
}