/// @desc Flash When Hit and Draw Health Bars

draw_self();

// Draw HP Bar
if (drawHealth)
{
	// Draw Health Bar
	var healthbarX = x - (52/2);
	var healthbarY = y - 50;
	DrawHealthBar(healthbarColor, healthbarX, healthbarY, hp, hpMax); // Requires Variables
}

// Flash When Hit
if (flash > 0 ) && (destructable == true)
{	
	flash--;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}
