/// @desc Draw Health Bar

healthbarColor = make_color_rgb((255 / hpMax) * (hpMax-hp), (255 / hpMax) * hp, 0)

// Flashing Health Bar Logic
if (hp/hpMax < 0.25)
{
	currentFrame++;
	
	if (currentFrame > maxFrames)
	{
		currentFrame = 0;
	}
}
else
{
	currentFrame = 0;
}

	
// Draw Health Bar
draw_sprite(sHealthBack, 0, healthbarX, healthbarY);
draw_sprite_stretched_ext(sHealthHP,
	                          currentFrame,
							  healthbarX,
							  healthbarY,
							  min((hp/hpMax) * healthbarWidth, healthbarWidth),
							  healthbarHeight,
							  healthbarColor,
							  1);
draw_rectangle_color(healthbarX, healthbarY, 
                     healthbarX+healthbarWidth, healthbarY+healthbarHeight,
					 healthbarColor,healthbarColor,healthbarColor,healthbarColor,
					 true);

DrawSetText(c_white,fSign,fa_center,fa_middle);
draw_set_font(fHealth);
draw_text(healthbarX+(healthbarWidth/2),healthbarY+(healthbarHeight/2),string(hp) + " / " + string(hpMax));