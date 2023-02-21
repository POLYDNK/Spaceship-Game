/// -------------------------------------------------------------
/// Scripts used to draw gameplay menus (only use in draw events)
/// -------------------------------------------------------------

/// @desc DrawSolarMap() draw solar system map
/// @arg map_width - width of draw space
/// @arg map_height - height of draw space
/// @arg map_x - x position of map
/// @arg map_y - y position of map
function DrawSolarMap(map_width, map_height, map_x, map_y)
{
	// Vars
	var map_half_w = map_width / 2;
	var map_half_h = map_height / 2;
	
	// Draw Current Solar System Text
	DrawSetText(c_white, fMenu, fa_left, fa_top);
	draw_text(map_x + 5, map_y + 5, "Current System: " + string(Galaxy.current_solar_system));
	draw_text(map_x + 5, map_y + 40, "Number of Gates: " + string(ds_map_size(global.gate_map)));
	var edges_count = array_length(global.galaxy[Galaxy.current_solar_system].edges);
	draw_text(map_x + 5, map_y + 75, "Edges: " + string(edges_count));

	// Draw Solar Systems
	for (var i = 0; i < array_length(global.galaxy); i++)
	{
		var currSolar = global.galaxy[i];     // current solar system
		var X = currSolar.x_pos + map_half_w; // get x pos
		var Y = currSolar.y_pos + map_half_h; // get y pos
		var I = currSolar.index;              // get index
		
		// Check whether the current solar system is within the drawing space
		if (X >= map_x and X <= map_x + map_width and Y >= map_y and Y <= map_y + map_height)
		{
			// Draw Edges
			for (var z = 0; z < array_length(currSolar.edges); z++)
			{
				// Check if current edge is not -1
				if (currSolar.edges[z] != -1)
				{
					// Get Target Solar System
					var tar = global.galaxy[currSolar.edges[z]];
					
					// Get Position
					var eX = tar.x_pos + map_half_w;
					var eY = tar.y_pos + map_half_h;
			
					// Check whether target edge is in drawing space
					if (eX >= map_x and eX <= map_x + map_width and eY >= map_y and eY <= map_y + map_height)
					{
						// Draw Line
						draw_set_color(c_white);
						draw_set_alpha(1);
						draw_line(X, Y, eX, eY);
					}
				}
			}
	
			// Draw Circle
			if (i != Galaxy.current_solar_system)
			{
				draw_set_color(c_aqua);
			}
			else
			{
				draw_set_color(c_red);
			}			
			draw_set_alpha(1);
			draw_circle(X, Y, 20, false);
	
			// Draw Text
			DrawSetText(c_white, fMenu, fa_middle, fa_center);
			draw_text(X, Y, string(I));
		}
	}
}