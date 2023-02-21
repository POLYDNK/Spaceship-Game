/// @description Insert description here
// You can write your code in this editor

var enemyDirection = point_direction(x,y,other.x,other.y);

hsp = lengthdir_x(hsp*(other.weight/weight), enemyDirection) * -1;
vsp = lengthdir_y(hsp*(other.weight/weight), enemyDirection) * -1;

