/// @desc Dialogue Testing

// Check if player is over planet
cObj = collision_circle(x,y,sprite_width/2, oPlayer, false, true);

// Set dialogue based on whether a player is found
if (cObj != noone)
{
	// If the player wasn't colliding on the last step, then
	// open the dialoue box up
	if (playerCollision == false)
	{
		displayDialogue(planetName, "Hello World!");
	}
	
	playerCollision = true;
}
else
{
	// If the play was colliding on the last step, then
	// close the dialogue box
	if (playerCollision == true)
	{
		closeDialogue();
	}
	
	playerCollision = false;
}