/// @description Zoom in

var newWidth  = camera_get_view_width(cam)*0.8;
var newHeight = camera_get_view_height(cam)*0.8;

if (newHeight > cameraMinWidth)
{
	camera_set_view_size(cam, newWidth, newHeight);

	view_w_half = camera_get_view_width(cam) / 2;
	view_h_half = camera_get_view_height(cam) / 2;
}
