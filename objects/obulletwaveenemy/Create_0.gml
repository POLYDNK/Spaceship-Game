/// @desc Create Trail

vsp = 0; // Vertical Speed
hsp = 0; // Horizontal Speed

myTrail = instance_create_layer(x, y, layer, pTrail);
myTrail.color = trailColor;

waveCounter = 0; // for wave effect