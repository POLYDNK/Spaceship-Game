//Set Up Camera

//SetResolution(RES_W, RES_H);

// Create camera
view_camera[0] = camera_create_view(0, 0, RES_W, RES_H);
cam = view_camera[0]
camera_set_view_size(cam, 3456, 1944);
camera_set_view_border(cam, 32, 32);
camera_set_view_speed(cam, -1, -1);


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
//zoomSlider = instance_create_layer(544,704,"GUI",guiSlider);

// Minimap
miniMap = instance_create_layer(view_w_half, 64, "GUI", oMinimap);

