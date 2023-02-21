// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function generate_solar_system(target_room)
{
	// CONSTANTS
	var center_x = room_width / 2;
	var center_y = room_height / 2;
	var NUM_OF_RINGS = 10;
	var MAX_PLANETS = 5;
	var RING_DISTANCE = 2000;
	
	// VARIABLES
	var planetsCreated = 0;
	var createPlanet = false;
	var planetToAdd = noone;
	
	// Create Sun
	room_instance_add(target_room, center_x, center_y, oSun);
	
	// Create Planets
	for (var i = 1; i <= NUM_OF_RINGS; i++)
	{
		// Get either true or false
		createPlanet = bool(irandom(1));
		
		// If true, then create a planet
		if ((createPlanet == true) and (planetsCreated < MAX_PLANETS))
		{
			// Randomize position and planet type
			var rand_angle = random(360);
			var x_dest = dcos(rand_angle) * RING_DISTANCE * i;
			var y_dest = dsin(rand_angle) * RING_DISTANCE * i;
			var planetRandomizer = irandom(1);
			
			// Get a planet type based on the random value
			switch(planetRandomizer)
			{
				case 0:
					planetToAdd = oMars;
					break;
				case 1:
					planetToAdd = oBluePlanet;
					break;
				default:
					show_message("generate_solar_system: invalid planet type");
			}
		
			// Create the planet
			room_instance_add(target_room, center_x + x_dest, center_y + y_dest, planetToAdd);
			planetsCreated++;
			
			// Enemy spawners on planets?
			room_instance_add(target_room, center_x + x_dest, center_y + y_dest, oEnemySpawner);
		}
	}
}