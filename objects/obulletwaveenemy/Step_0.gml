/// @desc Detect Collisions

// Update Trail Pos
myTrail.x = x;
myTrail.y = y;

// Decrease Lifespan
lifespan--;

if (lifespan <= 0)
{
	instance_destroy();
}	

// Move Bullet in a wave
waveCounter += waveFrequency;
moveDir = point_direction(x,y,x+hsp,y+vsp);
var orthAng = 90 + moveDir;
var waveAmp = waveAmplitude * dcos(waveCounter);
var offsetX = hsp + lengthdir_x(waveAmp, orthAng);
var offsetY = vsp + lengthdir_y(waveAmp, orthAng);

x += offsetX;
y += offsetY;

image_angle = point_direction(x,y,x+offsetX,y+offsetY);
