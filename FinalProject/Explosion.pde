//class to draw and scale down the explosion effect after laser hits enemy
class Explosion extends Enemy {

  Explosion(PVector position, PVector velocity) {
    super(position, velocity);
    //velocity = new PVector(0,0);
    explosionScale=1;
  }

  void drawExplosion() {
    pushMatrix();
    translate(position.x, position.y);
    scale(explosionScale);
    imageMode(CENTER);
    image(fireExplosion, 0, 0);
    popMatrix();
  }

  void updateExplosion() {
    position.add(velocity);

    explosionScale-=0.02;
    if (explosionScale<=0) {
      explosionScale=0;
      enemyExplosion.remove(this);
    }
  }
}