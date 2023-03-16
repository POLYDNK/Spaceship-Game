/// @desc Dropping loot

instance_create_layer(x, y, layer_get_id("Items"), global.enemy_ship_loot.GetRandomObject());
