/// @desc Move in parralax w/ camera


if (instance_exists(oCamera))
{
	x = oCamera.x / 1.10 + xstart;
	y = oCamera.y / 1.10 + ystart;
}

