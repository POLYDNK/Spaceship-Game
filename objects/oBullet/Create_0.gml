/// @desc Create trail, declare vars

damage = 5;

vsp = 0; // Vertical Speed
hsp = 0; // Horizontal Speed

myTrail = instance_create_layer(x, y, layer, pTrail);
myTrail.color = trailColor;
