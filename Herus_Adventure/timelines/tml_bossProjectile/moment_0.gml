/// @description Move to the start location of projectile path

if(instance_exists(obj_king)){
	with(obj_king){
		direction = point_direction(x, y, 672, 160);
		speed = point_distance(x, y, 672, 160) / (room_speed * 2);
		if(speed > .01){
			state = BOSS_STATE.pathing;
		}else{
			state = BOSS_STATE.waiting;		
		}
	}
}


