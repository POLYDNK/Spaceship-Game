/// @desc Draws a Health Bar Relative to the Object Position
function DrawHealthBar() {

	// Update Health Bar Position
	healthbarX = x - (healthbarWidth/2);
	healthbarY = y - 50;
	
	// Draw Health Bar
	draw_sprite(sHealthBack, 0, healthbarX, healthbarY);
	draw_sprite_stretched(sHealthHPRed, 0, healthbarX, healthbarY, min((hp/hpMax) * healthbarWidth, healthbarWidth), healthbarHeight);
	draw_sprite(sHealthBorder, 0, healthbarX, healthbarY);
}
