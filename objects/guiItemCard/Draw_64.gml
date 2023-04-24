/// @desc Draw item if inventory is open

if (open and global.current_tab == TABS.INVENTORY)
{
	var margin_top = height * (margin_top_percent / 100);
	var margin_sides = width * (margin_sides_percent / 100);
	var X = x + margin_sides;
	var Y = y + margin_top;

	// Backdrop
	draw_rectangle_color(x, y, x+width, y+height, c_silver, c_grey, c_black, c_silver, false);

	// Outline
	draw_rectangle_color(x, y, x+width, y+height, c_orange, c_yellow, c_orange, c_yellow, true);
	
	if (item != noone)
	{
		// Item name
		DrawSetText(c_white, fMenu, fa_center, fa_bottom); 
		draw_text(x + (width/2), Y, item._name);
		Y += 32;

		// Sprite
		var spriteInfo = sprite_get_info(item._sprite);
		var s_width = width - (margin_sides * 2)
		var s_height = (s_width / spriteInfo.width) * spriteInfo.height; // Scale height with sprite
		var spriteX = X + s_width;
		var spriteY = Y + s_height;
		draw_rectangle_color(X, Y, spriteX, spriteY, c_aqua, c_green, c_aqua, c_green, false);
		draw_sprite_stretched(item._sprite, 0, X, Y, s_width, s_height);
		draw_rectangle_color(X, Y, spriteX, spriteY, c_orange, c_yellow, c_orange, c_yellow, true);
		Y += s_height + margin_top;

		// Properties
		DrawSetText(c_white, fData, fa_left, fa_top);
		for (var i = 0; i < array_length(item._properties); i++)
		{
			draw_text(X, Y+i*16, item._properties[i]);
		}
	}
}
