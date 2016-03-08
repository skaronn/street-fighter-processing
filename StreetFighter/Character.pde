class Character {
  String name;
  String url;
  PImage sprite;
  
  Character(String n){
     name = n;
     url = n + ".gif";
     sprite = loadImage(url);
  } 
}
