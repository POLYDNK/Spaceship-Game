/// @desc Draw Self, Show Orbit

if ((show_orbit == true) and (instance_exists(orbit_object)))
{
	var oX = orbit_object.x;
	var oY = orbit_object.y;
	draw_circle_color(oX, oY, point_distance(x, y, oX, oY), orbit_color, orbit_color, true);
}

draw_self();

