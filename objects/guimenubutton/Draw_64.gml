/// @desc Draw Button

DrawSetText(c_white, fMenu, fa_center, fa_middle);
draw_set_alpha(1);

draw_sprite_stretched(sButton, 0, xPos, yPos, width, height);

if (selected == false)
{
	draw_rectangle_color(xPos, yPos, xPos+width, yPos+height, c_white, c_white, c_white, c_white, true);
}
else
{
	draw_rectangle_color(xPos, yPos, xPos+width, yPos+height, c_orange, c_orange, c_orange, c_orange, true);
}

draw_text(xPos + width/2, yPos + height/2, text);
