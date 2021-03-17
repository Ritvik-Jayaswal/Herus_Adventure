/// @description Room Transition
// You can write your code in this editor

//Determine direction of movement
//and change character placement based on that
xDiff = camera_get_view_x(view_camera[0]) - other.nextRoomX;
yDiff = camera_get_view_y(view_camera[0]) - other.nextRoomY;

if(xDiff < 0){
	x = x + 175;
}else if(xDiff > 0){
	x = x - 175;
}else if(yDiff < 0){
	y = y + 185;
}else if(yDiff > 0){
	y = y - 185;	
}

if(other.nextRoomBoss){
	x = other.nextRoomX + 672;
	y = other.nextRoomY + 550;
}

//Change camera location
camera_set_view_pos(view_camera[0], other.nextRoomX, other.nextRoomY);


