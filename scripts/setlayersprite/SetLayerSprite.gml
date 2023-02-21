/// @desc SetLayerSprite(layerName, sprite) Sets the sprite of a specified layer
/// @arg layerName - the name of the layer
/// @arg sprite - sprite to set the background layer to

function SetLayerSprite(layerName, sprite){
	// Get background id
	var backgroundLayer = layer_get_id(layerName);
	var backgroundID = layer_background_get_id(backgroundLayer);

	// Set background sprite if it's a different sprite
	if (layer_background_get_sprite(backgroundID) != sprite)
	{
		layer_background_alpha(backgroundID, 1);
	    layer_background_sprite(backgroundID, sprite);
	}
}
