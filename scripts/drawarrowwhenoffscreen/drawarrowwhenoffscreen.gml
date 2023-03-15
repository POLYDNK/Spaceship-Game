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