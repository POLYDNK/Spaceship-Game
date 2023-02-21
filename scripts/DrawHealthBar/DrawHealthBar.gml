/// @desc DrawHealthBar(color) Draws a Health Bar Relative to the Object Position
/// @arg color - color of the health bar

function DrawHealthBar(argument0) {
	
	var healthbarWidth = 52;
	var healthbarHeight = 6;

	// Update Health Bar Position
	var healthbarX = x - (healthbarWidth/2);
	var healthbarY = y - 50;
	
	// Draw Health Bar
	draw_sprite(sHealthBack, 0, healthbarX, healthbarY);
	draw_sprite_stretched_ext(sHealthHP,
							  0,
							  healthbarX,
							  healthbarY,
							  min((hp/hpMax) * healthbarWidth, healthbarWidth),
							  healthbarHeight,
							  argument0,
							  1);
	draw_sprite(sHealthBorder, 0, healthbarX, healthbarY);
}
