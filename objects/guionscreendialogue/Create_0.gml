/// @desc Initialize vars

dialogue_script = new DialogueScript(global.test_message, "No One");

bodyString = "";
bodyCharCount = 1;
characterTimer = characterWait;
endOfLine = false;

// Spam clicking prevention
interactTimer = interactWait;
