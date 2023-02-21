/// @description Draw Self

if (isSetup == true)
{
	draw_self();
	
	if (chargeAnimation)
	{
		var chargePercent = 1;
		
		if (firingdelay > 0)
		{
			chargePercent = (firerate - firingdelay) / firerate;
		}
		
		image_index = floor(chargedEndFrame * chargePercent);
	}
}
