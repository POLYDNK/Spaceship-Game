/// @desc Create Particle Emmitter

// Define Particle
myParticle = part_type_create();
part_type_life(myParticle, 80, 180);
part_type_shape(myParticle, pt_shape_smoke);
part_type_scale(myParticle, choose(1, -1), choose(1, -1));
part_type_color3(myParticle, color, color2, color3);
part_type_alpha3(myParticle, 0.16, 0.15, 0.0);
part_type_blend(myParticle, false);
part_type_size(myParticle, 0.2, 0.2, 0.01, 0);
part_type_speed(myParticle, 1, 1, 0, 0);
part_type_direction(myParticle, 80, 100, 0, 0);
part_type_orientation(myParticle, 0, 360, choose(-1, 1), 0, false);

// Define Emitter
myEmitter = part_emitter_create(global.particleSystem);
part_emitter_region(global.particleSystem, myEmitter, x-8, x+8, y-1, y+13, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(global.particleSystem, myEmitter, myParticle, amount);
