/// @desc Spawn Enemies on Timer

// Logic for spawning on creation of not
if (justCreated)
{
	// If spawning on create, then set timer
	// to 0 to spawn right away
	if (spawnOnCreate)
	{
		spawnTimer = 0;
	}
	// If not spawning on create, then set the timer
	// to spawn interval
	else
	{
		spawnTimer = spawnInterval;
	}
	
	// Prevent this block from being entered after this
	justCreated = false;
}

// If currently spawning enemies
if (spawning and instance_exists(oPlayer))
{
	spawnTimer--;
	
	// If the spawn timer has gone down to 0
	if (spawnTimer <= 0 and distance_to_object(oPlayer) > safeDistance)
	{
		// Spawn an enemy
		repeat(spawnCount)
		{
			var xOff = random_range(-spawnArea/2, spawnArea/2);
			var yOff = random_range(-spawnArea/2, spawnArea/2);
			instance_create_layer(x+xOff,y+yOff,spawnLayer,objectToSpawn.GetRandomObject());
		}
		
		// Reset the spawn timer
		spawnTimer = spawnInterval;
	}
}