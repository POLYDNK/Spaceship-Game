/// -------------------------------------------------------------
/// Scripts used to draw gameplay menus (only use in draw events)
/// -------------------------------------------------------------

/// @desc DrawSolarMap() draw solar system map
/// @arg xPos - x position to draw
/// @arg yPos - y position to draw
/// @arg map_width - width of draw space
/// @arg map_height - height of draw space
/// @arg map_x - x position of map
/// @arg map_y - y position of map
function DrawSolarMap(xPos, yPos, map_width, map_height, map_x, map_y)
{
    // Vars
    var map_half_w = map_width / 2;
    var map_half_h = map_height / 2;
    var current_solar = global.galaxy[global.current_solar_system];
    
    // Draw Current Solar System Text
    var edges_count = array_length(current_solar.edges);
    
    DrawSetText(c_white, fMenu, fa_left, fa_top);
    draw_text(xPos + 5, yPos + 5, "Current System: " + string(global.current_solar_system));
    draw_text(xPos + 5, yPos + 40, "Number of Gates: " + string(ds_map_size(global.gate_map)));
    draw_text(xPos + 5, yPos + 75, "Edges: " + string(edges_count));

    // Draw Solar Systems
    for (var i = 0; i < array_length(global.galaxy); i++)
    {
        var currSolar = global.galaxy[i];                      // current solar system
        var X = map_half_w + (currSolar.x_pos - map_x) + xPos; // calculate x pos
        var Y = map_half_h + (currSolar.y_pos - map_y) + yPos; // calculate y pos
        var I = currSolar.index;                               // get index
        
        // Check whether the current solar system is within the drawing space
        if (X >= xPos and X <= map_width and Y >= yPos and Y <= map_height)
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
                    var eX = map_half_w + (tar.x_pos - map_x) + xPos;
                    var eY = map_half_h + (tar.y_pos - map_y) + yPos;
            
                    // Check whether target edge is in drawing space
                    if (eX >= xPos and eX <= map_width and eY >= yPos and eY <= map_height)
                    {
                        // Draw Line
                        draw_set_color(c_white);
                        draw_set_alpha(1);
                        draw_line(X, Y, eX, eY);
                    }
                }
            }
    
            // Draw Circle
            if (i == global.current_solar_system)
            {
				draw_set_color(c_red);
            }
			else if (currSolar.visited)
			{
				draw_set_color(c_yellow);
			}
            else
            {
                draw_set_color(c_aqua);
            }            
            draw_set_alpha(1);
            draw_circle(X, Y, 20, false);
    
            // Draw Text
            DrawSetText(c_white, fMenu, fa_middle, fa_center);
            draw_text(X, Y, string(I));
        }
   }
}
