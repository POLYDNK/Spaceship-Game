///@desc IsInCamera(x,y) Based on the existance of the "oCamera" object, determine whether a coordinate is in camera
///@arg x - x value to test
///@arg y - y value to test
///@ret bool - Whether the object is in camera

function IsInCamera(argument0, argument1)
{
	inCamera = false;
	
	if (instance_exists(oCamera))
	{
		var camX = camera_get_view_x(oCamera.cam);
		var camY = camera_get_view_y(oCamera.cam);
		var camW = camera_get_view_width(oCamera.cam);
		var camH = camera_get_view_height(oCamera.cam);
		
		if (x > camX and x < camX+camW)
		{
			if (y > camY and y < camY+camH)
			{
				inCamera = true;
			}
		}
	}
	
	return inCamera;
}