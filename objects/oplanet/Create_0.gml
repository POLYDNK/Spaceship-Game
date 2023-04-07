/// @desc Vars, Contact Popup Creation

layer_assigned = false;
playerCollision = false

// My dialogue popup
var dist = point_distance(0, 0, sprite_width/4, sprite_width/4);
myPopup = instance_create_layer(x, y, layer_get_id("GUI"), oDialoguePopup);
myPopup.xOffset = dist;
myPopup.yOffset = -dist;
myPopup.text = "Contact";
myPopup.speaker = self;

// My dialogue object
dialogue = new DialogueScript(dialogueArray, planetName);
