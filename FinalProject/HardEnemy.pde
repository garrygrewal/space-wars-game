//class for hard enemy level
class HardEnemy extends EasyEnemy {

  HardEnemy(PVector position, PVector velocity) {
    super(position, velocity);
    //hard enemy has more health
    health=150;
    currentImage=0;
  }

  void drawEnemy() {
    pushMatrix();
    translate(position.x, position.y);
    imageMode(CENTER);
    strokeWeight(0);
    scale(enemyScale);
    image(hardEnemyAnimation[currentImage], 0, 0);
    popMatrix();
  }
}