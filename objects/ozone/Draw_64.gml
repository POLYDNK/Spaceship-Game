/// @desc Debug Text

DrawSetText(c_white, fMenu, fa_center, fa_top);

if (inZone)
{
	draw_text(camera_get_view_width(view_camera[0]) / 2, 50, "In Zone: TRUE");
}
else
{
	draw_text(camera_get_view_width(view_camera[0]) / 2, 50, "In Zone: FALSE");
}
