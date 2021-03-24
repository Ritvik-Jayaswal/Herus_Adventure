/// @description Change Game State
// You can write your code in this editor

global.gamestate = GAME_STATE.blank;
audio_stop_all();
audio_play_sound(snd_mainMusic,1,true);

room_goto(Menu);