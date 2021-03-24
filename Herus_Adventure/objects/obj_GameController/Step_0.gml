/// @description 
// You can write your code in this editor

if(global.gamestate == GAME_STATE.mainmenu){
	if(alarm[0] == -1){
		alarm[0] = 45;
	}
}

if(global.gamestate == GAME_STATE.blank){
	newRank = -1;
	curInt = 1;
	initials = "_";
	//Determine Highscore or not
	for(i = 0; i < 5; i++){
		if(score > global.scoreArray[i]){
			newRank = i;
			global.gamestate = GAME_STATE.newhighscore;
			break;
		}
	}		
	
	if(global.gamestate != GAME_STATE.newhighscore){
		global.gamestate = GAME_STATE.savehighscore;
	}
}


if(global.gamestate == GAME_STATE.newhighscore){
	//Get initials
	key = scr_getKey()
		
	if(key != "1"){
		if(key == "2" && curInt == 4){
			global.gamestate = GAME_STATE.savehighscore;
			alarm[0] = -1;
		}else if(curInt != 4 && key != "4"){
			initials = string_insert(key, initials, curInt);
			if(curInt == 3){
				initials = string_delete(initials, 4, 1);
			}
			curInt++;
		}else if(key == "4" && curInt != 1){
			initials = string_delete(initials, curInt - 1, 1);
			if(curInt == 4){
				initials = string_insert("_", initials, 3);
			}
			curInt--;
		}

	}	
}

if(global.gamestate == GAME_STATE.savehighscore){
	if(newRank != -1){
		for(i = 4; i > newRank; i--){
			global.scoreArray[i] = global.scoreArray[i - 1];				
			global.initialsArray[i] = global.initialsArray[i - 1];
		}	
	
		global.scoreArray[newRank] = score;
		global.initialsArray[newRank] = initials;
	}
	
	file = file_text_open_write("Highscores.txt");
		
	for(i = 0; i < 5; i++){
		file_text_write_string(file, global.rankArray[i] + " ");
		file_text_write_real(file, global.scoreArray[i]);
		file_text_write_string(file, global.initialsArray[i] + "\n");
	}

	file_text_close(file);
		
	global.gamestate = GAME_STATE.highscore;
}