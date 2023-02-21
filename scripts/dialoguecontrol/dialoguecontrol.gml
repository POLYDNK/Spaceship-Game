// Functions to Control Dialogue

/// @desc displayDialogue(speaker, body) Displays dialogue on the screen
/// @arg speaker - name of the speaker speaking (string)
/// @arg body    - what the speaker is saying (string)
function displayDialogue(argument0 = "", argument1 = "")
{
	dialogueObj = instance_find(guiOnScreenDialogue, 0);
	
	// Ensure obj is found
	if (dialogueObj == noone)
	{
		show_message("Error: dialogue object can not be found!");
		return;
	}
	
	// Display the dialogue
	dialogueObj.speaker = argument0;
	dialogueObj.body = argument1;
	dialogueObj.open = true;
}

/// @desc closeDialogue() Closes the dialogue box on screen
function closeDialogue()
{
	dialogueObj = instance_find(guiOnScreenDialogue, 0);
	
	// Ensure obj is found
	if (dialogueObj == noone)
	{
		show_message("Error: dialogue object can not be found!");
		return;
	}
	
	// Close Dialogue Box
	dialogueObj.open = false;
}