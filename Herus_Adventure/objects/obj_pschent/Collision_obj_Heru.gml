/// @description Change Game State
// You can write your code in this editor

global.gamestate = GAME_STATE.win;
audio_stop_all();
audio_play_sound(snd_mainMusic,1,true);
with(obj_Heru){
	x = -2000;
	y = -2000;
}
room_goto(Menu);