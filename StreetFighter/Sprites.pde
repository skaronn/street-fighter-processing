class Sprites {
  Boolean help = true;
  SpritesHelper spriteHelper;
  int idxDuration = 120;//number of frames during which a sprite is displayed
  int idxTime = millis();
  String prevState = "idle";

  PImage sprite;
  int w = 10;
  int h = 10;

  int walkIdx = 0;
  final int nbWalk = 7;
  final int[] walk = new int[2*nbWalk];
  final int walkW = 135;
  final int walkH = 140;

  int idleIdx = 0;
  final int nbIdle = 8;
  final int[] idle = new int[2*nbIdle];
  final int idleW = 120;
  final int idleH = 120;

  Sprites(String n) {
    String url = "sprites/" + n + ".gif";
    sprite = loadImage(url);
    loadSpritePositions();
    if (help) {
      spriteHelper = new SpritesHelper(sprite);
    }
  }

  void display(String state, int direction, int destx, int desty) {
    dealWithIdx(state, direction);

    int srcw;
    int srcx, srcy;
    int[] moveArray = {0, 0};
    int idx = 0;

    if (state == "walkingL" || state == "walkingR") {
      moveArray = walk;
      idx = walkIdx;
      w = walkW;
      h = walkH;
    } else if (state == "idle") {
      moveArray = idle;
      idx = idleIdx;
      w = idleW;
      h = idleH;
    }
    
    srcw = direction == LEFT ? -w : w;

    srcx = moveArray[2*idx] + (direction == LEFT ? w : 0);
    srcy = moveArray[2*idx+1];
    copy(sprite, srcx, srcy, srcw, h, destx, desty, w, h);

    prevState = state;

    if (help) {
      spriteHelper.displayRect(moveArray[2*idx], moveArray[2*idx+1], w, h);
    }
  }

  void dealWithIdx(String state, int direction) {
    // sprite should be changed immediately if the state has changed
    // otherwise, wait during [idxDuration] frames
    Boolean refresh = false;
    int currentTime = millis();

    if (state != prevState) {
      refresh = true;
      idxTime = currentTime;
      idleIdx = walkIdx = 0;
    } else if (currentTime - idxTime > idxDuration) {
      idxTime = currentTime;
      refresh = true;
    }

    if (refresh) {
      if (state == "walkingL" || state == "walkingR") {
        //        walkIdx = ((walkIdx - 1)%nbWalk+nbWalk)%nbWalk;
        walkIdx = (walkIdx+1)%nbWalk;
      } else if (state == "idle") {
        idleIdx = (idleIdx+1)%nbIdle;
      }
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

    /// IDLE
    idle[0] = 190;
    idle[1] = 547;
    idle[2] = 322;
    idle[3] = 547;
    idle[4] = 452;
    idle[5] = 547;
    idle[6] = 0;
    idle[7] = 681;
    idle[8] = 131;
    idle[9] = 681;
    idle[10] = 260;
    idle[11] = 681;
    idle[12] = 386;
    idle[13] = 681;
    idle[14] = 516;
    idle[15] = 681;
  }
}

