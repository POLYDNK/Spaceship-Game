/// @desc Create Weapon Slots

// Inherit the parent event
event_inherited();

// Create Module Slots Here
wep_mod_1 = global.playerInventory.add_ship_module_slot(-60, -50, TYPE.WEAPON, SIZE.SMALL);
wep_mod_2 = global.playerInventory.add_ship_module_slot(10, 0, TYPE.WEAPON, SIZE.SMALL); 
wep_mod_3 = global.playerInventory.add_ship_module_slot(-60, 50, TYPE.WEAPON, SIZE.SMALL); 
eng_mod_1 = global.playerInventory.add_ship_module_slot(-120, 0, TYPE.ENGINE, SIZE.MEDIUM); 

// Fill Module Slots
//global.playerInventory.replace_module(ITEM.LASERMACHINE, wep_mod_1);
global.playerInventory.replace_module(ITEM.LASERMACHINE, wep_mod_2);
//global.playerInventory.replace_module(ITEM.LASERMACHINE, wep_mod_3);
global.playerInventory.replace_module(ITEM.SMALLENGINE, eng_mod_1);