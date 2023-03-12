/// @desc Draw Inventory Menu

// Temp vars
var inv_size = global.playerInventory.inventory_size;
var num_mod = global.playerInventory.num_of_modules;

// Find player ship
playerShip = instance_find(oPlayer, 0);

if (playerShip != noone)
{
	// Get Sprite Info
	spriteInfo = sprite_get_info(playerShip.sprite_index);
	
	// Drawing Setup
	draw_set_alpha(1);
	DrawSetText(c_white, fData, fa_left, fa_top);
	
	// Draw Player Ship
	draw_rectangle_color(menuX, menuY, menuX + playerShip.sprite_width, menuY + playerShip.sprite_height, c_teal, c_teal, c_teal, c_teal, false);
	draw_sprite(playerShip.sprite_index, 0, spriteInfo.xoffset + menuX, spriteInfo.yoffset + menuY);
	
	// Draw Player Modules
	for (var i = 0; i < num_mod; i++)
	{
		// GetPos
		var currModule = global.playerInventory.inventory[i+inv_size];
		var sprite = currModule._sprite;
		var X = menuX + spriteInfo.xoffset + global.playerInventory.modules[i].x_pos - (box_W/2);
		var Y = menuY + spriteInfo.yoffset + global.playerInventory.modules[i].y_pos - (box_H/2);
		
		// Draw Module
		var wep_icon = sWeaponTypeIcon;
		var siz_icon = sSmallSizeIcon;
		
		switch (global.playerInventory.modules[i]._type)
		{
			case TYPE.WEAPON:
				draw_set_color(c_maroon);
				break;
				
			case TYPE.ENGINE:
				draw_set_color(c_aqua);
				wep_icon = sEngineTypeIcon;
				break;
				
			case TYPE.ACTIVE:
				draw_set_color(c_green);
				wep_icon = sActiveTypeIcon;
				break;
			
			default:
				draw_set_color(c_black);
				break;
		}
		
		switch (global.playerInventory.modules[i]._size)
		{
			case SIZE.MEDIUM:
				siz_icon = sMediumSizeIcon;
				break;
				
			case SIZE.LARGE:
			
			default:
				break;
		}
		
		draw_set_alpha(0.5);
		draw_rectangle(X, Y, X+box_W, Y+box_H, false);
		draw_set_alpha(1);
		draw_sprite_stretched(sprite, 0, X, Y, box_W, box_H);
		draw_sprite_stretched(wep_icon, 0, X+(box_W*0.75), Y+(box_H*0.75), box_W*0.25, box_H*0.25);
		draw_sprite_stretched(siz_icon, 0, X, Y+(box_H*0.75), box_W*0.25, box_H*0.25);
		draw_rectangle(X+1, Y+1, X+box_W-1, Y+box_H-1, true);
	}
	
	// Draw Ship Stats
	draw_set_color(c_white);
	var textX = menuX + 50 + playerShip.sprite_width;
	var textY = menuY;
	draw_text(textX, textY, "Ship Name: " + playerShip.ship_name);
	draw_text(textX, textY + 20, "Max HP: " + string(playerShip.hpMax));
	draw_text(textX, textY + 40, "Max Speed: " + string(playerShip.maxSpeed));
	draw_text(textX, textY + 60, "Acceleration: " + string(playerShip.acceleration));
	draw_text(textX, textY + 80, "Turning Speed: " + string(playerShip.traverseSpeed));
	draw_text(textX, textY + 100, "Mass: " + string(playerShip.mass));
	draw_text(textX, textY + 120, "Drag: " + string((playerShip.dragPercent-1)*-100) + "%");
	
	// Draw Inventory
	var invenX = menuX;
	var invenY = menuY + playerShip.sprite_height + 50;
	var row_counter = 0;
	var curr_row = 0;
	var curr_col = 0;
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	// Iterate through player inventory
	for (var i = 0; i < inv_size; i++)
	{
		// Get Pos
		var box_X = invenX + curr_col * box_W;
		var box_Y = invenY + curr_row * box_H;
		var mouseX = device_mouse_x_to_gui(0);
		var mouseY = device_mouse_y_to_gui(0)
		
		// Draw Item Boxes
		if (holding_item and i == item_held)
		{
			// Draw a blank for held items
			draw_sprite_stretched(sBlank, 0, box_X, box_Y, box_W, box_H);
		}
		else
		{
			// Draw the item's sprite for everything else
			draw_sprite_stretched(global.playerInventory.inventory[i]._sprite, 0, box_X, box_Y, box_W, box_H);
		}
		
		// Draw box outline
		draw_rectangle(box_X+1, box_Y+1, box_X + box_W-1, box_Y + box_H-1, true);
		
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
	
	// Draw held box
	if (holding_item)
	{
		draw_sprite_stretched(global.playerInventory.inventory[item_held]._sprite, 0, mouseX-(box_W/2), mouseY-(box_H/2), box_W, box_H);
	}
	
	// Draw resources
	var resourceX = invenX + (row_length * box_W) + 50;
	var resourceY = invenY;
	
	draw_text(resourceX, resourceY, "Iron: " + string(global.playerInventory.iron));
}
