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
function DrawHealthBar(color, xPos, yPos) {
	
	var healthbarWidth = 52;
	var healthbarHeight = 6;
	
	// Draw Health Bar
	draw_sprite(sHealthBack, 0, xPos, yPos);
	draw_sprite_stretched_ext(sHealthHP,
							  0,
							  xPos,
							  yPos,
							  min((hp/hpMax) * healthbarWidth, healthbarWidth),
							  healthbarHeight,
							  color,
							  1);
	draw_sprite(sHealthBorder, 0, xPos, yPos);
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


/// @desc DrawSpriteWhenOffscreen(sprite) Draws a sprite for the player when the object is offscreen
/// @arg sprite - sprite to draw when object is offscreen
function DrawSpriteWhenOffscreen(argument0 = sRedArrow){
	
	// Red Arrow When Off Screen
	if (instance_exists(oCamera) and instance_exists(oPlayer))
	{	
		var arrowX = x;
		var arrowY = y;
		var drawArrow = true;
	
		var camX = camera_get_view_x(oCamera.cam);
		var camY = camera_get_view_y(oCamera.cam);
		var camW = camera_get_view_width(oCamera.cam);
		var camH = camera_get_view_height(oCamera.cam);
	
		
		if (x >= camX and x <= camX+camW)
		{
			if (y >= camY and y <= camY+camH)
			{
				drawArrow = false;
			}
		}
	
	
		if (drawArrow)
		{
			if (y >= camY and y <= camY+camH)
			{
				arrowY = y;
			}
			else if (y > camY)
			{
				arrowY = camY+camH;
			}
			else
			{
				arrowY = camY;
			}
		
			if (x >= camX and x <= camX+camW)
			{
				arrowX = x;
			}
			else if (x > camX)
			{
				arrowX = camX+camW;
			}
			else
			{
				arrowX = camX;
			}
		
			draw_sprite_ext(argument0,0,arrowX,arrowY,1,1,
			point_direction(oPlayer.x, oPlayer.y, x,y),c_white,1);
		}

	}
}