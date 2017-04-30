//class for planets (look the same as stars but are a little bigger and yellow)
class Planets extends Stars {
  

  Planets(PVector position, PVector velocity) {
    super(position, velocity);
  }
  
  void drawStars(){
    pushMatrix();
    stroke(255,255,random(0,255));
    translate(position.x,position.y);
    scale(starScale);
    fill(255,255,random(0,255));
    ellipse(0,0,8,8);
    popMatrix();
  }
}