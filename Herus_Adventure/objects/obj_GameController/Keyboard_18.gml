/// @description Extras
// You can write your code in this editor


if(global.gamestate = GAME_STATE.playing){
	//Refill Health
	if(keyboard_check_pressed(ord("H"))){
		if(instance_exists(obj_Heru)){
			obj_Heru.hp = 100;
		}
	}
	
	//Skip to next level
	if(keyboard_check_pressed(ord("N")) && (room != Level4)){
		room_goto_next();
		with(obj_Heru){
			level += 1;	
		}
	}

	//View Entire Level
	if(keyboard_check_pressed(ord("V"))){
			camera_set_view_pos(view_camera[0], 0, 0);
			camera_set_view_size(view_camera[0], room_width, room_height);
	}

	//Kill Boss
	if(keyboard_check_pressed(ord("B"))){
		if(instance_exists(obj_king)){
			instance_destroy(obj_king);
		}
	}
}
