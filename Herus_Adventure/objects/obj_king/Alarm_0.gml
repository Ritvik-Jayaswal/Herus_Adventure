/// @description Start attack timelines
// You can write your code in this editor
timeline_running = false;
newAttack = irandom_range(0,2);
	
switch(1){
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

show_message("start");