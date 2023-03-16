/// @desc Positioning

if (instance_exists(speaker))
{
	// Stay with Sepaker				  
	x = speaker.x + xOffset;
	y = speaker.y + yOffset;
}
else
{
	instance_destroy(); // Destroy self if speaker no longer exists
}