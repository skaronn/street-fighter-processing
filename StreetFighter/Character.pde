//http://streetfighter.wikia.com/wiki/Street_Fighter_Alpha_3
//http://wiki.shoryuken.com/Street_Fighter_Alpha_3
//http://strategywiki.org/wiki/Street_Fighter_Alpha/Characters/Zangief#Street_Fighter_Alpha_3
//http://streetfighter.wikia.com/wiki/List_of_moves_in_Street_Fighter_Alpha_3_A-G
//http://streetfighter.wikia.com/wiki/List_of_moves_in_Street_Fighter_Alpha_3_I-Z
class Character {

  Sprites sprites;
  String name;
  String stage;
  String theme;

  int xSpeed = 10;
  int x = width / 2;
  int y = height / 2;

  String state = "idle";
  int direction = RIGHT;

  Character(String n) {
    name = n;
    sprites = new Sprites(name);
    JSONObject json = loadJSONObject("characters/"+name+".json");
    String stage = "stages/"+json.getString("stage");
    String theme = "themes/"+json.getString("theme");
    println(stage + "," + theme);
    JSONArray attacks = json.getJSONArray("attacks"); 
    String attackName;
    JSONObject attackObject;
    JSONArray inputs;
    for (int i = 0; i < attacks.size(); i++) {
      attackObject = attacks.getJSONObject(i); 
      attackName = attackObject.getString("name");
      inputs = attackObject.getJSONArray("inputs");  
      println(attackName + ", " + inputs);
    }
    JSONArray sounds = json.getJSONArray("sounds");
    String action, sound;
    JSONObject soundObject;
    for (int i = 0; i < sounds.size(); i++) {
      soundObject = sounds.getJSONObject(i); 
      action = soundObject.getString("action");  
      sound = soundObject.getString("sound");  
      println(action + ", " + sound);
    }
  } 

  void display() {
    state = sprites.display(state, direction, x, y);
  }

  void processKeyPressed(int k) {
    switch(k) {
    case LEFT:
      if (state == "walkingR" || state == "idle") {
        direction = LEFT;
        state = "walkingL";
      }
      x = max(x - xSpeed, 0);
      break;
    case RIGHT:
      if (state == "walkingL" || state == "idle") {
        direction = RIGHT;
        state = "walkingR";
      }
      x = min(x + xSpeed, width - sprites.w);
      break;
    case DOWN:
      state = "crouch";
      break;
    case SHIFT:
      if(state != "crouch"){
        state = "fist";
      }
      break;
    }
  }

  void processKeyReleased(int k) {
    switch(k) {
    case LEFT:
    case RIGHT:
      if (state == "walkingL" || state == "walkingR") {
        state = "idle";
      }
      break;
    case DOWN:
      if (state == "crouch") {
        state = "idle";
      }
      break;
    case SHIFT:

      break;
    }
  }
  
}
