/// @description Damage and Knockback
// You can write your code in this editor
instance_destroy();
with(other){
	if (state != ENEMY_STATE.hurt){
		hp -= 1
		state = ENEMY_STATE.hurt;
		audio_play_sound(snd_griffinDamage,1,false);
	}
	if (state == ENEMY_STATE.hurt){
		if instance_exists(obj_Heru){
			direction = point_direction(obj_Heru.x,obj_Heru.y,x,y);
		}
		speed = 10;
	}
}
if (other.hp <= 0){
	instance_destroy(other.id);
}