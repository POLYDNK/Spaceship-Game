/// @desc Draw Button

// Determine Draw Color
var dColor = c_white;

if (holding)
{
	dColor = holdingColor;
}
else if (mouseInBounds)
{
	dColor = hoverColor;
}

// Draw Sprites

// Outline drawing (needless shader complexity)
if (holding or mouseInBounds)
{
	shader_set(shColor);
	colorArray = [color_get_red(dColor) / 255.0,
				  color_get_green(dColor) / 255.0,
				  color_get_blue(dColor) / 255.0];
	shader_colors = shader_get_uniform(shColor, "v_rgbColor");
	shader_set_uniform_f_array(shader_colors, colorArray);
	draw_sprite_stretched(sBlankButton, 0, xPos-10, yPos-10, width+20, height+20);
	shader_reset();
}

// Draw Button
draw_sprite_stretched(sBlankButton, 0, xPos, yPos, width, height);

// Draw Text
DrawSetText(dColor, fMenu, fa_center, fa_middle);
draw_text(xPos + width/2, yPos + height/2, text);
