/// @description Changes based on state
// You can write your code in this editor

if(state == PLAYER_STATE.hurt){
	shader_set(shd_hurt);
	draw_self();
	shader_reset();
}else{
	draw_self();	
}