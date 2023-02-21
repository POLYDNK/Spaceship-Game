/// @desc Draw menu if open

if (menu_open)
{
	// Draw Inner Rectangle
	draw_set_color(make_color_rgb(160, 160, 160));
	draw_set_alpha(1);
	draw_rectangle(margin_x, margin_y, full_x, full_y, false);
		
	// Draw Outer Rectangle
	draw_set_color(c_navy);
	draw_set_alpha(0.5);
	draw_rectangle(margin_x, margin_y, full_x, full_y, true);
	
	// Draw Current Tab
	DrawSetText(c_white, fMenu, fa_left, fa_top);
	draw_text(margin_x, full_y + 20, "Current Tab: " + string(current_tab));
}

