/// @desc Flash When Hit and Draw Health Bars

draw_self();

// Draw HP Bar
if (drawHealth)
{
	DrawHealthBar(healthbarColor); // Requires Variables
}

// Flash When Hit
if (flash > 0 ) && (destructable == true)
{	
	flash--;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}
