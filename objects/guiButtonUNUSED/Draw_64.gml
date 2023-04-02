/// @desc Draw self and text

if (!hidden)
{
	if (hover)
	{
		sprite_index = spriteHover;
	}
	else
	{
		sprite_index = spriteDefault;
	}

	draw_self();

	// Draw text
	DrawSetText(c_white, fMenu, fa_center, fa_middle);
	draw_text(x + sprite_width/2, y - sprite_height/2, text);
}