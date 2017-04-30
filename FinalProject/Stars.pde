//class for stars drawn in the background
class Stars {

  PVector position;
  PVector velocity;
  float starScale;

  Stars(PVector position, PVector velocity) {
    this.position=position;
    this.velocity=velocity;
    starScale=0.1;
  }

  void drawStars() {
    pushMatrix();
    translate(position.x, position.y);
    scale(starScale);
    fill(255);
    ellipse(0, 0, 5, 5);
    popMatrix();
  }

  void update() {
    starScale+=0.002;
    position.add(velocity);

    //make stars move ;when keys are pressed all stars move in certain direction; when keys released stars spawn in the middle and move to the sides making it look as though the player is going straight
    if (right) {
      velocity = new PVector(-4, 2);
    } else if (left) {
      velocity = new PVector(4, 2);
    } else if (position.x<600) { 
      velocity = new PVector(-2, 1);
    } else if (position.x>600) {
      velocity = new PVector(2, 1);
    } 

    //make stars loop back after going off screen
    if (position.x<0||position.x>1200) {
      position.x=random(0, 1200);
      starScale=0.1;
    }
    if (position.y>800) {
      position.y=0;
      starScale=0.1;
    }
  }
}