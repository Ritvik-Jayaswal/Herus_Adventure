/// @description Damage and Knockback
// You can write your code in this editor
obj_Heru.hp -= 10;
knockback = point_direction(x,y,obj_Heru.x,obj_Heru.y);
with(obj_Heru){
	direction = knockback;
	speed = 6;
}