/// @desc Initialize Vars

// Margin from border
margin_x = 300;
margin_y = 200;

// Menu dimensions
full_x = RES_W - margin_x;
full_y = RES_H - margin_y;

// Menu Open
menu_open = false;

// My menu objects
solar_menu = noone;
inventory_menu = noone;

with (instance_create_depth(0, 0, depth-10, guiInventory))
{
	other.inventory_menu = self;
	map_width = other.full_x;
	map_height = other.full_y;
	margin_x = other.margin_x;
	margin_y = other. margin_y;
}

with (instance_create_depth(0, 0, depth-10, guiMapview))
{
	other.solar_menu = self;
	map_width = other.full_x;
	map_height = other.full_y;
	margin_x = other.margin_x;
	margin_y = other. margin_y;
}

instance_deactivate_object(solar_menu);
instance_deactivate_object(inventory_menu);

// My menu buttons
crafting_menu_button = noone;
inventory_menu_button = noone;
ship_menu_button = noone;
solar_menu_button = noone;

with (instance_create_depth(margin_x, margin_y-51, depth-15, guiMenuButton))
{
	target_menu = other;
	target_tab = TABS.CRAFTING;
	other.crafting_menu_button = self;
	selected = false;
	text = "Crafting";
}

with (instance_create_depth(margin_x+203, margin_y-51, depth-15, guiMenuButton))
{
	target_menu = other;
	target_tab = TABS.INVENTORY;
	other.inventory_menu_button = self;
	selected = false;
	text = "Inventory";
}

with (instance_create_depth(margin_x+406, margin_y-51, depth-15, guiMenuButton))
{
	target_menu = other;
	target_tab = TABS.SHIP_CONFIG;
	other.ship_menu_button = self;
	selected = false;
	text = "Ship";
}

with (instance_create_depth(margin_x+609, margin_y-51, depth-15, guiMenuButton))
{
	target_menu = other;
	target_tab = TABS.SOLAR_SYSTEM_MAP;
	other.solar_menu_button = self;
	selected = true;
	text = "Solar Map";
}

// Deactivate buttons
instance_deactivate_object(crafting_menu_button);
instance_deactivate_object(inventory_menu_button);
instance_deactivate_object(ship_menu_button);
instance_deactivate_object(solar_menu_button);



