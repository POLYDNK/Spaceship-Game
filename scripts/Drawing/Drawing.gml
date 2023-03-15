/// @desc DrawSetText(colour, font, halign, valign) Allows one line setup of major text drawing vars.
/// @arg colour
/// @arg font
/// @arg hAlign
/// @arg vAlign
function DrawSetText(argument0, argument1, argument2, argument3) {
	
	draw_set_colour(argument0);
	draw_set_font(argument1);
	draw_set_halign(argument2);
	draw_set_valign(argument3);
}


/// @desc DrawHealthBar(color) Draws a Health Bar Relative to the Object Position
/// @arg color - color of the health bar

function DrawHealthBar(argument0) {
	
	var healthbarWidth = 52;
	var healthbarHeight = 6;

	// Update Health Bar Position
	var healthbarX = x - (healthbarWidth/2);
	var healthbarY = y - 50;
	
	// Draw Health Bar
	draw_sprite(sHealthBack, 0, healthbarX, healthbarY);
	draw_sprite_stretched_ext(sHealthHP,
							  0,
							  healthbarX,
							  healthbarY,
							  min((hp/hpMax) * healthbarWidth, healthbarWidth),
							  healthbarHeight,
							  argument0,
							  1);
	draw_sprite(sHealthBorder, 0, healthbarX, healthbarY);
}

/// @description draw_text_outline(x,y,str,outwidth,outcol,outfidelity)
/// @param x
/// @param y
/// @param str
/// @param outwidth
/// @param outcol
/// @param outfidelity
function DrawTextOutline(argument0, argument1, argument2, argument3, argument4, argument5) {
	//Created by Andrew McCluskey http://nalgames.com/
	//x,y: Coordinates to draw
	//str: String to draw
	//outwidth: Width of outline in pixels
	//outcol: Colour of outline (main text draws with regular set colour)
	//outfidelity: Fidelity of outline (recommended: 4 for small, 8 for medium, 16 for larger. Watch your performance!)

	var dto_dcol=draw_get_color();
	
	draw_set_color(argument4);

	for(var dto_i=45; dto_i<405; dto_i+=360/argument5)
	{
	    draw_text(argument0+lengthdir_x(argument3,dto_i),argument1+lengthdir_y(argument3,dto_i),string_hash_to_newline(argument2));
	}

	draw_set_color(dto_dcol);
	draw_text(argument0,argument1,string_hash_to_newline(argument2));
}
