/// @description Aggro Range
// You can write your code in this editor

// Skeletons run away from player
if (instance_exists(obj_Heru)){
	if (distance_to_object(obj_Heru) <= 150 && state == ENEMY_STATE.regular){
		state = ENEMY_STATE.aggro;
		direction = point_direction(obj_Heru.x,obj_Heru.y,x,y);
		speed = sp + 2;
	}
	if (state == ENEMY_STATE.aggro){
		if (canShoot){
			instance_create_layer(x,y,layer_get_id("Instances"),obj_arrow);
			alarm[1] = room_speed;
			canShoot = false;
		}
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
if (state == ENEMY_STATE.hurt){
	speed -= 1;
	if (speed == 0){
		state = ENEMY_STATE.regular;
		if (variant = 0){
			hspeed = sp;
			vspeed = 0;
		}
		else{
			hspeed = 0;
			vspeed = sp;
		}
	}
}
if instance_place(x+sp,y,obj_solid){
	x -= sp
	hspeed *= -1
	image_xscale *= -1;
}
if instance_place(x-sp,y,obj_solid){
	x += sp
	hspeed *= -1
	image_xscale *= -1;
}
if instance_place(x,y+sp,obj_solid){
	y -= sp
	vspeed *= -1
	image_xscale *= -1;
}
if instance_place(x,y-sp,obj_solid){
	y += sp
	vspeed *= -1
	image_xscale *= -1;
}



