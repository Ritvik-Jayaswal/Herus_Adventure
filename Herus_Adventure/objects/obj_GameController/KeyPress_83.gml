/// @description View Highscores while at main menu
// You can write your code in this editor

if(global.gamestate == GAME_STATE.mainmenu){
	global.gamestate = GAME_STATE.savehighscore;
}
