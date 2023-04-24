/// @desc Game Setup

// Start the game unpaused
prevPause = false;              // previous pause
global.pause = false;           // global pause

// Macros
#macro RES_W		2560
#macro RES_H		1440

// Audio
audio_falloff_set_model(audio_falloff_linear_distance);
audio_listener_set_orientation(0, 1, 0, 0, 0, 1, 0);

// AI States
enum AI
{
	IDLE,
	STOP,
	CHASE,
	RETREAT,
	LOOK,
	STRAFE
}

// TEAMS
enum TEAM
{
	FRIENDLY,
	ENEMY,
	NEUTRAL
}

// Directions
enum DIRECTION
{
	LEFT,
	RIGHT,
	FORWARD,
	BACKWARD,
	LEFTFORWARD,
	RIGHTFORWARD
}

// Menu Tabs
enum TABS
{
	CRAFTING,
	INVENTORY,
	SHIP_CONFIG,
	SOLAR_SYSTEM_MAP
};

global.current_tab = TABS.SOLAR_SYSTEM_MAP;

// Game Init
SetResolution(RES_W, RES_H);
display_set_gui_size(RES_W, RES_H);
window_set_fullscreen(true);

// Get Pause Layer

