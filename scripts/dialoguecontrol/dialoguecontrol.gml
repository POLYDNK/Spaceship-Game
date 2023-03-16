// Functions to Control Dialogue
global.dialogueOpen = false;

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
	global.dialogueOpen = true;
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

/// @desc displayDialogue(speaker, body) Toggles dialogue on the screen
/// @arg speaker - name of the speaker speaking (string)
/// @arg body    - what the speaker is saying (string)
function toggleDialogue(argument0 = "", argument1 = "")
{
	if (global.dialogueOpen == false)
	{
		displayDialogue(argument0, argument1);
		global.dialogueOpen = true;
	}
	else
	{
		closeDialogue();
		global.dialogueOpen = false;
	}
}

/// @desc isDialogueOpen() Check if dialogue box is open
/// @ret bool - whether the dialogue box is open
function isDialogueOpen()
{
	return global.dialogueOpen;
}