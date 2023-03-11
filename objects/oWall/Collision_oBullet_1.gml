/// @desc Create Bullet Hitspark

with(other)
{	
	instance_change(oHitSpark,true);
	
	if (x > other.bbox_right)
	{
		x = other.bbox_right;
		image_angle = 180;
		sideHit = true;
	}
	else if (x < other.bbox_left)
	{
		x = other.bbox_left;
		sideHit = true;
	}
	else if (y >= other.bbox_top)
	{
		y = other.bbox_top;
		image_angle = 90;
		sideHit = false;
	}
	else if (y <= other.bbox_bottom)
	{
		y = other.bbox_bottom;
		image_angle = 270;
		sideHit = false;
	}
	
	if (sideHit)
	{
		if (place_meeting(x, y, other) == true)
		{
			while (place_meeting(x, y, other))
			{
				x -= lengthdir_x(1, direction);
			}
		}
		else
		{
			while (place_meeting(x, y, other))
			{
				x += lengthdir_x(1, direction);
			}
		}
	}
	else
	{
		if (place_meeting(x, y, other) == true)
		{
			while (place_meeting(x, y, other))
			{
				y -= lengthdir_y(1, direction);
			}
		}
		else
		{
			while (place_meeting(x, y, other))
			{
				y += lengthdir_y(1, direction);
			}
		}
	}
}