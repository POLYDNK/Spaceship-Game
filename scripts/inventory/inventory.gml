// Player Inventory

// Create Player Inventory Here
global.playerInventory = new Inventory(18);

// Resources
global.playerInventory.iron = 0;

// Define Item Types
enum ITEM
{
	BLANK,
	IRON,
	LASERMACHINE,
	LASERCANNON,
	SMALLDRILL,
	SMALLENGINE,
	MEDIUMENGINE,
	SMALLBUBBLE,
	MEDIUMBUBBLE
};

enum TYPE
{
	MATERIAL,
	WEAPON,
	ENGINE,
	ACTIVE,
	OTHER
}

enum SIZE
{
	SMALL,
	MEDIUM,
	LARGE
}

/// @desc Inventory(slots) Creates a new empty player inventory
/// @arg slots - number of inventory slots
function Inventory(slots) constructor
{
	inventory = array_create(slots, new Item());
	inventory_size = slots;
	num_of_modules = 0;
	
	/// @desc add_item(item_id) Add an item to player inventory
	/// @arg item_id - the type, or, id of item to add
	function add_item(item_id)
	{
		switch(item_id)
		{
			case ITEM.BLANK:
				inventory[find_blank_slot()] = new Item();
				break;
				
			case ITEM.IRON:
				//inventory[find_blank_slot()] = new Item("Iron", sIron, ITEM.IRON, oIron, oIron, TYPE.MATERIAL);
				iron++;
				break;
				
			case ITEM.LASERMACHINE:
				inventory[find_blank_slot()] = new Item("Laser Machine Gun", sLaserMachine1, ITEM.LASERMACHINE, oLaserMachinePickup, oLaserMachine1, TYPE.WEAPON);
				break;
				
			case ITEM.LASERCANNON:
				inventory[find_blank_slot()] = new Item("Laser Cannon", sLaserCannon, ITEM.LASERCANNON, oLaserCannonPickup, oLaserCannon, TYPE.WEAPON);
				break;
				
			case ITEM.SMALLDRILL:
				inventory[find_blank_slot()] = new Item("Small Drill", sSmallDrill, ITEM.SMALLDRILL, oSmallDrillPickup, oSmallDrill, TYPE.WEAPON);
				break;
				
			case ITEM.SMALLENGINE:
				inventory[find_blank_slot()] = new Item("Small Engine", sSmallEngine, ITEM.SMALLENGINE, oSmallEnginePickup, oSmallEngine, TYPE.ENGINE);
				break;
				
			case ITEM.MEDIUMENGINE:
				inventory[find_blank_slot()] = new Item("Medium Engine", sMediumEngine, ITEM.MEDIUMENGINE, oMediumEnginePickup, oMediumEngine, TYPE.ENGINE);
				break;
				
			case ITEM.SMALLBUBBLE:
				inventory[find_blank_slot()] = new Item("Small Bubble", sSmallBubble, ITEM.SMALLBUBBLE, oSmallBubblePickup, oSmallBubble, TYPE.ACTIVE);
				break;
				
			case ITEM.MEDIUMBUBBLE:
				inventory[find_blank_slot()] = new Item("Medium Bubble", sMediumBubble, ITEM.MEDIUMBUBBLE, oMediumBubblePickup, oMediumBubble, TYPE.ACTIVE);
				break;
				
			default:
				break;
		}
	}
	
	/// @desc replace_module(item_id, index) Add a module to player inventory at a specified index
	/// @arg item_id - the type, or, id of module to add
	/// @arg index   - the inventory index to add item to
	function replace_module(item_id, index)
	{
		// Create Item
		switch(item_id)
		{
			case ITEM.LASERMACHINE:
				delete inventory[index];
				inventory[index] = new Item("Laser Machine Gun", sLaserMachine1, ITEM.LASERMACHINE, oLaserMachinePickup, oLaserMachine1, TYPE.WEAPON);
				break;
				
			case ITEM.LASERCANNON:
				delete inventory[index];
				inventory[index] = new Item("Laser Cannon", sLaserCannon, ITEM.LASERCANNON, oLaserCannonPickup, oLaserCannon, TYPE.WEAPON);
				break;
				
			case ITEM.SMALLDRILL:
				delete inventory[index];
				inventory[index] = new Item("Small Drill", sSmallDrill, ITEM.SMALLDRILL, oSmallDrillPickup, oSmallDrill, TYPE.WEAPON);
				break;
				
			case ITEM.SMALLENGINE:
				delete inventory[index];
				inventory[index] = new Item("Small Engine", sSmallEngine, ITEM.SMALLENGINE, oSmallEnginePickup, oSmallEngine, TYPE.ENGINE);
				break;
				
			case ITEM.MEDIUMENGINE:
				delete inventory[index];
				inventory[index] = new Item("Medium Engine", sMediumEngine, ITEM.MEDIUMENGINE, oMediumEnginePickup, oMediumEngine, TYPE.ENGINE);
				break;
				
			case ITEM.SMALLBUBBLE:
				delete inventory[index];
				inventory[index] = new Item("Small Bubble", sSmallBubble, ITEM.SMALLBUBBLE, oSmallBubblePickup, oSmallBubble, TYPE.ACTIVE);
				break;
				
			case ITEM.MEDIUMBUBBLE:
				delete inventory[index];
				inventory[index] = new Item("Medium Bubble", sMediumBubble, ITEM.MEDIUMBUBBLE, oMediumBubblePickup, oMediumBubble, TYPE.ACTIVE);
				break;
				
			default:
				break;
		}
		
		// Spawn Item
		module_spawn(index);
	}
	
	/// @desc find_blank_slot() Get the index of the first blank item, returns -1 if it can't be found
	function find_blank_slot()
	{
		var index = -1; // inventory index to return
		
		// If a blank item is found, then break and return the index of it
		for (var i = 0; i < inventory_size; i++)
		{
			if (inventory[i]._id == ITEM.BLANK)
			{
				index = i;
				break;
			}
		}
		
		return index; // If a blank item cannot be found, then return -1
	}
	
	/// @desc swap_item(source_index, dest_index) Swaps two items by using two valid indices
	/// @arg source_index - index of 1st item
	/// @arg dest_index - index of 2nd item
	function swap_item(source_index, dest_index)
	{
		// Do not permit swapping in a module of a different type (unless it's blank)
		// or an incompatible type
		if (dest_index >= inventory_size)
		{
			if (modules[dest_index-inventory_size]._type != inventory[source_index]._type)
			{
				if (inventory[source_index]._id != ITEM.BLANK)
				{
					return;
				}
			}
		}
		else if (source_index >= inventory_size)
		{
			if (modules[source_index-inventory_size]._type != inventory[dest_index]._type)
			{
				if (inventory[dest_index]._id != ITEM.BLANK)
				{
					return;
				}
			}
		}
		
		// Perform swap for all inventory and module items
		if (source_index < inventory_size+num_of_modules and dest_index < inventory_size+num_of_modules)
		{
			var temp = inventory[source_index];
			inventory[source_index] = inventory[dest_index];
			inventory[dest_index] = temp;		
			delete temp;
		}
		
		// If Module -> Module, then adjust the offsets
		if (source_index >= inventory_size and dest_index >= inventory_size)
		{
			if (instance_exists(inventory[dest_index]._instance))
			{
				inventory[dest_index]._instance.xOffset = modules[dest_index-inventory_size].x_pos;
				inventory[dest_index]._instance.yOffset = modules[dest_index-inventory_size].y_pos;
			}
			
			if (instance_exists(inventory[source_index]._instance))
			{
				inventory[source_index]._instance.xOffset = modules[source_index-inventory_size].x_pos;
				inventory[source_index]._instance.yOffset = modules[source_index-inventory_size].y_pos;
			}
		}
		// If Inventory -> Module, then equip it onto the player ship
		else if (source_index < inventory_size and dest_index >= inventory_size)
		{
			module_spawn(dest_index);
		}
		// If Module -> Inventory, then unequip it from the player ship
		else if (source_index >= inventory_size and dest_index < inventory_size)
		{
			module_remove(dest_index);
		}
	}
	
	/// @desc drop_item(index, xPos, yPos) Drops an item from inventory to a specified position
	/// @arg index - index of item to drop in inventory
	/// @arg xPos - target X position of item to drop
	/// @arg yPos - target Y position of item to drop
	function drop_item(index, xPos, yPos)
	{
		if (inventory[index]._id != ITEM.BLANK)
		{
			// Create item at position
			with (instance_create_layer(xPos, yPos, "Items", inventory[index]._drop_object))
			{
				sleeping = true;
				alarm_set(0, 120);
				
				if (global.pause == true)
				{
					instance_deactivate_object(self);
				}
			}
			
			// If the item is a module -> make sure to delete it to avoid duping
			if (index >= inventory_size)
			{
				module_remove(index);
			}
			
			// Remove item from inventory (by replacing it w/ a blank item)
			inventory[index] = new Item();
		}
	}
	
	/// @desc add_ship_module(xOffset, yOffset, item_type) Add a ship module slot to player ship
	/// @arg xOffset - x offset on ship
	/// @arg yOffset - y offset on ship
	/// @arg item_type - The type of item this module can hold
	function add_ship_module_slot(xOffset, yOffset, item_type, item_size = SIZE.SMALL)
	{
		// Save index to return
		var module_index = inventory_size+num_of_modules;
		
		// Create an empty item in inventory as well as
		// a new empty module slot
		inventory[module_index] = new Item();
		modules[num_of_modules] = new Module(xOffset, yOffset, item_type, item_size);
		num_of_modules++;
		
		// Return invetory index
		return module_index;
	}
	
	/// @desc module_spawn(index) Spawn a ship module for the player ship
	/// @arg index - index of item to spawn
	function module_spawn(index)
	{
		var playerObj = instance_find(oPlayer, 0);
		
		if (playerObj != noone and inventory[index]._id != ITEM.BLANK)
		{
			// Set properties
			inventory[index]._instance = instance_create_depth(playerObj.x,playerObj.y,layer_get_depth("Modules"), inventory[index]._object);
			inventory[index]._instance.xOffset = modules[index-inventory_size].x_pos;
			inventory[index]._instance.yOffset = modules[index-inventory_size].y_pos;
			inventory[index]._instance.wielder = playerObj;
					
			switch (inventory[index]._type)
			{
				case TYPE.WEAPON:
					// Can't fire if paused
					if (global.pause)
					{
						inventory[index]._instance.canShoot = false;
					}
					break;
					
				case TYPE.ENGINE:
					break;
					
				default:
					break;
			}
		}
	}
	
	/// @desc respawn_module() Respawns all of the player's modules into the game world
	function respawn_modules()
	{
		for (var i = 0; i < num_of_modules; i++)
		{
			if (instance_exists(inventory[inventory_size+i]._instance) == false)
			{
				module_spawn(inventory_size+i);
			}
		}
	}
	
	/// @desc module_spawn(index) Remove a ship module from the player ship
	/// @arg index - index of item to remove
	function module_remove(index)
	{
		instance_destroy(inventory[index]._instance);
		inventory[index]._instance = noone;
	}
	
	/// @desc module_activate_all_type(item_type) Activates all modules of a particular type
	/// @arg item_type - Type of module to activate
	function module_activate_all_type(item_type)
	{
		for (var i = 0; i < num_of_modules; i++)
		{
			var type = inventory[inventory_size+i]._type;
			
			if (type == item_type)
			{
				switch (type)
				{
					case TYPE.ACTIVE:
						if (instance_exists(inventory[inventory_size+i]._object))
						{
							inventory[inventory_size+i]._object.active = true;
						}
						break;
					
					case TYPE.WEAPON:
						if (instance_exists(inventory[inventory_size+i]._object))
						{
							inventory[inventory_size+i]._object.firing = true;
						}
						break;
					
					default:
						break;
				}
			}
		}
	}
	
	/// @desc module_deactivate_all_type(item_type) Deactivates all modules of a particular type
	/// @arg item_type - Type of module to deactivate
	function module_deactivate_all_type(item_type)
	{
		for (var i = 0; i < num_of_modules; i++)
		{
			var type = inventory[inventory_size+i]._type;
			
			switch (type)
			{
				case TYPE.WEAPON:
					if (instance_exists(inventory[inventory_size+i]._object))
					{
						inventory[inventory_size+i]._object.firing = false;
					}
				default:
					break;
			}
		}
	}
	
	/// @desc get_engine_power() returns combined engine power for all engines
	function get_engine_power()
	{
		var eng_power = 0;
		
		for (var i = 0; i < num_of_modules; i++)
		{
			var type = inventory[inventory_size+i]._type;
			
			switch (type)
			{
				case TYPE.ENGINE:
					if (instance_exists(inventory[inventory_size+i]._object))
					{
						eng_power += inventory[inventory_size+i]._object.enginePower;
					}
				default:
					break;
			}
		}
		
		return eng_power;
	}
}

/// @desc Item() Creates a new item
function Item(item_name = "DEFAULT_NAME", item_sprite = sBlank, item_id = ITEM.BLANK, item_drop_object = noone, item_object = noone, item_type = TYPE.OTHER) constructor
{
	_name = item_name;
	_sprite = item_sprite;
	_id = item_id;
	_drop_object = item_drop_object;
	_object = item_object;
	_type = item_type;
	_instance = noone;
}

/// @desc Module() Creates a new module
function Module(x_position = 0, y_position = 0, item_type = TYPE.OTHER, item_size = SIZE.SMALL) constructor
{
    x_pos = x_position; // X offset or position on ship
    y_pos = y_position; // Y offset or position on ship
	_type = item_type;  // The type of item this module can hold
	_size = item_size;  // The size of item this module can hold
}


