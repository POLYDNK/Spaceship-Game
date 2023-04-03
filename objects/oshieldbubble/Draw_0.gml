/// @desc Draw self with shader

// Get color depending on ratio of current shield hp to maximum shield hp
var shieldHPRatio = hp / hpMax;
var newColor = merge_color(shieldHPColorDepleted, shieldHPColor, shieldHPRatio);

// Apply a shield shader with the new color baked in
shader_set(shShield);
colorArray = [color_get_red(newColor) / 255.0,
			  color_get_green(newColor) / 255.0,
			  color_get_blue(newColor) / 255.0,
			  0.5]; // alpha
shader_colors = shader_get_uniform(shShield, "v_shieldColor");
shader_set_uniform_f_array(shader_colors, colorArray);
draw_self();
shader_reset();