//class for boss level
class Boss extends Enemy {
  
  Boss(PVector position, PVector velocity){
    super(position,velocity);
    health = 200;
    currentImage=0;
  }
  
  
  void drawEnemy(){
    pushMatrix();
    translate(position.x, position.y);
    imageMode(CENTER);
    strokeWeight(0);
    scale(enemyScale);
    image(bossEnemyAnimation[currentImage], 0,0);
    popMatrix();
  }
}