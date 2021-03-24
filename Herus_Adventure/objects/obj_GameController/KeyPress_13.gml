/// @description Start Game / Return to menu
// You can write your code in this editor
if(global.gamestate == GAME_STATE.mainmenu){
	global.gamestate = GAME_STATE.playing;
	
	//Reset Heru Variables if he exists
	if(instance_exists(obj_Heru)){
		obj_Heru.level = 1;
		obj_Heru.hp = 100;
		score = 0;
		obj_Heru.state = PLAYER_STATE.walking;
		obj_Heru.atBoss = false;
		obj_Heru.canShoot = true;
		global.gameover = false;
	}
	room_goto_next();
}

