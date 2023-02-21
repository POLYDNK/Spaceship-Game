/// @desc SetLayerAlpha(layerName, alpha) Sets the alpha value of a specified layer
/// @arg layerName - the name of the layer
/// @arg alpha - alpha value to set the background layer to

function SetLayerAlpha(layerName, alpha){
	// Get background id
	var backgroundLayer = layer_get_id(layerName);
	var backgroundID = layer_background_get_id(backgroundLayer);

	// Set alpha value
	layer_background_alpha(backgroundID, alpha);
}
