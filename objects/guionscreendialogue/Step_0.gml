/// @desc Check for interaction, string update

// Only perform logic when open
if (!open)
{
    return;
}

// Update timers
characterTimer--;
interactTimer--;

// Get current line of dialogue
var curLine = dialogue_script.get_current_line();

#region String update
if (characterTimer <= 0)
{
    // Add another character if able
    if (bodyCharCount <= string_length(curLine))
	{
        // Update the displayed string
        bodyString = string_copy(curLine, 1, bodyCharCount);
        bodyCharCount++;
    }
	else
	{
        endOfLine = true;
    }

    // Reset character timer
    characterTimer = characterWait;
}
#endregion

#region Interaction checking
if (interactTimer <= 0)
{
    if ((mouse_check_button_pressed(mb_left) or keyboard_check_pressed(vk_space)))
	{
		// If clicking before end of line, then go to end of line
		if (endOfLine == false)
		{
			bodyCharCount = string_length(curLine);
			bodyString = string_copy(curLine, 1, bodyCharCount);
			endOfLine = true;
		}
		// Else, perform normal click interaction
        else
		{
			var nextLine = dialogue_script.get_next_line();
			
	        // Check if end of script
	        if (nextLine == "")
			{
	            // End the dialogue
	            open = false;
	            closeDialogue();
	        }
			else
			{
	            // Spam clicking prevention timer
	            interactTimer = interactWait;
	            interactable = false;

	            // Reset character display logic
	            bodyString = "";
	            bodyCharCount = 0;
	            characterTimer = characterWait;
	            endOfLine = false;
	        }
		}
    }
}
#endregion
