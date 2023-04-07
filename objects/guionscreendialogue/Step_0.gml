/// @desc Check for interation

if (open and interactTimer <= 0)
{
	if (mouse_check_button_pressed(mb_left) or keyboard_check_pressed(vk_space))
	{
		// Check if end of script
	    if (dialogue_script.get_next_line() == "")
		{
	        // End the dialogue
	        open = false;
			closeDialogue();
	    }
		
		// Spam clicking prevention timer
		interactable = false;
		alarm_set(0, interactWait);
	}
}

interactTimer--;
