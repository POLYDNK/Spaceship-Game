/// @desc Draw Self and Control Stick

// Draw Self
draw_self();

// Draw Control Stick
var xOffset = xValue*cHalf;
var yOffset = yValue*cHalf;

combinedOffset = point_distance(x, y, x+xOffset, y+yOffset);

// If the distance of the combined offset goes outside the circle, then use a ratio to bring it back
if (combinedOffset > cHalf)
{
	ratio = cHalf / combinedOffset;
	
	xOffset *= ratio;
	yOffset *= ratio;
}

	
draw_sprite(sControlStick, 0, x + xOffset, y - yOffset);