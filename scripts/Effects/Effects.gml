/// @desc ApplyScreenshake(speed, magnitude, duration)
/// @arg speed - Shake speed in updates per second
/// @arg magnitude - Shake magnitude in pixels
/// @arg duration - Shake duration in updates
function ApplyScreenshake(argument0, argument1, argument2)
{
    // Find the oEffectController instance in the room
    var effectController = instance_find(oEffectController, 0);

    // Check if the oEffectController instance exists
    if (effectController != noone)
    {
        // Set the shakeSpeed, shakeMagnitude, and shakeDuration variables in the oEffectController instance
        effectController.shakeSpeed = argument0;
        effectController.shakeMagnitude = argument1;
        effectController.shakeDuration = argument2;
    }
    else
    {
        show_error("ApplyScreenshake: oEffectController instance not found!", true);
    }
}

/// @desc ApplyLinearBlur(blurVector)
/// @arg blurVector - X and Y blur vector
function ApplyLinearBlur(blurVector)
{
	// Get linear blur layer
	linearLayer = layer_get_fx("LinearBlur");
	
	if (linearLayer == -1)
	{
		show_error("ApplyLinearBlur: 'LinearBlur' layer not found!", true);
	}

	fx_set_parameter(linearLayer, "g_LinearBlurVector", blurVector);
}
