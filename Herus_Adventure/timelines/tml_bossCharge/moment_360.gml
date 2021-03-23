/// @description End attack
if(instance_exists(obj_king)){
	with(obj_king){
		state = BOSS_STATE.waiting;
		AttackReady = true;
	}
}

