/// @desc Draw Self, Show Orbit

if ((show_orbit == true) and (instance_exists(orbit_object)))
{
	var oX = orbit_object.x;
	var oY = orbit_object.y;
	draw_circle_color(oX, oY, point_distance(x, y, oX, oY), orbit_color, orbit_color, true);
}

if (playerCollision)
{
	// Draw outline when colliding w/ a player
	draw_circle_color(x, y, sprite_width/2+10, c_yellow, c_yellow, false);
}

draw_self();
