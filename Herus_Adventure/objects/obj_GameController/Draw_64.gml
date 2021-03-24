/// @description Show Info
// You can write your code in this editor
if(global.gamestate == GAME_STATE.mainmenu){
	draw_set_font(fnt_title);
	draw_set_color(c_black);
	draw_set_halign(fa_center);
	draw_text(room_width / 2, 250, "Heru's Adventure");
	
	if(flash_state){
		draw_text(room_width / 2, 350, "Press ENTER to Start");
	}
	
	draw_set_font(fnt_subtitle);
	draw_text(room_width / 2, 550, "Use ARROW KEYS to move, Use Z and X to attack");
	draw_text(room_width / 2, 600, "Press S to view the current highscores");
	draw_set_halign(fa_left);	
}else if(global.gamestate == GAME_STATE.win){
	
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_font(fnt_title);
	draw_text_color(room_width / 2, room_height * 1 / 3, "You are now the Pharaoh!", c_black, c_black, c_black, c_black, 1);	
		
	
	draw_text_color(room_width / 2, room_height * 2 / 3, "Press ENTER to view Highscores!", c_black, c_black, c_black, c_black, 1);			
	
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
}else if(global.gamestate == GAME_STATE.lose){
	
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_font(fnt_title);
	draw_text_color(room_width / 2, room_height * 1 / 5, "You Died!", c_black, c_black, c_black, c_black, 1);	
		
	
	draw_text_color(room_width / 2, room_height * 2 / 3, "Press ESC to go to the Main Menu", c_black, c_black, c_black, c_black, 1);			
	
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
}else if(global.gamestate == GAME_STATE.newhighscore){
	
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_font(fnt_title);
	draw_text_color(room_width / 2, room_height * 1 / 3, "New Highscore!\n Enter Your Initials", c_black, c_black, c_black, c_black, 1);
	draw_text_color(room_width / 2, room_height * 7 / 13, initials, c_black, c_black, c_black, c_black, 1);	
		
	if(curInt == 4){
		draw_text_color(room_width / 2, room_height * 2 / 3, "Press ENTER to Confirm", c_black, c_black, c_black, c_black, 1);			
	}
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
} else if(global.gamestate == GAME_STATE.highscore){
	
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);
	draw_set_font(fnt_title);
	draw_text_color(room_width / 2, room_height / 8, "Highscores", c_black, c_black, c_black, c_black, 1);
		
	draw_set_font(fnt_subtitle);
	draw_text_color(room_width * 2 / 6, room_height * 2 / 8, "Rank", c_black, c_black, c_black, c_black, 1);
	draw_text_color(room_width * 3 / 6, room_height * 2 / 8, "Score", c_black, c_black, c_black, c_black, 1);
	draw_text_color(room_width * 4 / 6, room_height * 2 / 8, "Initials", c_black, c_black, c_black, c_black, 1);
	if(newRank == -1){
		draw_text_color(room_width / 2, room_height * 11 / 16, "Only runs that defeat the boss qualify for placement!", c_black, c_black, c_black, c_black, 1);
	}
	draw_text_color(room_width / 2, room_height * 13 / 16, "Press ESC to return to the main menu", c_black, c_black, c_black, c_black, 1);
		
	draw_set_font(fnt_subtitle);
	for(i = 0; i < 5; i++){
		if(i == newRank){
			draw_text_color(room_width * 2 / 6, room_height * (i + 5) / 16, global.rankArray[i], c_red, c_red, c_red, c_red, 1);
			draw_text_color(room_width * 3 / 6, room_height * (i + 5) / 16, string(global.scoreArray[i]), c_red, c_red, c_red, c_red, 1);
			draw_text_color(room_width * 4 / 6, room_height * (i + 5) / 16, global.initialsArray[i], c_red, c_red, c_red, c_red, 1);
		} else {	
			draw_text_color(room_width * 2 / 6, room_height * (i + 5) / 16, global.rankArray[i], c_black, c_black, c_black, c_black, 1);
			draw_text_color(room_width * 3 / 6, room_height * (i + 5) / 16, string(global.scoreArray[i]), c_black, c_black, c_black, c_black, 1);
			draw_text_color(room_width * 4 / 6, room_height * (i + 5) / 16, global.initialsArray[i], c_black, c_black, c_black, c_black, 1);
		}
	}
	
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
}else{


if instance_exists(obj_Heru){
	draw_set_font(fnt_HUD);
	draw_set_color(c_black);
	draw_set_valign(fa_top);
	draw_set_halign(fa_left);
	
	draw_healthbar(8,8,256,32,obj_Heru.hp,c_black,c_red,c_lime,0,true,true);
	draw_text(16,35,"Level: " + string(obj_Heru.level));
	
	draw_set_halign(fa_right);
	draw_text(256,35,"Score: " + string(score));
	draw_set_halign(fa_left);
}

if (global.gameover) {
	draw_text_color(view_hport[0]/2, view_wport[0]/2, "Game Over! Press R to restart.", c_black, c_black, c_black, c_black, false)
}
}