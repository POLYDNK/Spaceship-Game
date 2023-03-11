/// @desc Damage Self

// Get Variables From Field
pSprite = other.particleSprite;
dmg     = other.damage;
angle   = other.direction;
xx      = other.bbox_right;
yy      = other.y + lengthdir_y(other.sprite_width, other.image_angle);

// Randomize Sound of Hit
hit_pitch = random_range(1.5, 2)

// Damage and Flash Self
if (destructable)
{
	hp -= other.damage;
	flash = 3;
	hitfrom = other.direction;
}
	
// Do this every collision
var snBulletImact = choose(snHitSolid1, snHitSolid2, snHitSolid3);
	
audio_sound_pitch(snBulletImact, hit_pitch);
audio_play_sound(snBulletImact, 0, 0);
	
with (instance_create_layer(xx, yy, layer, pSparkBurst))
{
	minDirection = other.angle - 90;
	maxDirection = other.angle + 90;
	sprite = other.pSprite;
	amount = 32;
}
	
// Display Damage
with (instance_create_layer(x, y, "Text", oDisplayDamage))
{
	damageToDisplay = other.dmg;
		
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

