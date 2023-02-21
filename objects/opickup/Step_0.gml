/// @desc Floating

// Floating
Y += FLOAT_SPEED;
y = ystart + (sin(Y) * FLOAT_HEIGHT);

// Spinning
if (spinning)
{
	image_angle -= 1;
}
