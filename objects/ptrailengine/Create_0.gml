/// @desc Create Particle Emmitter

// Define Particle System
mySystem = part_system_create();
part_system_depth(mySystem, 500);

// Define Particle
myParticle = part_type_create();
part_type_shape(myParticle, pt_shape_square);
part_type_size(myParticle, 0.1, 0.5, 0, 0);
part_type_speed(myParticle, 26, 30, 0, 0);
part_type_alpha3(myParticle, 1, 0.5, 0);
part_type_color3(myParticle,
                 make_color_rgb(128, 255, 0),
				 make_color_rgb(0, 255, 0),
				 make_color_rgb(0, 64, 0));
part_type_life(myParticle, partLife, partLife);

// Define Emitter
myEmitter = part_emitter_create(mySystem);
part_emitter_region(mySystem, myEmitter, x, x, y+5, y-5, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(mySystem, myEmitter, myParticle, amount);
