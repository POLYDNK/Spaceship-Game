/// @desc Vars, Contact Popup Creation

layer_assigned = false;
playerCollision = false

// My dialogue popup
var dist = point_distance(0, 0, sprite_width/4, sprite_width/4);

dialogue = instance_create_layer(x, y, layer_get_id("GUI"), oDialoguePopup);
dialogue.xOffset = dist;
dialogue.yOffset = -dist;
dialogue.text = "Contact";
dialogue.speaker = self;
//dialogue.action = toggleDialogue(planetName, "Hello World!");