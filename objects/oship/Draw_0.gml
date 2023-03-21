/// @desc Flash When Hit and Draw Health Bars

image_blend = shipColor;

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


// Flash When Hit
if (flash > 0 ) && (destructable == true)
{	
	flash--;
	shader_set(shWhite);
	draw_self();
	shader_reset();
}
else
{
	var damageShader = shader_get_sampler_index(shDamage, "DamageTexture");
	texture_set_stage(damageShader, sprite_get_texture(sDamageTexture, 0));
	shader_set(shDamage);
	draw_self();
	shader_reset();
}
