/// @description Damage and Knockback
// You can write your code in this editor
instance_destroy();
with(other){
	if (!isHurt){
		hp -= 2
		isHurt = true;
		
	}
	if (isHurt){
		timer = 20;
	}
}
if (other.hp <= 0){
	instance_destroy(other.id);
}
