/// @desc Flash When Hit and Draw Health Bars

image_blend = shipColor;

// Drawing self
shader_set(shDarken);
draw_self();
shader_reset();

// Damage layers
draw_sprite_ext(sprite_index, 3, x, y, image_xscale, image_yscale, image_angle, shipColor, 1.0);
draw_sprite_ext(sprite_index, 2, x, y, image_xscale, image_yscale, image_angle, shipColor, 1.0);
draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, image_angle, shipColor, 1.0);	
