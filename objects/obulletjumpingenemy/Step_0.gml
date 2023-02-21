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

// Move Bullet
waveCounter += waveFrequency;
x += hsp + (waveAmplitude * dcos(waveCounter));
y += vsp - (waveAmplitude * dsin(waveCounter));

// Randomize Sound of Hit
hit_pitch = random_range(1.5, 2)

// Detect Collisions
if (place_meeting(x,y,collidesWith))
{
	// Do this to the colliding object
	with (instance_place(x,y,collidesWith))
	{
		if (destructable)
		{
			hp -= other.damage;
			flash = 3;
			hitfrom = other.direction;
		}
	}
	
	// Do this every collision
	var snBulletImact = choose(snHitSolid1, snHitSolid2, snHitSolid3);
	
	audio_sound_pitch(snBulletImact, hit_pitch);
	audio_play_sound(snBulletImact, 0, 0);
	
	with (instance_create_layer(x, y, layer, pSparkBurst))
	{
		minDirection = other.direction - 25;
		maxDirection = other.direction + 25;
		sprite = other.particleSprite;
	}
	
	with (instance_create_layer(x, y, "Text", oDisplayDamage))
	{
		damageToDisplay = other.damage;
		
		#region Set Damage Text Display and Color
		if (damageToDisplay > 1000)
		{
			damageColor = c_maroon;
			damageFont = fDamage18;
		}
		else if (damageToDisplay > 100)
		{
			damageColor = c_red;
			damageFont = fDamage16;
		}
		else if (damageToDisplay > 10)
		{
			damageColor = c_orange;
			damageFont = fDamage14;
		}
		else if (damageToDisplay > 1)
		{
			damageColor = c_yellow;
			damageFont = fDamage12;
		}
		#endregion
	}
	
	instance_destroy();
}
