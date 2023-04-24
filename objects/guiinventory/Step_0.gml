/// @desc Mouse interaction

// Temp vars
var inv_size = global.playerInventory.inventory_size;
var num_mod = global.playerInventory.num_of_modules;

// Find player ship
playerShip = instance_find(oPlayer, 0);

if (playerShip != noone)
{
	// Get Sprite Info
	spriteInfo = sprite_get_info(playerShip.sprite_index);
	
	// Reposition item card
	item_card.x = menuX + 50 + playerShip.sprite_width;
	item_card.y = menuY + 200;
	
	// Get inventory grid vars
	var mouseX = device_mouse_x_to_gui(0);
	var mouseY = device_mouse_y_to_gui(0);
	var invenX = menuX;
	var invenY = menuY + playerShip.sprite_height + 50;
	var row_counter = 0;
	var curr_row = 0;
	var curr_col = 0;
	
	// Iterate through player inventory
	for (var i = 0; i < inv_size+num_mod; i++)
	{
		// Get Pos
		var box_X = invenX + curr_col * box_W;
		var box_Y = invenY + curr_row * box_H;
		
		if (i >= inv_size)
		{
			box_X = menuX + spriteInfo.xoffset + global.playerInventory.modules[i-inv_size].x_pos - (box_W/2);
			box_Y = menuY + spriteInfo.yoffset + global.playerInventory.modules[i-inv_size].y_pos - (box_H/2);
		}
		
		// -------------- Drag and drop items -----------------
		// Find what box the mouse is hovering over (if any)
		if (mouseX >= box_X and mouseX <= box_X+box_W and mouseY >= box_Y and mouseY <= box_Y+box_H)
		{
			// Drop any item on right click
			if (mouse_check_button_pressed(mb_right))
			{
				global.playerInventory.drop_item(i, playerShip.x+random_range(-75,75), playerShip.y+random_range(-75,75));
				holding_item = false;
				selected_item = false;
				item_card.open = false;
			}
			
			// Picking up items on left click
			if (mouse_check_button_pressed(mb_left))
			{
				if (global.playerInventory.inventory[i]._id != ITEM.BLANK)
				{
					// Holding
					holding_item = true;
					item_card.open = true;
					item_card.item = global.playerInventory.inventory[i];
					item_held = i;
					
					// Selection toggle
					item_selected = !item_selected;
					selected_item = i;
				}
			}
			// Letting go of items when left click is released
			else if (mouse_check_button_released(mb_left))
			{
				// Swap items if item held is dropped on another item
				if (item_held != i)
				{
					global.playerInventory.swap_item(item_held, i);
				}
			}
		}
		// If the player has let go of an item outside of the inventory, then drop it
		else if (mouse_check_button_released(mb_left) and holding_item)
		{
			if (mouseX < margin_x or mouseX > view_width or mouseY < margin_y or mouseY > view_height)
			{
				global.playerInventory.drop_item(item_held, playerShip.x+random_range(-75,75), playerShip.y+random_range(-75,75));
			}
		}
	
		// If left click is not held, then the player cannot hold an item
		if (mouse_check_button(mb_left) == false)
		{
			holding_item = false;
		}
		//--------------------------------------------------------
		
		// Update Counters
		row_counter++;
		curr_col++;
	
		// Reset counters on end of row
		if (row_counter == row_length)
		{
			curr_row++;
			curr_col = 0;
			row_counter = 0;
		}
	}
}
