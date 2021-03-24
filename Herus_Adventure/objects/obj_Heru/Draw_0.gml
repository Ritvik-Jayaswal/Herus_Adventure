/// @description Changes based on state
// You can write your code in this editor
if(direction == 90){
	sprite_index = spr_heruBack;
}else{
	sprite_index = spr_heru;
}

if(state == PLAYER_STATE.walking){
	image_speed = 1;
}else{
	image_speed = 0;
}

if(state == PLAYER_STATE.hurt){
	shader_set(shd_hurt);
	draw_self();
	shader_reset();
}else{
	draw_self();	
}