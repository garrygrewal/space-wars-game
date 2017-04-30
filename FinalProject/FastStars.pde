//class for travelling at warp speed in between levels
class FastStars {

  PVector position;
  PVector velocity;

  FastStars(PVector position, PVector velocity) {
    this.position=position;
    this.velocity=velocity;
  }

  void drawStars() {
    pushMatrix();
    stroke(0,25,110);
    strokeWeight(1);
    line(position.x, position.y, width/2, height/2);
    fill(0);
    ellipse(width/2, height/2, 15, 15);
    popMatrix();
  }

  void update() {
    position.add(velocity);
    if (position.x>width+100||position.x<-100||position.y<-100||position.y>height+100) {
      position.x=width/2;
      position.y=height/2;
    }
  }
}