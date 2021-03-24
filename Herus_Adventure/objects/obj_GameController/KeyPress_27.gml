/// @description Return to main menu
// You can write your code in this editor

global.gamestate = GAME_STATE.mainmenu;
alarm[0] = -1;
newRank = -1;
curInt = 1;
initials = "_";
if(room != Menu){
	audio_stop_all();
	audio_play_sound(snd_mainMusic,1,true);
	room_goto(Menu);
}