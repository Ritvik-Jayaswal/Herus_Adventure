/// @description Determine path choice and move to start

if(instance_exists(obj_king)){
	with(obj_king){
		pathChoice = irandom_range(0,3);

		switch(pathChoice){
			case(0):
				direction = point_direction(x, y, 160, 160);
				speed = point_distance(x, y, 160, 160) / (room_speed * 2);
				break;
			
			case(1):
				direction = point_direction(x, y, 1184, 160);
				speed = point_distance(x, y, 1184, 160) / (room_speed * 2);
				break;
				
			case(2):
				direction = point_direction(x, y, 672, 160);
				speed = point_distance(x, y, 672, 160) / (room_speed * 2);
				break;
				
			case(3): 
				direction = point_direction(x, y, 160, 544);
				speed = point_distance(x, y, 160, 544) / (room_speed * 2);
				break;
			
			default:
				break;
		}
	}
}


