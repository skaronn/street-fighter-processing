class Game {

	Character characterLeft;
	Character characterRight;
	String imagePath;
	String musicPath;
	int timeout;

	Game(Character characterLeft, Character characterRight, String imagePath, String musicPath, int timeout) {
		this.characterLeft = characterLeft;
		this.characterRight = characterRight;
		this.imagePath = imagePath;
		this.musicPath = musicPath;
		this.timeout = timeout;
	}

}