// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function StartGame(){
	instance_activate_object(oPlayer);
	room_goto(global.galaxy[global.current_solar_system].my_room);
}

function ExitGame(){
	game_end();
}