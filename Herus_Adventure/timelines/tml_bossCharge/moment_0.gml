/// @description First Charge
if(instance_exists(obj_king)){
	with(obj_king){
		if(instance_exists(obj_Heru)){
			direction = point_direction(x, y, obj_Heru.x, obj_Heru.y);	
			speed = 8;
			state = BOSS_STATE.charging;
		}
	}
}

