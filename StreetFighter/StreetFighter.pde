import ddf.minim.*;

Character c1;
Character c2;
PImage playgroundStage;
Minim minim;
AudioPlayer playgroundMusic;
Game game;

void setup() {
  size(800, 336);
  frame.setTitle("Street Fighter");
  c1 = new Character("Zangief");
//  c2 = new Character("Zangief");
  game = new Game(c1, c2, "stages/NYFd64r.gif", "themes/119_heavy_swell_(theme_of_zangief).mp3", 180);
  playgroundStage = loadImage(game.imagePath, "gif");
  minim = new Minim(this);
  playgroundMusic = minim.loadFile(game.musicPath);
  playgroundMusic.loop();
}

void draw() {
  background(60);
  image(playgroundStage, 0, 0);
  c1.display();
}

void keyPressed() {
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
}

void keyReleased() {
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
}
