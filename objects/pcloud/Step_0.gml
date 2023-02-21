/// @desc Update Trail Region and Color

part_type_color1(myParticle, color);
part_emitter_region(global.particleSystem, myEmitter, x-radius, x+radius, y-radius, y+radius, ps_shape_ellipse, ps_distr_gaussian);
