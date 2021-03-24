/// @description Sets seed for level generation
// You can write your code in this editor

//256 possible seeds based on the current (probably change later) 
gameSeed = date_get_second_of_year(date_current_datetime()) % 256;
random_set_seed(gameSeed);

enum GAME_STATE{
	blank,
	mainmenu,
	playing,
	newhighscore,
	savehighscore,
	highscore
}

global.gamestate = GAME_STATE.mainmenu;
audio_play_sound(snd_mainMusic,1,true);



//Highscore Table Read/Create
global.rankArray = array_create(5);
global.scoreArray = array_create(5);
global.initialsArray = array_create(5);

if(file_exists("Highscores.txt")){
	file = file_text_open_read("Highscores.txt");	
	
	i = 0;
	while(!file_text_eof(file)){
		temp = file_text_readln(file);
		
		//Get rank
		index = string_pos_ext(" ", temp, 1);
		global.rankArray[i] = string_copy(temp, 1, index - 1);
		
		//Get score
		oldindex = index + 1;
		index = string_pos_ext(" ", temp, oldindex);
		global.scoreArray[i] = real(string_copy(temp, oldindex, index - oldindex));
		
		//Get initials
		oldindex = index + 1;
		global.initialsArray[i] = string_copy(temp, oldindex, string_length(temp) - oldindex);
	
		i++;
	}
	
	file_text_close(file);
}else{
	for(i = 0; i < 5; i++){
		global.scoreArray[i] = (4 - i) * 3;
		global.initialsArray[i] = "HRU";
	}
	global.rankArray[0] = "1ST";
	global.rankArray[1] = "2ND";
	global.rankArray[2] = "3RD";
	global.rankArray[3] = "4TH";
	global.rankArray[4] = "5TH";
}