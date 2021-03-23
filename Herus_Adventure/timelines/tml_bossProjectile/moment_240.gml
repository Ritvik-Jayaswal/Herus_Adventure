/// @description Throw Arrow 7

if(instance_exists(obj_king)){
	with(obj_king){
		instance_create_layer(x - (sign(image_xscale) * 50), y, "Room0", obj_arrow);
		path_speed = 8;
		state = BOSS_STATE.pathing;
	}
}
