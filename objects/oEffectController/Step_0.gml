///@desc Apply effects

// Screen Shake
if (shakeDuration > 0)
{
    // Decrease the shake duration
    shakeDuration -= 1;
    
    // Decrease the shake magnitude over time
    shakeMagnitude = max(0, shakeMagnitude - (shakeMagnitude / shakeDuration));
    
    // Update the effect layer's speed and magnitude
    fx_set_parameter(shakeLayer, "g_Magnitude", shakeMagnitude);
    fx_set_parameter(shakeLayer, "g_ShakeSpeed", shakeSpeed);
}
else
{
    // Reset the shake magnitude
    shakeMagnitude = 0;
}
