class Sprites {
  Boolean help = true;
  SpritesHelper spriteHelper;

  PImage sprite;
  int w = 135;
  int h = 140;

  int walkIdx = 0;
  final int nbWalk = 7;
  final int[] walk = new int[2*nbWalk];

  Sprites(String n) {
    String url = n + ".gif";
    sprite = loadImage(url);
    loadSpritePositions();
    if (help) {
      spriteHelper = new SpritesHelper(sprite);
    }
  }

  void display(String state, int destx, int desty) {
    int destw = w;
    int srcw = state == "walkingL" ? -destw : destw;
    int srcx = walk[2*walkIdx] + (state == "walkingL" ? destw : 0);
    int srcy = walk[2*walkIdx+1];
    copy(sprite, srcx, srcy, srcw, h, destx, desty, destw, h);
    if (help) {
      spriteHelper.displayRect(walk[2*walkIdx], walk[2*walkIdx+1], w, h);
    }
  }

  void dealWithIdx(int dir) {
    if (dir == LEFT) {
      walkIdx = ((walkIdx - 1)%nbWalk+nbWalk)%nbWalk;
    } else if (dir == RIGHT) {
      walkIdx = (walkIdx+1)%nbWalk;
    }
//    println("walkIdx: " + walkIdx);
  }

  void loadSpritePositions() {
    /// WALKING
    walk[0] = 175; 
    walk[1] = 800;
    walk[2] = 310; 
    walk[3] = 800;
    walk[4] = 445; 
    walk[5] = 800;
    walk[6] = 5; 
    walk[7] = 940;
    walk[8] = 155; 
    walk[9] = 940;
    walk[10] = 285; 
    walk[11] = 935;
    walk[12] = 385; 
    walk[13] = 935;
  }
}

