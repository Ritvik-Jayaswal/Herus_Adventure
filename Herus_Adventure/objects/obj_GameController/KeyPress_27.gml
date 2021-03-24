/// @description Return to main menu
// You can write your code in this editor

global.gamestate = GAME_STATE.mainmenu;
alarm[0] = -1;
if(room != Menu){
	room_goto(Menu);
}