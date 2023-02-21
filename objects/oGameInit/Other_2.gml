/// @desc Game Setup

// Macros
#macro RES_W		1920
#macro RES_H		1080

// Global Variables
global.particleSystem = part_system_create(); // Create particle system

SetResolution(RES_W, RES_H);
display_set_gui_size(RES_W, RES_H);