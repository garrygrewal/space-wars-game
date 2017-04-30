//fires laser when left mouse is clicked and stopes firing when button is released
void mousePressed() {
  if (mouseButton == LEFT) {
    myPlayer.fireLaser=true;
  }
}

void mouseReleased() {
  if (mouseButton == LEFT) {
    myPlayer.fireLaser=false;
  }
}



PVector leftForce=new PVector(-2, 0); 
PVector upForce=new PVector(0, -2);
PVector rightForce=new PVector(2, 0);
PVector downForce=new PVector(0, 2);

float shiftRight=0;
float shiftLeft=0;

boolean left, up, down, right, space;



void keyPressed() {
  if (key == 'w') up = true;
  if (key == 's') down = true;
  if (key== 'a') left = true;
  if (key == 'd') right = true;
  if (key == ' ') space = true;
}

void keyReleased() {
  if (key == 'w') up = false;
  if (key == 's') down = false;
  if (key== 'a') left = false;
  if (key == 'd') right = false;
  if (key == ' ') space = false;
}