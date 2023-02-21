/// @desc Change background alpha depending whether player is in or out of the zone

if (instance_exists((oPlayer)))
{
	// Check if player is within zone
	if (point_distance(x, y, oPlayer.x, oPlayer.y) <= zoneSize)
	{		
		inZone = true;
		
		// Increase zone layer alpha when in zone
		if (zoneAlpha + transitionSpeed <= 1)
		{
			zoneAlpha += transitionSpeed;
			SetLayerAlpha("ZoneBackground", zoneAlpha);
		}
		
		// Decrease default layer alpha when in zone
		if (defaultAlpha - transitionSpeed >= 0)
		{
			defaultAlpha -= transitionSpeed;
			SetLayerAlpha("DefaultBackground", defaultAlpha);
		}
	}
	else
	{
		inZone = false;
		
		// Decrease zone layer alpha when out of zone
		if (zoneAlpha - transitionSpeed >= 0)
		{
			zoneAlpha -= transitionSpeed;
			SetLayerAlpha("ZoneBackground", zoneAlpha);
		}
		
		// Increase default layer alpha when out of zone
		if (defaultAlpha + transitionSpeed <= 1)
		{
			defaultAlpha += transitionSpeed;
			SetLayerAlpha("DefaultBackground", defaultAlpha);
		}
	}
}
