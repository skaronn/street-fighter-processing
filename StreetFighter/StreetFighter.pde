Character c1;

void setup() {
  size(600, 300);
    frame.setTitle("Street Fighter");
  c1 = new Character("Zangief");
}

void draw() {
  background(60);
  c1.display();
}

void keyPressed() {
  if (key == CODED) {
    switch(keyCode) {
    case LEFT:
    case RIGHT:
      c1.processKey(keyCode);
      break;
    }
  }
}

