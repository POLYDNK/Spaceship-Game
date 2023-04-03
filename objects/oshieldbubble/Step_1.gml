/// @desc Check if shield is broken

if (hp <= 0) && (destructable == true)
{
	wielder.destructable = true;
	audio_stop_sound(shieldSound);
	destructable = false;
	alarm_set(0, 100);
}
else if (!destructable)
{
	image_xscale += 0.01;
	image_yscale += 0.01;
	image_alpha -= 0.01;
}
