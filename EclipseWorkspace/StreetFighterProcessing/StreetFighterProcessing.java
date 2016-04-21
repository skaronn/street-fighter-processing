//import ddf.minim.AudioPlayer;
//import ddf.minim.Minim;
import processing.core.PApplet;
import processing.core.PImage;

public class StreetFighterProcessing extends PApplet {

	static int WIDTH = 800;
	static int HEIGHT = 336;

	final int INSERT_COIN_CONTEXT = 0;
	final int CHARACTER_SELECTION_CONTEXT = 1;
	final int FIGHT_CONTEXT = 2;
	final int BONUS_CONTEXT = 3;
	final int CINEMATIC_CONTEXT = 4;
	int context;

	int refreshMillis = 130;
	int lastRefresh = millis();

	int SOIL;
	int AIR;
	int CLOSE;
	int HOLD;

	int KEY_LEFT;
	int KEY_UP;
	int KEY_RIGHT;
	int KEY_DOWN;
	int KEY_HIGH_PUNCH;
	int KEY_PUNCH;
	int KEY_MEDIUM_PUNCH;
	int KEY_LOW_PUNCH;
	int KEY_HIGH_KICK;
	int KEY_KICK;
	int KEY_LOW_KICK;
	int KEY_MEDIUM_KICK;

	Game game;
	Character c1;
	Character c2;
//	Minim minim;
//	AudioPlayer playgroundMusic;
	PImage[] playgroundStageImages;
	int psgiIdx;
	int nbPlaygroundStageImages = 8;

	public void setup() {
		size(WIDTH, HEIGHT);
		c1 = new Character("Zangief", this);
//		frame.setTitle("Street Fighter");
		context = FIGHT_CONTEXT;
		game = new Game(c1, c1, "WatersideHouse", "themes/119_heavy_swell_(theme_of_zangief).mp3", 180);
//		minim = new Minim(this);
//		playgroundMusic = minim.loadFile(game.musicPath);
//		playgroundMusic.loop();
		playgroundStageImages = new PImage[nbPlaygroundStageImages];
		for (int i = 0; i < nbPlaygroundStageImages; i++) {
			playgroundStageImages[i] = loadImage("stages/" + game.imagePath + "/" + game.imagePath + "-" + i + ".gif");
		}
	}

	public void draw() {
		background(60);

		int currRefresh = millis();
		if (currRefresh - lastRefresh > refreshMillis) {
			psgiIdx = (psgiIdx + 1) % 8;
			lastRefresh = currRefresh;
		}

		image(playgroundStageImages[psgiIdx], 0, 0);
		
		c1.display();

	}

	public void keyPressed() {
		switch (context) {
		case INSERT_COIN_CONTEXT:
			break;
		case CHARACTER_SELECTION_CONTEXT:
			break;
		case FIGHT_CONTEXT:
			if (key == CODED) {
				switch (keyCode) {
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

	public void keyReleased() {
		switch (context) {
		case INSERT_COIN_CONTEXT:
			break;
		case CHARACTER_SELECTION_CONTEXT:
			break;
		case FIGHT_CONTEXT:
			if (key == CODED) {
				switch (keyCode) {
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

}
