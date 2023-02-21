/// @desc Move Away


var ang  = point_direction(x,y,other.x,other.y); // angle to ship
	
x += -2 * dcos(ang);
y -= -2 * dsin(ang);

