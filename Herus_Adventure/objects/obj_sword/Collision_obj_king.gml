/// @description Damage and Knockback
// You can write your code in this editor
with(other){
	if (!isHurt){
		hp -= 2
		isHurt = true;
		
	}
	if (isHurt){
		if instance_exists(obj_Heru){
			direction = point_direction(obj_Heru.x,obj_Heru.y,x,y);
		}
		speed = 20;
		timer = 20;
	}
}
if (other.hp <= 0){
	instance_destroy(other.id);
}
