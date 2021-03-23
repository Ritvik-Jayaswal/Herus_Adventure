/// @description Start Path

if(instance_exists(obj_king)){
	with(obj_king){
		if(irandom_range(0,1)){
			path_reverse(pth_bossProjectile);
		}
		path_start(pth_bossProjectile, 8, path_action_restart, true);
		state = BOSS_STATE.pathing;
	}
}


