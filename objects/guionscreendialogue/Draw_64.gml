/// @desc Draw window + dialogue if open

if (open)
{
	// Calculate Position
	winX = x
	winY = y-sprite_height;

	// Draw Header
	draw_sprite_stretched_ext(sFadeBoxOrange, 0, winX, winY-header_height, sprite_width, header_height, c_white, 1.0);
	
	// Draw Body
	draw_sprite_stretched_ext(sFadeBox, 0, winX, winY, sprite_width, sprite_height, c_white, 0.7);

	// Draw Text
	var textX = winX+(sprite_width/2);
	
	draw_set_alpha(1);
	draw_set_color(c_orange);
	DrawSetText(c_white, fMenu, fa_middle, fa_top);
	draw_text(textX, winY-header_height, speaker);
	draw_text_ext(textX, winY+text_margin, body, 5, box_width-text_margin);
}