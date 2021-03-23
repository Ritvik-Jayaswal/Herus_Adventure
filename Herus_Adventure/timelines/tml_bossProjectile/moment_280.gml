/// @description Throw Arrow 8

if(instance_exists(obj_king)){
	with(obj_king){
		path_speed = 0;
		state = BOSS_STATE.projectile;
		instance_create_layer(x - (sign(image_xscale) * 50), y, "Room0", obj_arrow);
	}
}
