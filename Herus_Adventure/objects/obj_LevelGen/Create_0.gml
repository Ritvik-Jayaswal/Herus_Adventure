/// @description determine floor and room layout
// You can write your code in this editor

//Level Layout Generation
//Randomly pull a level layout
//Read it and store in the room array for easy reference
roomArray = [1];


//Room Layout for each room
//For each room in the level layout generate
//Randomly select the room layout, read it, generate it
file = file_text_open_read("roomLayout/room1.txt");
for(i = 0; i < 11; i++){
	curline = file_text_readln(file);
	for(j = 0; j < 21; j++){
		newX = (j * 64) + 32;
		newY = (i * 64) + 32;
		
		//Door Generation based on Room Array (where the trues are currently located)
		if(i == 0 && j == 10 && true){
			instance_create_layer(newX, newY, "RoomStructs", obj_door);
			continue;
		}else if(i == 5 && j == 0 && true){
			instance_create_layer(newX, newY, "RoomStructs", obj_door);
			continue;	
		}else if(i == 5 && j == 20 && true){
			instance_create_layer(newX, newY, "RoomStructs", obj_door);
			continue;
		}else if(i == 10 && j == 10 && true){
			instance_create_layer(newX, newY, "RoomStructs", obj_door);
			continue;
		}
		
		curChar = string_char_at(curline, j+1);
		switch(curChar){
			case "W": 
				instance_create_layer(newX, newY, "RoomStructs", obj_wall);
				break;
			
			case "V":
				instance_create_layer(newX, newY, "RoomStructs", obj_vase);
				break;
			
			case "P":
				//Might be removed depending on how we move player between levels
				//instance_create_layer(newX, newY, "Player", obj_player);
				break;
				
			default:
				break;
		}
		
	}
}

file_text_close(file);