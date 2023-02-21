/// @desc Update Trail Region and Color

part_type_color1(myParticle, color);
part_emitter_region(global.particleSystem, myEmitter, x-5, x+5, y-5, y+5, ps_shape_ellipse, ps_distr_gaussian);
