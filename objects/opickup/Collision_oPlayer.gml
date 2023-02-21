/// @desc Send to player inventory on collision

// Check if inventory is full first
if (global.playerInventory.find_blank_slot() != -1 and sleeping == false)
{
	global.playerInventory.add_item(item_type);
	instance_destroy();
}

