/// @desc Draw self and text

if (!hidden)
{
	if (hover)
	{
		sprite_index = sDialogueDark;
	}
	else
	{
		sprite_index = sDialogueLight;
	}

	draw_self();

	// Draw text
	DrawSetText(c_yellow, fMenu, fa_center, fa_middle);
	draw_text(x + sprite_width/2, y - sprite_height/2 - 50, text);
	show_debug_message()
}