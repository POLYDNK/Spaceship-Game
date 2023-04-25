/// @description Zoom out

var newWidth  = camera_get_view_width(cam)*1.2;
var newHeight = camera_get_view_height(cam)*1.2;

if (newWidth < cameraMaxWidth)
{
	camera_set_view_size(cam, newWidth, newHeight);

	view_w_half = newWidth / 2;
	view_h_half = newHeight / 2;
}
