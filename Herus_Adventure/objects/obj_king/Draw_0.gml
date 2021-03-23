/// @description Changes based on state
// You can write your code in this editor

switch(state){
	case(BOSS_STATE.waiting):
		image_speed = 0;
		sprite_index = spr_king;
		break;
		
	case(BOSS_STATE.pathing):
		image_speed = 1;
		sprite_index = spr_king;
		break;
	
	case(BOSS_STATE.charge):
		image_speed = 1.5;
		sprite_index = spr_kingCharge;
		break;
	
	case(BOSS_STATE.projectile):
		image_speed = 1;
		sprite_index = spr_kingThrow;
		break;
	
	default:
		break;
}
if(path_index != -1){
	prevPath = path_position - .01; //path_positionprevious is unusable because of when path is updated
	xdiff = path_get_x(path_index, path_position) - path_get_x(path_index, prevPath);
	if(xdiff >= 0){
		image_xscale = -.5;
	}else{
		image_xscale = .5;	
	}
}else{
	if(hspeed > 0){
		image_xscale = -.5;
	}else{
		image_xscale = .5;
	}
}

if(isHurt){
	shader_set(shd_hurt);
	draw_self();
	shader_reset();
}else{
	draw_self();	
}


