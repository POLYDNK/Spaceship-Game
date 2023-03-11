//Set Up Camera

//SetResolution(RES_W, RES_H);

// Get camera
cam = view_camera[0]

if (cam == -1)
{
	cam = camera_create_view(0, 0, RES_W, RES_H);
}

// Variable declarations
follow = followAlive;
view_w_half = camera_get_view_width(cam) / 2;
view_h_half = camera_get_view_height(cam) / 2;
xTo = xstart;
yTo = ystart;

//Declare Screenshake Variables
shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;

// Zoom Slider
zoomSlider = instance_create_layer(544,704,"GUI",guiSlider);
