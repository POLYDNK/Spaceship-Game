/// @desc Create Weapon Slots

// Inherit the parent event
event_inherited();

// Create Module Slots Here
wep_mod_1 = global.playerInventory.add_ship_module_slot(-30, -225, TYPE.WEAPON, SIZE.MEDIUM);
wep_mod_2 = global.playerInventory.add_ship_module_slot(280, 0, TYPE.WEAPON, SIZE.SMALL); 
wep_mod_3 = global.playerInventory.add_ship_module_slot(-30, 225, TYPE.WEAPON, SIZE.MEDIUM); 
eng_mod_1 = global.playerInventory.add_ship_module_slot(-500, -180, TYPE.ENGINE, SIZE.MEDIUM); 
eng_mod_2 = global.playerInventory.add_ship_module_slot(-500, 180, TYPE.ENGINE, SIZE.MEDIUM)

// Fill Module Slots
global.playerInventory.replace_module(ITEM.LASERMACHINE, wep_mod_1);
global.playerInventory.replace_module(ITEM.LASERMACHINE, wep_mod_2);
global.playerInventory.replace_module(ITEM.LASERMACHINE, wep_mod_3);
global.playerInventory.replace_module(ITEM.SMALLENGINE, eng_mod_1);
global.playerInventory.replace_module(ITEM.SMALLENGINE, eng_mod_2);

// Create Booster Flames
booster[3] = instance_create_depth(0,0,depth+350, oBooster);
booster[3].wielder = self;
booster[3].xOffset = -600;
booster[3].yOffset = -260;
booster[3].rotation = 180;
booster[3].facing = DIRECTION.LEFTFORWARD;

booster[2] = instance_create_depth(0,0,depth+350, oBooster);
booster[2].wielder = self;
booster[2].xOffset = -600;
booster[2].yOffset = 90;
booster[2].rotation = 180;
booster[2].facing = DIRECTION.RIGHTFORWARD;

booster[1] = instance_create_depth(0,0,depth+350, oBooster);
booster[1].wielder = self;
booster[1].xOffset = 340;
booster[1].yOffset = -140;
booster[1].rotation = 90;
booster[1].facing = DIRECTION.RIGHT;

booster[0] = instance_create_depth(0,0,depth+350, oBooster);
booster[0].wielder = self;
booster[0].xOffset = 185;
booster[0].yOffset = 140;
booster[0].rotation = 270;
booster[0].facing = DIRECTION.LEFT;