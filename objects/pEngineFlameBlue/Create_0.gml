/// @desc Create Particle Emmitter

// Define Particle System
mySystem = part_system_create();
part_system_depth(mySystem, 500);

// Define Particles
flame = part_type_create();
part_type_shape(flame, pt_shape_line);
part_type_scale(flame, 0.1, 0.05);
part_type_size(flame, 1, 1, -0.01, 0);
part_type_speed(flame, 3, 2, 0, 0);
part_type_alpha3(flame, 0.78, 0.78, 0.78);
part_type_color3(flame,
                 make_color_rgb(244, 251, 255),
				 make_color_rgb(0, 238, 255),
				 make_color_rgb(0, 25, 255));
part_type_life(flame, 20, 40);
part_type_direction(flame, -10, 10, 0, 15);

// ------------

spark = part_type_create();
part_type_sprite(spark, sPlasmaBeam, false, false, false);
part_type_scale(spark, -0.5, 1);
part_type_size(spark, 1, 1, 0, 0);
part_type_speed(spark, 3, 2, 0, 5);
part_type_alpha3(spark, 1, 1, 0);
part_type_color3(spark,
                 make_color_rgb(244, 251, 255),
				 make_color_rgb(0, 238, 255),
				 make_color_rgb(0, 25, 255));
part_type_life(spark, 20, 40);
part_type_direction(spark, 0, 0, 0, 0);

// ------------

smoke = part_type_create();
part_type_sprite(smoke, sPlasmaBeam, false, false, false);
part_type_scale(smoke, 1, 1);
part_type_size(smoke, 0.2, 0.2, 0.01, 0);
part_type_speed(smoke, 1.5, 1.5, 0, 0);
part_type_alpha3(smoke, 0.19, 0.11, 0);
part_type_color3(smoke,
                 make_color_rgb(0, 0, 0),
				 make_color_rgb(0, 51, 114),
				 make_color_rgb(35, 97, 255));
part_type_life(smoke, 40, 90);
part_type_direction(smoke, -20, -20, 0, 0);

// Define Emitters
flameEmitter = part_emitter_create(mySystem);
sparkEmitter = part_emitter_create(mySystem);
smokeEmitter = part_emitter_create(mySystem);
part_emitter_region(mySystem, flameEmitter, x-16, x+16, y-4, y+4, ps_shape_rectangle, ps_distr_linear);
part_emitter_region(mySystem, sparkEmitter, x-16, x+16, y-4, y+4, ps_shape_rectangle, ps_distr_linear);
part_emitter_region(mySystem, smokeEmitter, x-16, x+16, y-4, y+4, ps_shape_rectangle, ps_distr_linear);
part_emitter_stream(mySystem, flameEmitter, flame, 5);
part_emitter_stream(mySystem, sparkEmitter, spark, 5);
part_emitter_stream(mySystem, smokeEmitter, smoke, 5);

