/// @description Damage and Knockback
// You can write your code in this editor
if (state != PLAYER_STATE.hurt) {
	state = PLAYER_STATE.hurt;
	obj_Heru.hp -= 20;
}
if (state == PLAYER_STATE.hurt) {
	direction = point_direction(other.x,other.y,x,y);
	speed = 20;
}
