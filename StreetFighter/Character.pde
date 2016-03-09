//http://wiki.shoryuken.com/Street_Fighter_Alpha_3
//http://streetfighter.wikia.com/wiki/Street_Fighter_Alpha_3
class Character {
  
  String name;
  String url;
  PImage sprite;
  
  Character(String n){
     name = n;
     url = "/sprites/" + n + ".gif";
     sprite = loadImage(url, "gif");
  } 
}