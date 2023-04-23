/// @desc Menu Control

// Menu toggle
if (keyboard_check_pressed(ord("F")))
{
	menu_open = !menu_open;
}

// Activation/Deactivation of menu objects
if (menu_open and global.dialogueOpen == false)
{
	// Pause While Viewing
	global.pause = true;
	
	// Activate Buttons
	instance_activate_object(crafting_menu_button);
	instance_activate_object(inventory_menu_button);
	instance_activate_object(ship_menu_button);
	instance_activate_object(solar_menu_button);
	
	// Menu Activation/Deactivation
	switch (current_tab)
	{
		case TABS.CRAFTING:
			instance_deactivate_object(solar_menu);
			instance_deactivate_object(inventory_menu);
			crafting_menu_button.selected = true;
			inventory_menu_button.selected = false;
			ship_menu_button.selected = false;
			solar_menu_button.selected = false;
			break;
		case TABS.INVENTORY:
			instance_activate_object(inventory_menu);
			instance_deactivate_object(solar_menu);
			crafting_menu_button.selected = false;
			inventory_menu_button.selected = true;
			ship_menu_button.selected = false;
			solar_menu_button.selected = false;
			break;
		case TABS.SHIP_CONFIG:
			instance_deactivate_object(solar_menu);
			instance_deactivate_object(inventory_menu);
			crafting_menu_button.selected = false;
			inventory_menu_button.selected = false;
			ship_menu_button.selected = true;
			solar_menu_button.selected = false;
			break;
		case TABS.SOLAR_SYSTEM_MAP:
			instance_activate_object(solar_menu);
			event_perform_object(solar_menu, ev_user0, 0);
			instance_deactivate_object(inventory_menu);
			crafting_menu_button.selected = false;
			inventory_menu_button.selected = false;
			ship_menu_button.selected = false;
			solar_menu_button.selected = true;
			break;
		default:
			break;
	}
}
else
{
	// Deactivate menu objects
	instance_deactivate_object(solar_menu);
	instance_deactivate_object(inventory_menu);
	
	// Deactivate buttons
	instance_deactivate_object(crafting_menu_button);
	instance_deactivate_object(inventory_menu_button);
	instance_deactivate_object(ship_menu_button);
	instance_deactivate_object(solar_menu_button);
	
	global.pause = false;
}

