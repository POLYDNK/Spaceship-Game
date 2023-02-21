/// @desc Flash When Hit and Draw Health Bars

draw_self();

// Draw HP Bar
if (drawHealth)
{
	draw_healthbar(x-30, y-30, x+30, y-50, hp/hpMax, 
	drawHealthBackColor, drawHealthMinColor, 
	drawHealthMaxColor, 0, true, true);
}

// Flash When Hit
if (flash > 0 ) && (destructable == true)
{	
	flash--;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}
