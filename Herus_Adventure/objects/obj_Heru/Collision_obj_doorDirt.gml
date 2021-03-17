/// @description Room Transition
// You can write your code in this editor

//Determine direction of movement
//and change character placement based on that
if(camera_get_view_width(view_camera[0]) != room_width){
	xDiff = camera_get_view_x(view_camera[0]) - other.nextRoomX;
	yDiff = camera_get_view_y(view_camera[0]) - other.nextRoomY;
}else{
	//This logic is not the best
	//But it will work for the short time when
	//Debugging whole level layouts
	//Just make sure to hold one key during movement through doors
	if(keyboard_check(vk_up)){
		xDiff = 0;
		yDiff = 1;
	}else if(keyboard_check(vk_right)){
		xDiff = -1;
		yDiff = 0;
	}else if(keyboard_check(vk_down)){
		xDiff = 0;
		yDiff = -1;
	}else if(keyboard_check(vk_left)){
		xDiff = 1;
		yDiff = 0;
	}
}


if(xDiff < 0){
	x = x + 175;
}else if(xDiff > 0){
	x = x - 175;
}else if(yDiff < 0){
	y = y + 185;
}else if(yDiff > 0){
	y = y - 185;	
}

if(other.nextRoomBoss && instance_exists(obj_king)){
	x = other.nextRoomX + 672;
	y = other.nextRoomY + 550;
}

//Change camera location
if(camera_get_view_width(view_camera[0]) != room_width){
	camera_set_view_pos(view_camera[0], other.nextRoomX, other.nextRoomY);
}

