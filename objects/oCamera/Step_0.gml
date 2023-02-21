//---- Update Camera ----

// Update Destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
}

// Update Camera Position
x += (xTo - x) / 5;
y += (yTo - y) / 5;

// Keep camera inside room
//x = clamp(x, view_w_half, room_width - view_w_half);
//y = clamp(y, view_h_half, room_height - view_h_half);

// Screen Shake
x+= random_range(-shake_remain, shake_remain);
y+= random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));

// Update Camera View
camera_set_view_pos(cam, x-view_w_half, y-view_h_half);

// Parallax Backgrounds
if (layer_exists("StarsFar"))
{
	layer_x("StarsFar", x / 1.1);
	layer_y("StarsFar", y / 1.1);
}

if (layer_exists("StarsMed"))
{
	layer_x("StarsMed", x / 1.3);
	layer_y("StarsMed", y / 1.3);
}

// Zooming
var newWidth  = camera_get_view_width(cam)  + zoomSlider.sliderValue;
var newHeight = camera_get_view_height(cam) + zoomSlider.sliderValue;

if (camera_get_view_width(cam) != newWidth)
{
	camera_set_view_size(cam, newWidth, newHeight);

	view_w_half = newWidth / 2;
	view_h_half = newHeight / 2;
}