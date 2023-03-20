/// @desc Dropping loot, Effects

// Inheritance
event_inherited();

// Loot
instance_create_layer(x, y, layer_get_id("Items"), global.enemy_ship_loot.GetRandomObject());

// Effects
ApplyScreenshake(0.5, 3, 60);
