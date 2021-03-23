/// @description Movement and Actions
// You can write your code in this editor
if (state == PLAYER_STATE.walking){
	if (keyboard_check(vk_left) and !instance_place(x-4,y,obj_solid)) {
		x += -4;
		image_xscale = -.2;
		direction = 180;
	}

	if (keyboard_check(vk_right) and !instance_place(x+4,y,obj_solid)) {
		x += 4;
		image_xscale = .2;
		direction = 0;
	}
	if (keyboard_check(vk_up) and !instance_place(x,y-4,obj_solid)) {
		y -= 4;
		direction = 90;
	}
	if (keyboard_check(vk_down) and !instance_place(x,y+4,obj_solid)) {
		y += 4;
		direction = 270;
	}
}
if (state == PLAYER_STATE.hurt){
	speed -= 1;
	if (speed == 0){
		state = PLAYER_STATE.walking;
	}
}
if (keyboard_check_pressed(ord("Z")) && state == PLAYER_STATE.walking){
	instance_create_layer(x,y,"Instances",obj_sword);
	state = PLAYER_STATE.stabbing;
}
if (keyboard_check_pressed(ord("X")) && state == PLAYER_STATE.walking){
	if (canShoot){	
		if (direction == 90){
			instance_create_layer(x,y-10,"Instances",obj_bow);
		}
		else if (direction == 270){
			instance_create_layer(x,y+10,"Instances",obj_bow);
		}
		else{
			instance_create_layer(x,y,"Instances",obj_bow);
		}
		instance_create_layer(x,y,"Instances",obj_playerArrow);
		alarm[0] = room_speed;
		canShoot = false;
	}
	state = PLAYER_STATE.shooting;
}
if (state == PLAYER_STATE.stabbing){
	if (!instance_exists(obj_sword)){
		state = PLAYER_STATE.walking;
	}
}
if (state == PLAYER_STATE.shooting){
	if (!instance_exists(obj_bow)){
		state = PLAYER_STATE.walking;
	}
}
if(hp <= 0){
	audio_play_sound(snd_playerDeath,1,false);
	global.gameover = true;
	instance_destroy();
}

if(level == 4 && !atBoss){
	audio_stop_sound(snd_mainMusic);
	audio_play_sound(snd_tutMusic,1,true);
	atBoss = true;
}