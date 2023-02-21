/// @desc Randomize size

// Inherit the parent event
event_inherited();

var size = random_range(1.5, 3);

image_xscale = size;
image_yscale = size;

mass = size * 1000;
hpMax = size * 10;
hp = hpMax;