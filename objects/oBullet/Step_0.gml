/// @desc Update trail, decrease lifespan, move bullet

// Update Trail Pos
myTrail.x = x;
myTrail.y = y;

// Decrease Lifespan
lifespan--;

if (lifespan <= 0)
{
	instance_destroy();
}	

// Move Bullet
x += hsp;
y += vsp;
