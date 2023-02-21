/// @desc Collision based on speed and mass of objects

hsp = (2 * other.mass * other.hsp + hsp(mass - other.mass)) / (mass + other.mass);
vsp = (2 * other.mass * other.vsp + vsp(mass - other.mass)) / (mass + other.mass);
