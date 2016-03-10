import ddf.minim.*;

final int INSERT_COIN_CONTEXT = 0;
final int CHARACTER_SELECTION_CONTEXT = 1;
final int FIGHT_CONTEXT = 2;
final int BONUS_CONTEXT = 3;

int context;
int refreshMillis = 130;
int lastRefresh = millis();

Game game;
Character c1;
Character c2;
Minim minim;
AudioPlayer playgroundMusic;
PImage[] playgroundStageImages;
int psgiIdx;
int nbPlaygroundStageImages = 8;

void setup() {
  size(800, 336);
  frame.setTitle("Street Fighter");
  context = FIGHT_CONTEXT;
  c1 = new Character("Zangief");
  game = new Game(c1, c1, "WatersideHouse", "themes/119_heavy_swell_(theme_of_zangief).mp3", 180);
  minim = new Minim(this);
  playgroundMusic = minim.loadFile(game.musicPath);
  playgroundMusic.loop();
  playgroundStageImages = new PImage[nbPlaygroundStageImages];
  for (int i = 0; i < nbPlaygroundStageImages; i++) {
   playgroundStageImages[i] = loadImage("stages/"+game.imagePath+"/"+game.imagePath+"-"+i+".gif");
  }
}

void draw() {
  background(60);
  
  int currRefresh = millis();
  if(currRefresh - lastRefresh > refreshMillis){
    psgiIdx = (psgiIdx+1) % 8;
    lastRefresh = currRefresh;
  } 
  
  image(playgroundStageImages[psgiIdx], 0, 0);
  c1.display();
}

void keyPressed() {
 switch(context) {
    case INSERT_COIN_CONTEXT:
      break;
    case CHARACTER_SELECTION_CONTEXT:
      break;
    case FIGHT_CONTEXT:
        if (key == CODED) {
	    switch(keyCode) {
	      case LEFT:
	      case RIGHT:
              case DOWN:
	      case SHIFT:
	        c1.processKeyPressed(keyCode);
		break;
	    }
         }
      break;
    case BONUS_CONTEXT:
      break;
  }
}

void keyReleased() {
 switch(context) {
    case INSERT_COIN_CONTEXT:
      break;
    case CHARACTER_SELECTION_CONTEXT:
      break;
    case FIGHT_CONTEXT:
        if (key == CODED) {
            switch(keyCode) {
              case LEFT:
              case RIGHT:
              case DOWN:
              case SHIFT:
                c1.processKeyReleased(keyCode);
              break;
            }
         }
      break;
    case BONUS_CONTEXT:
      break;
  }
}
