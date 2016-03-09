//http://wiki.shoryuken.com/Street_Fighter_Alpha_3
//http://streetfighter.wikia.com/wiki/Street_Fighter_Alpha_3
class Character {
  Sprites sprites;

  String name;
  String url;

  int xSpeed = 30;
  int x = width/2;
  int y = height/2;

  String direction = "walkingR";


  Character(String n) {
    name = n;
    sprites = new Sprites(name);
  } 

  void display() {
    sprites.display(direction, x, y);
  }

  void processKey(int k) {
    switch(k) {
    case LEFT:
      if (direction == "walkingR") {
        direction = "walkingL";
      } else {
        sprites.dealWithIdx(LEFT);
        x = max(x - xSpeed, 0);
      }
      break;
    case RIGHT:
      if (direction == "walkingL") {
        direction = "walkingR";
      } else {
        sprites.dealWithIdx(RIGHT);
        x = min(x + xSpeed, width - sprites.w);
      }
      break;
    }
  }
}

