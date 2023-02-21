/// @description Insert description here
// You can write your code in this editor

// Rotate Towards Player
if (instance_exists(oPlayer))
{
	targetAngle = point_direction(x,y,oPlayer.x,oPlayer.y);
	RotateTowards(targetAngle, 2);
}


x += hsp;
y += vsp;
