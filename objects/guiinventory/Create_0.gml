/// @desc Vars

holding_item = false;
selected_item = false;
item_held = 0;
item_selected = 0;
item_card = noone;

// Item Card Menu
with (instance_create_depth(0, 0, depth-10, guiItemCard))
{
	other.item_card = self;
}
