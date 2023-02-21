/// @desc Create Solar Systems

NUMBER_OF_SOLAR_SYSTEMS = 10; // The number of solar systems in the galaxy
edges_empty[0] = -1;          // Edges store indexes of solar systems, -1 = null

var prev_X = 0;
var prev_Y = 0;
var curr_X = 0;
var curr_Y = 0;

global.gate_map = ds_map_create();

// Let's generate a graph that represents this galaxy. Solar systems are
// represented as nodes, and warp gates are represented as edges.
// ----------------------------------------------------------------------

global.galaxy[0] = new solar_system(0, 0, 0, edges_empty); // First solar system

// All other solar systems
for (var i = 1; i < NUMBER_OF_SOLAR_SYSTEMS; i++)
{
	// Get a random position away from the previous galaxy
	curr_X = random_range(-500, 500);
	curr_Y = random_range(-400, 400);
	
	// Create solar system
	global.galaxy[i] = new solar_system(i, curr_X,curr_Y, edges_empty);
	
	// Iterate through the graph to create edges based on
	// the distance of neighboring solar systems
	for (var X = 0; X < i; X++)
	{	
		// Store current solar system in var
		var ss = global.galaxy[X];
		var dist = point_distance(curr_X, curr_Y, ss.x_pos, ss.y_pos);
			
		// If solar system is close enough, then store in the list of edges
		// and then create the appropriate warp gates
		if (dist <= 400)
		{
			var scale = 5000 / dist;
			var warp_x = (ss.x_pos - curr_X) * scale;
			var warp_y = (ss.y_pos - curr_Y) * scale;
			var newGate;
			
			// Push index of other in this edges
			if (global.galaxy[i].edges[0] == -1)
			{
				global.galaxy[i].edges[0] = X;
			}
			else
			{
				array_push(global.galaxy[i].edges, X);
			}
			newGate = room_instance_add(global.galaxy[i].my_room, warp_x, warp_y, oWarpGate);
			ds_map_add(global.gate_map, newGate, X);

			// Push index of this in other edges
			if (global.galaxy[X].edges[0] == -1)
			{
				global.galaxy[X].edges[0] = i;
			}
			else
			{
				array_push(global.galaxy[X].edges, i);
			}
			newGate = room_instance_add(global.galaxy[X].my_room, -warp_x, -warp_y, oWarpGate);
			ds_map_add(global.gate_map, newGate, i);
		}
	}
}

// Populate Solar Systems
for (var i = 0; i < array_length(global.galaxy); i++)
{
	generate_solar_system(global.galaxy[i].my_room);
}
