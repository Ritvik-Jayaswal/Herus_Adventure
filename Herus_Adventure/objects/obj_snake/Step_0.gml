/// @description Reduce Knockback
// You can write your code in this editor
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

