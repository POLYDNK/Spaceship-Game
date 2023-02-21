/// @desc Follow Wielder

// Stay with Wielder 
var ang = point_direction(0, 0, xOffset, yOffset) + wielder.image_angle;
var dist = point_distance(0, 0, xOffset, yOffset);
							  
x = wielder.x + lengthdir_x(dist, ang);
y = wielder.y + lengthdir_y(dist, ang);

// Adjust Image Scale and Rotation
image_angle = wielder.image_angle+rotation;
image_xscale = xScale;
image_yscale = yScale;