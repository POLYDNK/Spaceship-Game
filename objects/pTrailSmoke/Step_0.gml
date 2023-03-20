/// @desc Update Trail Region and Spawn Amount

if (instance_exists(wielder))
{
	var X = wielder.x;
	var Y = wielder.y;

	part_emitter_region(global.particleSystem,
						myEmitter,
						X-8, X+8, Y-1, Y+13,
						ps_shape_rectangle,
						ps_distr_linear);
						
	part_emitter_stream(global.particleSystem, myEmitter, myParticle, amount);
}
else
{
	part_emitter_stream(global.particleSystem, myEmitter, myParticle, 0);
	alarm_set(0, 180);
}