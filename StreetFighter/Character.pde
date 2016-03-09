//http://wiki.shoryuken.com/Street_Fighter_Alpha_3
//http://streetfighter.wikia.com/wiki/Street_Fighter_Alpha_3
class Character {
  Sprites sprites;

  String name;
  String url;

  int xSpeed = 10;
  int x = width/2;
  int y = height/2;

  String state = "idle";
  int direction = RIGHT;


  Character(String n) {
    name = n;
    sprites = new Sprites(name);
  } 

  void display() {
    sprites.display(state, direction, x, y);
  }

  void processKeyPressed(int k) {
    switch(k) {
    case LEFT:
      if (state == "walkingR" || state == "idle") {
        direction = LEFT;
        state = "walkingL";
      } else if (state == "walkingL"){
        x = max(x - xSpeed, 0);
      }
      break;
    case RIGHT:
      if (state == "walkingL" || state == "idle") {
        direction = RIGHT;
        state = "walkingR";
      } else if (state == "walkingR") {
        x = min(x + xSpeed, width - sprites.w);
      }
      break;
    }
  }
  
  void processKeyReleased(int k) {
    switch(k) {
    case LEFT:
    case RIGHT:
      if (state == "walkingL" || state == "walkingR") {
        state = "idle";
      }
      break;
    }
  }
}

