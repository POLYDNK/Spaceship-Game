/// @desc Setup

// Get a references to effect layers
shakeLayer = layer_get_fx("ScreenShake");

// Check if the effect layers exist
if (shakeLayer == -1)
{
    show_error("oEffectController: 'ScreenShake' layer not found!", true);
}
