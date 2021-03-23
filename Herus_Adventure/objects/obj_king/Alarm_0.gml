/// @description Start attack timelines
// You can write your code in this editor
timeline_running = false;
path_end();
newAttack = irandom_range(0,2);
	
switch(newAttack){
	case(0):
		timeline_index = tml_bossCharge;
		timeline_position = 0;
		timeline_running = true;
		break;
			
	case(1):
		timeline_index = tml_bossPathing;
		timeline_position = 0;
		timeline_running = true;
		break;
			
	case(2):
		timeline_index = tml_bossProjectile;
		timeline_position = 0;
		timeline_running = true;
		break;
		
	default:
		break;
	
}

state = BOSS_STATE.pathing;