/// @description Damage and Knockback
// You can write your code in this editor
with(other){
	direction = point_direction(obj_Heru.x,obj_Heru.y,x,y);
	speed = 20;
	hp -= 2
	state = ENEMY_STATE.hurt;
	audio_play_sound(snd_snakeDamage,1,false);
}
if (other.hp <= 0){
	instance_destroy(other.id);
}