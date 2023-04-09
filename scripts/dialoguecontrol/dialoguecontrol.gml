// Functions to Control Dialogue
global.dialogueOpen = false;

/// @desc DialogueScript(_textArray) Constructs a script object
/// @arg _textArray - A text array that contains each line of a script
function DialogueScript(_textArray) constructor
{
    // Initialize the text array and current line
    text = _textArray;
    current_line = 0;
	
	/// @desc get_current_line(filtered) Method to get the current line of dialogue
	/// @arg filtered - whether parts, such as the speaker, are filtered out of the array
	function get_current_line(filtered = true)
	{
	    var line = "";
    
	    // If the current line isn't an empty string, then return it
	    if (current_line < array_length(text))
	    {
	        line = text[current_line];
        
	        // Filter out speaker
	        if (filtered)
	        {
	            _lineParts = string_split(line, ": ");
            
	            if (array_length(_lineParts) > 1)
	            {
	                line = _lineParts[1];
	            }
	        }
	    }
    
	    return line; // Else, return it as empty
	};

    // Method to get the next line of dialogue
    function get_next_line()
	{
		var line_string = "";
		var next_line = current_line + 1; 
		
		// If the next line isn't an empty string, then return it
        if (next_line < array_length(text))
		{
            line_string = text[next_line];
        }
		
		// Go to the next line when this is called
		current_line++;
		
        return line_string; // Else, return it as empty
    };
	
	// Method to get the speaker's name
    function get_speaker()
	{
		var _lineParts = string_split(get_current_line(false), ":");
        return _lineParts[0];
    };

    // Method to reset the dialogue script
    function reset()
	{
        current_line = 0;
    };
}

/// @desc displayDialogue(script) Displays dialogue on the screen
/// @arg script - reference to dialogue script object
function displayDialogue(argument0)
{
	dialogueObj = instance_find(guiOnScreenDialogue, 0);
	
	// Ensure obj is found
	if (dialogueObj == noone)
	{
		show_message("Error: dialogue object can not be found!");
		return;
	}
	
	// Display the dialogue
	dialogueObj.dialogue_script = argument0;
	dialogueObj.open = true;
	dialogueObj.interactTimer = dialogueObj.interactWait;
	
	// Set flags
	global.dialogueOpen = true;
	global.pause = true;
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
	
	// Set flags
	global.dialogueOpen = false;
	global.pause = false
}

/// @desc displayDialogue(speaker, body) Toggles dialogue on the screen
/// @arg script - reference to dialogue script object
function toggleDialogue(argument0)
{
	if (global.dialogueOpen == false)
	{
		displayDialogue(argument0);
		
	}
	else
	{
		closeDialogue();
	}
}

/// @desc isDialogueOpen() Check if dialogue box is open
/// @ret bool - whether the dialogue box is open
function isDialogueOpen()
{
	return global.dialogueOpen;
}