/// @description Damage and Knockback
// You can write your code in this editor
with(other){
	if (state != ENEMY_STATE.hurt){
		hp -= 2
		state = ENEMY_STATE.hurt;
		audio_play_sound(snd_skeletonDamage,1,false);
	}
	if (state == ENEMY_STATE.hurt){
		if instance_exists(obj_Heru){
			direction = point_direction(obj_Heru.x,obj_Heru.y,x,y);
		}
		speed = 20;
	}
}
if (other.hp <= 0){
	instance_destroy(other.id);
}