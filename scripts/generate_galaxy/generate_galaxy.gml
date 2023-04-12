/// @desc Create Solar Systems

randomize(); // New Seed

NUMBER_OF_SOLAR_SYSTEMS = 20; // The number of solar systems in the galaxy
min_dist = 100;                // Minimum distance solar spawn from each other
max_dist = 200;               // Maximum distance solar spawn from each other
edges_empty[0] = -1;          // Edges store indexes of solar systems, -1 = null

var curr_X = 0;
var curr_Y = 0;

global.current_solar_system = 0;
global.gate_map = ds_map_create();

// Let's generate a graph that represents this galaxy. Solar systems are
// represented as nodes, and warp gates are represented as edges.
// ----------------------------------------------------------------------

global.galaxy[0] = new solar_system(0, 0, 0, edges_empty); // First solar system

// All other solar systems
for (var i = 1; i < NUMBER_OF_SOLAR_SYSTEMS; i++)
{
    var validPosition = false;

    while (!validPosition)
    {
        // Get a random position away from the previous galaxy
        var randX = random_range(min_dist, max_dist);
        curr_X += choose(-randX, randX);

        var randY = random_range(min_dist, max_dist);
        curr_Y += choose(-randY, randY);

        validPosition = true;

        // Check if the new position is far enough from existing solar systems
        for (var j = 0; j < i; j++)
        {
            if (point_distance(curr_X, curr_Y, global.galaxy[j].x_pos, global.galaxy[j].y_pos) < min_dist)
            {
                validPosition = false;
                break;
            }
        }
    }

    // Create solar system
    global.galaxy[i] = new solar_system(i, curr_X, curr_Y, edges_empty);
    
    // Iterate through the graph to create edges based on
    // the distance of neighboring solar systems
    for (var X = 0; X < i; X++)
    {    
        // Store current solar system in var
        var ss = global.galaxy[X];
        var dist = point_distance(curr_X, curr_Y, ss.x_pos, ss.y_pos);
            
        // If solar system is close enough, then store in the list of edges
        // and then create the appropriate warp gates
        if (dist <= point_distance(0, 0, max_dist, max_dist))
        {
            // Check if both solar systems have less than 4 edges
            if (array_length(global.galaxy[i].edges) <= 3 && array_length(global.galaxy[X].edges) <= 3)
            {
                var scale = 10000 / dist;
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
}

// Populate Solar Systems
for (var i = 0; i < array_length(global.galaxy); i++)
{
	generate_solar_system(global.galaxy[i].my_room);
}
