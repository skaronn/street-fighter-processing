//http://www.fightersgeneration.com/games/sfa3.html
//http://imgur.com/a/GPlx4
//http://downloads.khinsider.com/game-soundtracks/album/street-fighter-alpha-3
//http://maxmp3.co/download-street-fighter-alpha-3-ost-heavy-swell-theme-of-zangief-178486104/
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