/// @desc Create Particle Emmitter

// Define Particle
myParticle = part_type_create();
part_type_life(myParticle, 3, 5);
part_type_sprite(myParticle, sprite, true, true, false);
part_type_scale(myParticle, choose(1, -1), choose(1, -1));
part_type_color1(myParticle, color);
part_type_blend(myParticle, false);
part_type_speed(myParticle, 0.5, 1, -0.1, 0);

// Define Emitter
myEmitter = part_emitter_create(global.particleSystem);
part_emitter_region(global.particleSystem, myEmitter, x-5, x+5, y-5, y+5, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_stream(global.particleSystem, myEmitter, myParticle, amount);
