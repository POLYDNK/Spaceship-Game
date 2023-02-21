/// @desc Update Trail Region and Direction

if (active)
{
	// enable
	part_emitter_stream(mySystem, myEmitter, myParticle, amount);

	// Stay with Wielder 
	var ang = point_direction(0, 0, xOffset, yOffset) + wielder.image_angle;
	var dist = point_distance(0, 0, xOffset, yOffset);
							  
	x = wielder.x + lengthdir_x(dist, ang);
	y = wielder.y + lengthdir_y(dist, ang);

	// Adjust Particle Properties
	part_type_orientation(myParticle, 180, 180, 0, 0, true);
	part_type_direction(myParticle, wielder.image_angle+180, wielder.image_angle+180, 0, 0);
	part_emitter_region(mySystem, myEmitter, x, x, y, y, ps_shape_rectangle, ps_distr_linear);
	part_type_scale(myParticle, xScale, yScale);
	if (customSprite != noone)
	{
		part_type_sprite(myParticle, customSprite, true, true, false);
	}
}
else
{
	// disable
	part_emitter_stream(mySystem, myEmitter, myParticle, 0);
}
