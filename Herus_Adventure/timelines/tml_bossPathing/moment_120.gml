/// @description Start Path

if(instance_exists(obj_king)){
	with(obj_king){

		switch(pathChoice){
			case(0):
				path_start(pth_bossLeftRight, 8, path_action_stop, true);
				alarm[0] = 440;
				break;
			
			case(1):
				path_start(pth_bossRightLeft, 8, path_action_stop, true);
				alarm[0] = 440;
				break;
				
			case(2):
				path_start(pth_bossDiamond, 8, path_action_stop, true);
				alarm[0] = 320;
				break;
				
			case(3): 
				path_start(pth_bossZigZag, 8, path_action_stop, true);
				alarm[0] = 700;
				break;
			
			default:
				break;
		}
		
		state = BOSS_STATE.pathing;
	}
}


