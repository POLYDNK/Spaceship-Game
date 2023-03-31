/// @desc Flash When Hit and Draw Health Bars

image_blend = shipColor;

// Flash When Hit
if (flash > 0 ) && (destructable == true)
{	
	flash--;
	shader_set(shWhite);
}

// Draw ship
draw_self();

// Damage layers
if (hp/hpMax < 0.15)
{
	draw_sprite_ext(sprite_index, 3, x, y, image_xscale, image_yscale, image_angle, shipColor, 0.6);
}
else if (hp/hpMax < 0.3)
{
	draw_sprite_ext(sprite_index, 2, x, y, image_xscale, image_yscale, image_angle, shipColor, 0.5);
}
else if (hp/hpMax < 0.6)
{
	draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, shipColor, 0.4);	
}

shader_reset();

// Draw HP Bar
if (drawHealth)
{
	// Draw Health Bar
	var healthbarX = x - (52/2);
	var healthbarY = y - 50;
	DrawHealthBar(healthbarColor, healthbarX, healthbarY, hp, hpMax); // Requires Variables
	
	// Draw Shield Bar
	if (shieldHPMax > 0)
	{
		var healthbarY = y - 56;
		DrawHealthBar(shieldHPColor, healthbarX, healthbarY, shieldHP, shieldHPMax); // Requires Variables
	}
}