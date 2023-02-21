/// @desc Solar system room constructor

function solar_system(_index, x_position, y_position, _edges = edges[0] = -1) constructor
{
	index = _index;
	x_pos = x_position;
	y_pos = y_position;
	edges = _edges;
	my_room = room_duplicate(TemplateSolarSystem);
};