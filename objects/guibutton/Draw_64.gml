/// @desc Draw Button

draw_sprite_stretched(sButton, 0, xPos, yPos, width, height);

if (holding == false)
{
	draw_rectangle_color(xPos, yPos, xPos+width, yPos+height, c_white, c_white, c_white, c_white, true);
}
else
{
	draw_rectangle_color(xPos, yPos, xPos+width, yPos+height, c_orange, c_orange, c_orange, c_orange, true);
}

DrawSetText(c_white, fMenu, fa_center, fa_middle);
draw_text(xPos + width/2, yPos + height/2, text);
