//Creating sprite using sprite sheets for animation
var mouse_moved = false;
var touch_started = false;
var explode_sprite_sheet;
var fighter_sprite_sheet;
var tile_sprite_sheet;
var explode_sprite;
var fighter_walk;
var fighter_stand;
var player_sprite;
var fighter_tiles;

function preload() {

	ground = loadAnimation('assets/data/stages/WatersideHouse/WatersideHouse-0.gif', 'assets/data/stages/WatersideHouse/WatersideHouse-1.gif',
	'assets/data/stages/WatersideHouse/WatersideHouse-2.gif', 'assets/data/stages/WatersideHouse/WatersideHouse-3.gif',
	'assets/data/stages/WatersideHouse/WatersideHouse-4.gif', 'assets/data/stages/WatersideHouse/WatersideHouse-5.gif', 
	'assets/data/stages/WatersideHouse/WatersideHouse-6.gif', 'assets/data/stages/WatersideHouse/WatersideHouse-7.gif');

	var fighterSpriteSheet = 'assets/data/sprites/ZangiefSFA3.gif';
  
	// Load the json for the tiles sprite sheet
	// fighter_tiles = loadJSON('assets/data/characters/zangief/tiles.json');	
	// var jsonFile = getJsonFile('/assets/data/characters/zangief/tiles.json');

	// Fighter stand animation passing in a SpriteSheet
	fighter_stand = loadAnimation(new SpriteSheet(fighterSpriteSheet, [{'name':'fighter_stand', 'frame':{'x':0, 'y': 0, 'width': 100, 'height': 150}}]));
	// fighter_stand = loadAnimation(new SpriteSheet(fighterSpriteSheet, fighter_tiles[0].frames.ground.stand));
  
	// Fighter idle frames
	var fighter_intro_frames = [
		{'name':'fighter_intro_frames_01', 'frame':{'x':0, 'y': 0, 'width': 90, 'height': 150}},
		{'name':'fighter_intro_frames_02', 'frame':{'x':95, 'y': 0, 'width': 90, 'height': 150}},
		{'name':'fighter_intro_frames_03', 'frame':{'x':189, 'y': 0, 'width': 90, 'height': 150}},
		{'name':'fighter_intro_frames_04', 'frame':{'x':294, 'y': 0, 'width': 90, 'height': 150}},
		{'name':'fighter_intro_frames_05', 'frame':{'x':404, 'y': 0, 'width': 90, 'height': 150}},
		{'name':'fighter_intro_frames_06', 'frame':{'x':504, 'y': 0, 'width': 140, 'height': 150}},
		{'name':'fighter_intro_frames_07', 'frame':{'x':25, 'y': 154, 'width': 126, 'height': 150}},
		{'name':'fighter_intro_frames_08', 'frame':{'x':147, 'y': 154, 'width': 138, 'height': 150}},
		{'name':'fighter_intro_frames_09', 'frame':{'x':288, 'y': 154, 'width': 138, 'height': 150}},
		{'name':'fighter_intro_frames_10', 'frame':{'x':420, 'y': 154, 'width': 180, 'height': 150}},
		{'name':'fighter_intro_frames_11', 'frame':{'x':48, 'y': 325, 'width': 168, 'height': 172}},
		{'name':'fighter_intro_frames_12', 'frame':{'x':208, 'y': 306, 'width': 158, 'height': 208}},
		{'name':'fighter_intro_frames_13', 'frame':{'x':360, 'y': 310, 'width': 180, 'height': 204}},
		{'name':'fighter_intro_frames_14', 'frame':{'x':-2, 'y': 484, 'width': 196, 'height': 234}}
	];
	
  // Fighter idle animation passing in a SpriteSheet
  fighter_intro = loadAnimation(loadSpriteSheet(fighterSpriteSheet, fighter_intro_frames));

  // Fighter idle frames
  var fighter_idle_frames = [
	{'name':'fighter_idle_frames_02', 'frame':{'x':194, 'y': 547, 'width': 120, 'height': 120}},
	{'name':'fighter_idle_frames_03', 'frame':{'x':326, 'y': 547, 'width': 120, 'height': 120}},
	{'name':'fighter_idle_frames_04', 'frame':{'x':455, 'y': 547, 'width': 120, 'height': 120}},
	{'name':'fighter_idle_frames_05', 'frame':{'x':0, 'y': 681, 'width': 130, 'height': 120}},
	{'name':'fighter_idle_frames_06', 'frame':{'x':128, 'y': 681, 'width': 130, 'height': 120}},
	{'name':'fighter_idle_frames_07', 'frame':{'x':257, 'y': 681, 'width': 130, 'height': 120}},
	{'name':'fighter_idle_frames_08', 'frame':{'x':384, 'y': 681, 'width': 130, 'height': 120}},
	{'name':'fighter_idle_frames_09', 'frame':{'x':516, 'y': 681, 'width': 130, 'height': 120}}
  ];
	
  // Fighter idle animation passing in a SpriteSheet
  fighter_idle = loadAnimation(loadSpriteSheet(fighterSpriteSheet, fighter_idle_frames));
  
  // Fighter walk frames
  var fighter_walk_frames = [
    {'name':'fighter_walk_frames_07', 'frame':{'x':395, 'y': 935, 'width': 140, 'height': 140}},
	{'name':'fighter_walk_frames_01', 'frame':{'x':170, 'y': 800, 'width': 130, 'height': 135}},
	{'name':'fighter_walk_frames_02', 'frame':{'x':305, 'y': 800, 'width': 140, 'height': 135}},
	{'name':'fighter_walk_frames_03', 'frame':{'x':445, 'y': 800, 'width': 140, 'height': 135}},
	{'name':'fighter_walk_frames_04', 'frame':{'x':0, 'y': 935, 'width': 140, 'height': 140}},
	{'name':'fighter_walk_frames_05', 'frame':{'x':150, 'y': 935, 'width': 140, 'height': 140}},
	{'name':'fighter_walk_frames_06', 'frame':{'x':295, 'y': 935, 'width': 110, 'height': 140}},
  ];
  
  // Fighter walk animation passing in a SpriteSheet
  fighter_walk = loadAnimation(loadSpriteSheet(fighterSpriteSheet, fighter_walk_frames));
}

function setup() {  
  createCanvas(800, 336);
  // Create the Player sprite and add it's animations
  fighter_sprite = createSprite(100, 264, 250, 250);
  fighter_sprite.addAnimation('stand', fighter_stand);
  var fighterAnimIntro = fighter_sprite.addAnimation('intro', fighter_intro);
  var fighterAnimWalk = fighter_sprite.addAnimation('walk', fighter_walk);
  var fighterAnimIdle = fighter_sprite.addAnimation('idle', fighter_idle);
}

function draw() {
  clear();
  background(0);

  if(keyWentDown(RIGHT))
  {
	fighter_sprite.mirrorX(1);
    fighter_sprite.changeAnimation('walk');
    fighter_sprite.animation.rewind();
    fighter_sprite.velocity.x = 2;
  }
  
  if(keyWentDown(LEFT))
  {
	fighter_sprite.mirrorX(-1);
    fighter_sprite.changeAnimation('walk');
    fighter_sprite.animation.rewind();
    fighter_sprite.velocity.x = -2;
  }
  
  if(keyWentUp(LEFT) || keyWentUp(RIGHT))
  {
	fighter_sprite.velocity.x = 0;
	fighter_sprite.changeAnimation('idle');
  }

  //draw the sprite
  animation(ground, 400, 168);
  drawSprites();
}

function touchStarted() {
  touch_started = true;
}

function mouseMoved() {
  mouse_moved = true;
}

function isTouch() {
  return touch_started && !mouse_moved;
}
