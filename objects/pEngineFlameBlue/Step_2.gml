/// @desc Update Trail Region and Direction

if (active)
{
	// enable
	part_emitter_stream(mySystem, flameEmitter, flame, 5);
	part_emitter_stream(mySystem, sparkEmitter, spark, 5);
	part_emitter_stream(mySystem, smokeEmitter, smoke, 5);

	// Stay with Wielder 
	var ang = point_direction(0, 0, xOffset, yOffset) + wielder.image_angle;
	var dist = point_distance(0, 0, xOffset, yOffset);
							  
	x = wielder.x + lengthdir_x(dist, ang);
	y = wielder.y + lengthdir_y(dist, ang);

	// Adjust Particle Properties
	part_type_direction(flame, wielder.image_angle+190, wielder.image_angle+170, 0, 15);
	part_type_direction(spark, wielder.image_angle+180, wielder.image_angle+180, 0, 0);
	part_type_direction(smoke, wielder.image_angle+160, wielder.image_angle+200, 0, 0);
	
	part_type_orientation(flame, wielder.image_angle, wielder.image_angle, 0, 0, false);
	part_type_orientation(spark, wielder.image_angle+90, wielder.image_angle+90, 0, 0, false);
	part_type_orientation(smoke, wielder.image_angle+90, wielder.image_angle+90, 0, 0, false);
	
	part_emitter_region(mySystem, flameEmitter, x-16, x+16, y-4, y+4, ps_shape_rectangle, ps_distr_linear);
	part_emitter_region(mySystem, sparkEmitter, x-16, x+16, y-4, y+4, ps_shape_rectangle, ps_distr_linear);
	part_emitter_region(mySystem, smokeEmitter, x-16, x+16, y-4, y+4, ps_shape_rectangle, ps_distr_linear);
}
else
{
	// disable
	part_emitter_stream(mySystem, flameEmitter, flame, 0);
	part_emitter_stream(mySystem, sparkEmitter, spark, 0);
	part_emitter_stream(mySystem, smokeEmitter, smoke, 0);
}
