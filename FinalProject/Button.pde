//class for buttons used throughout game
class Button {
  PVector position;
  boolean clicked;


  Button(PVector position) {
    this.position=position;
  }

  //for drawing buttons
  void draw() {
    pushMatrix();
    translate(position.x, position.y);
    fill(0, 0, 255);
    stroke(255, 245, 125);
    rectMode(CENTER);
    rect(0, 0, 150, 75, 10);
    rectMode(CORNER);
    stroke(255);
    popMatrix();
  }

  void startButton() {
    //start button
    textFont(font, 48);
    fill(255, 245, 125);
    text("START", width/2-300, height/2+15);
    //if statement to check if button is clicked
    if (mouseX>width/2-300-75 && mouseX<width/2-300+75&& mouseY>height/2-37.5 && mouseY<height/2+37.5) {
      if (mousePressed) {
        //change game state when button is clicked
        addFastStars=true;
        state = nextLevel;
      }
    }
  }

  void howButton() {
    //how to play button
    textFont(font, 26);
    fill(255, 245, 125);
    text("HOW TO\nPLAY", width/2+300, height/2);

    if (mouseX>width/2+300-75 && mouseX<width/2+300+75&& mouseY>height/2-37.5 && mouseY<height/2+37.5) {
      if (mousePressed) {
        //draw how to image when button is clicked
        state=howToPlay;
      }
    }
  }

  void playAgain() {
    textFont(font, 32);
    fill(255, 245, 125);
    text(" PLAY \nAGAIN", width/2, height/2-5);
    if (mouseX>width/2-75 && mouseX<width/2+75&& mouseY>height/2-37.5 && mouseY<height/2+37.5) {
      if (mousePressed) {
        //reset game when play again button is clicked
        resetGame();
      }
    }
  }

  void backButton() {
    textFont(font, 32);
    fill(255, 245, 125);
    text("BACK", width/2-40, height/2+110);
    if (mouseX>width/2-75 && mouseX<width/2+75&& mouseY>height/2-37.5+100 && mouseY<height/2+37.5+100) {
      if (mousePressed) {
        //go back to menustate when button is clicked
        state=menuState;
      }
    }
  }
}