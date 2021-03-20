/// @description Movement and Actions
// You can write your code in this editor
if (state == PLAYER_STATE.walking){
	if (keyboard_check(vk_left) and !instance_place(x-4,y,obj_solid)) {
		x += -4;
		image_xscale = -.2;
	}

	if (keyboard_check(vk_right) and !instance_place(x+4,y,obj_solid)) {
		x += 4;
		image_xscale = .2;
	}
	if (keyboard_check(vk_up) and !instance_place(x,y-4,obj_solid)) {
		y -= 4;
	}
	if (keyboard_check(vk_down) and !instance_place(x,y+4,obj_solid)) {
		y += 4;
	}
}
if (state == PLAYER_STATE.hurt){
	speed -= 1;
	if (speed == 0){
		state = PLAYER_STATE.walking;
	}
}

if(hp <= 0){
	global.gameover = true;
	instance_destroy();
}