/// @desc Handle Pausing

if (global.pause == false)
{
	if (prevPause == true)
	{
		// Make pause layer visible
		var pauseLayer = layer_background_get_id("Pause");
		layer_background_alpha(pauseLayer, 0);
		
		// Special activation for ships
		for (var i = 0; i < instance_number(oShip); ++i;)
		{
		    currObj = instance_find(oShip,i);
			currObj.hascontrol = true;
		}
		
		// Special activation for guns
		for (var i = 0; i < instance_number(oGun); ++i;)
		{
		    currObj = instance_find(oGun,i);
			currObj.canShoot = true;
		}
		
		instance_activate_object(oWarpGate);	
		instance_activate_object(oBullet);
		instance_activate_object(oPickup);
		instance_activate_object(oFloatingObject);
		
		prevPause = false;
	}
}
else
{
	if (prevPause == false)
	{
		// Make pause layer invisible
		var pauseLayer = layer_background_get_id("Pause");
		layer_background_alpha(pauseLayer, 0.75);
		
		// Special deactivation for ships
		for (var i = 0; i < instance_number(oShip); ++i;)
		{
		    currObj = instance_find(oShip,i);
			currObj.hascontrol = false;
		}
		
		// Special deactivation for guns
		for (var i = 0; i < instance_number(oGun); ++i;)
		{
		    currObj = instance_find(oGun,i);
			currObj.canShoot = false;
		}
		
		instance_deactivate_object(oWarpGate);
		instance_deactivate_object(oBullet);
		instance_deactivate_object(oPickup);
		instance_deactivate_object(oFloatingObject);
		
		prevPause = true;
	}
}
