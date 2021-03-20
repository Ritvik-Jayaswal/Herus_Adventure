/// @description Aggro Range
// You can write your code in this editor

// Griffins run towards the player
if (instance_exists(obj_Heru)){
	if (distance_to_object(obj_Heru) <= 150 && state == ENEMY_STATE.regular){
		state = ENEMY_STATE.aggro;
		direction = point_direction(x,y,obj_Heru.x,obj_Heru.y);
		speed = sp + 2;
	}
	if (state == ENEMY_STATE.aggro){
		if (distance_to_object(obj_Heru) > 150){
			speed = 0;
			if (variant == 0){
				hspeed = sp;
			}
			else{
				vspeed = sp;
			}
			state = ENEMY_STATE.regular;
	    }
	}
}
if instance_place(x+sp,y,obj_stone){
	x -= sp
	hspeed *= -1
}
if instance_place(x-sp,y,obj_stone){
	x += sp
	hspeed *= -1
}
if instance_place(x,y+sp,obj_stone){
	y -= sp
	vspeed *= -1
}
if instance_place(x,y-sp,obj_stone){
	y += sp
	vspeed *= -1
}