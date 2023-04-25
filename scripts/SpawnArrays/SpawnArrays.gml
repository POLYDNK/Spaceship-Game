// Enemy Ship Spawning
global.enemy_ship_spawn = new SpawnArray(new Spawn(oEnemyGrassCombat, 20));
global.enemy_ship_spawn.AddSpawn(new Spawn(oEnemyAquaFreight, 20));
global.enemy_ship_spawn.AddSpawn(new Spawn(oEnemyCombatShip, 80));

// Asteroid Spawning
global.asteroid_spawn = new SpawnArray(new Spawn(asteroid_large, 10));
global.asteroid_spawn.AddSpawn(new Spawn(asteroid_medium, 50));
global.asteroid_spawn.AddSpawn(new Spawn(asteroid_small, 100));

// Enemy Ship Loot
global.enemy_ship_loot = new SpawnArray(new Spawn(oIron, 20));
global.enemy_ship_loot.AddSpawn(new Spawn(oLaserMachinePickup, 30));
global.enemy_ship_loot.AddSpawn(new Spawn(oLaserCannonPickup, 15));
global.enemy_ship_loot.AddSpawn(new Spawn(oAquaCannonPickup, 15));
global.enemy_ship_loot.AddSpawn(new Spawn(oCrescentGunPickup, 25));
global.enemy_ship_loot.AddSpawn(new Spawn(oMediumBubblePickup, 30));
global.enemy_ship_loot.AddSpawn(new Spawn(oMediumEnginePickup, 30));
global.enemy_ship_loot.AddSpawn(new Spawn(oSmallDrillPickup, 30));

/// @desc SpawnArray() Creates a new spawn array
/// @arg firstSpawn - the first object that can be spawned
function SpawnArray(firstSpawn) constructor
{
	// Create the ds map for objects
	spawns[0] = firstSpawn;
	
	/// @desc AddSpawn(spawn) Adds a spawn to the spawn array
	/// @arg spawn - the spawn to be added
	function AddSpawn(spawn)
	{
		array_push(spawns, spawn);
	}
	
	/// @desc AddSpawn(spawn) Adds a spawn to the spawn array
	/// @ret object - the randomly selected object
	function GetRandomObject()
	{
		// Vars
		var objectIndexChosen = 0; // array index of the spawn to be returned
		var totalWeight = 0;       // total weight of all spawns
		
		// Calculate the weight of all spawns
		for (var i = 0; i < array_length(spawns); i++)
		{
			totalWeight += spawns[i].spawnWeight;
		}
		
		// Generate a random value up to the total weight
		var rand = random_range(0, totalWeight);
		var currentWeight = 0;
		
		// If the random number lands within the added weight
		// of the current spawn, then save the index of it
		for (var i = 0; i < array_length(spawns); i++)
		{
			currentWeight += spawns[i].spawnWeight;
			
			if (rand < currentWeight)
			{
				objectIndexChosen = i;
				break;
			}
		}
		
		// Return random object
		return spawns[objectIndexChosen].object;
	}
}

/// @desc Spawn() Creates an entry to a spawn table
/// @arg object - object to be inserted
/// @arg spawnWeight - the weight value which influences how likely it is to spawn
function Spawn(object, spawnWeight) constructor
{
	self.object = object;
	self.spawnWeight = spawnWeight;
}