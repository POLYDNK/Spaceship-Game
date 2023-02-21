/// @desc Create Particle Emmitter

// Define Particle
myParticle = part_type_create();
part_type_shape(myParticle, pt_shape_cloud);
part_type_life(myParticle, 30, 200);
part_type_size(myParticle, 2, 2, 0.10, 0.01);
part_type_scale(myParticle, choose(1, -1), choose(1, -1));
part_type_color1(myParticle, color);
part_type_orientation(myParticle, 0, 360, 0, 0, 0);
part_type_blend(myParticle, false);
part_type_speed(myParticle, 0.5, 1, -0.1, 0);

// Define Emitter
myEmitter = part_emitter_create(global.particleSystem);
part_emitter_region(global.particleSystem, myEmitter, x-radius, x+radius, y-radius, y+radius, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_stream(global.particleSystem, myEmitter, myParticle, amount);
