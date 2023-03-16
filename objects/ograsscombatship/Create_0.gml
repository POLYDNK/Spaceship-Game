/// @desc Create Weapon Slots

// Inherit the parent event
event_inherited();

// Create Module Slots Here
wep_mod_1 = global.playerInventory.add_ship_module_slot(-40, -100, TYPE.WEAPON, SIZE.SMALL);
wep_mod_2 = global.playerInventory.add_ship_module_slot(100, 0, TYPE.WEAPON, SIZE.SMALL); 
wep_mod_3 = global.playerInventory.add_ship_module_slot(-40, 100, TYPE.WEAPON, SIZE.SMALL); 
eng_mod_1 = global.playerInventory.add_ship_module_slot(-120, 0, TYPE.ENGINE, SIZE.MEDIUM); 
act_mod_1 = global.playerInventory.add_ship_module_slot(0, 0, TYPE.ACTIVE, SIZE.MEDIUM); 

// Fill Module Slots
global.playerInventory.replace_module(ITEM.LASERCANNON, wep_mod_1);
global.playerInventory.replace_module(ITEM.SMALLDRILL, wep_mod_2);
global.playerInventory.replace_module(ITEM.LASERCANNON, wep_mod_3);
global.playerInventory.replace_module(ITEM.MEDIUMENGINE, eng_mod_1);
global.playerInventory.replace_module(ITEM.MEDIUMBUBBLE, act_mod_1);