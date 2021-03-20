/// @description determine floor and room layout
// You can write your code in this editor

//Level Layout Generation
//Randomly pull a level layout
levelFile = room_get_name(room) + "Layout/lvlLayout" + string(irandom_range(1,10)) + ".txt";
if(room_get_name(room) == "Level4"){
	levelFile = "Level4Layout/lvlLayout.txt";	
}
show_debug_message(levelFile)
//Read it and store in the room array for easy reference
file = file_text_open_read(levelFile);
levelArray[0,0] = 0;
lineCT = -1;
while(!file_text_eof(file)){
	lineCT++;
	curline = file_text_readln(file);
	curIndex = 0;
	for(i = 1; i <= string_length(curline); i++){
		curChar = string_char_at(curline, i);
		if(curChar == "-" || curChar == "B" || curChar == "R" || curChar == "S" || curChar == "T"){
			levelArray[lineCT][curIndex] = curChar;
			curIndex++;
		}
	}
}
file_text_close(file);


//Room Layout for each room
//For each room in the level layout generate
for(levelI = 0; levelI < array_length(levelArray); levelI++){
	for(levelJ = 0; levelJ < array_length(levelArray[0]); levelJ++){
		if(levelArray[levelI][levelJ] != "-"){			
			roomX = levelJ * 1344;
			roomY = levelI * 704;
			curLayer = "Room" + string(levelI*levelJ + levelJ);
			
			//Set enemy type for the room (in case there are enemies)
			//This means only one type of enemy per room
			enemyType = irandom_range(1, string_char_at(room_get_name(room), 6));
			if(string_char_at(room_get_name(room), 6) >= "3"){
				walls = obj_stone;
				doors = obj_doorStone;
			}else{
				walls = obj_dirt;
				doors = obj_doorDirt;
			}
		
			//Randomly select the room layout, read it, generate it
			roomFile = "roomLayout/room" + string(irandom_range(1,10)) + ".txt";
			//unless that room is the spawn room or boss room
			if(levelArray[levelI][levelJ] == "S"){
				roomFile = "roomLayout/roomStart.txt";
				camera_set_view_pos(view_camera[0], roomX, roomY);
			}
			
			if(levelArray[levelI][levelJ] == "B"){
				roomFile = "roomLayout/roomBoss.txt";
			}
			
			file = file_text_open_read(roomFile);
			for(i = 0; i < 11; i++){
				curline = file_text_readln(file);
				for(j = 0; j < 21; j++){
					newX = (j * 64) + 32 + roomX;
					newY = (i * 64) + 32 + roomY;
		
					//Door Generation based on Room Array
					//Checks to see if a room to the North exists
					if(i == 0 && j == 10 && levelI != 0){
						if(levelArray[levelI - 1][levelJ] != "-"){
							door = instance_create_layer(newX, newY, curLayer, doors);
							with(door){
								nextRoomX = other.roomX;
								nextRoomY = other.roomY - 704;
								if(other.levelArray[other.levelI - 1][other.levelJ] == "B"){
									nextRoomBoss = true;
								}
							}
							continue;
						}
					}//Checks to see if a room to the West exists
					else if(i == 5 && j == 0 && levelJ != 0){
						if(levelArray[levelI][levelJ - 1] != "-"){
							door = instance_create_layer(newX, newY, curLayer, doors);
							with(door){
								nextRoomX = other.roomX - 1344;
								nextRoomY = other.roomY;
								image_angle = 90;
								if(other.levelArray[other.levelI][other.levelJ - 1] == "B"){
									nextRoomBoss = true;
								}
							}
							continue;
						}
					}//Checks to see if a room to the East exists
					else if(i == 5 && j == 20 && levelJ != (array_length(levelArray[0]) - 1)){
						if(levelArray[levelI][levelJ + 1] != "-"){
							door = instance_create_layer(newX, newY, curLayer, doors);
							with(door){
								nextRoomX = other.roomX + 1344;
								nextRoomY = other.roomY;
								image_angle = 90;
								if(other.levelArray[other.levelI][other.levelJ + 1] == "B"){
									nextRoomBoss = true;
								}
							}	
							continue;
						}
					}//Checks to see if a room to the South exists
					else if(i == 10 && j == 10 && levelI != (array_length(levelArray) - 1)){
						if(levelArray[levelI + 1][levelJ] != "-"){
							door = instance_create_layer(newX, newY, curLayer, doors);
							with(door){
								nextRoomX = other.roomX;
								nextRoomY = other.roomY + 704;
								if(other.levelArray[other.levelI + 1][other.levelJ] == "B"){
									nextRoomBoss = true;
								}
							}
							continue;
						}
					}
					
					//Spawn each object in it's correct location
					curChar = string_char_at(curline, j+1);
					switch(curChar){
						case "W": 
							instance_create_layer(newX, newY, curLayer, walls);
							break;
			
						case "V":
							instance_create_layer(newX, newY, curLayer, obj_vase);
							break;
			
						case "P":
							if(roomFile == "roomLayout/roomStart.txt" || (roomFile == "roomLayout/roomBoss.txt" && room_get_name(room) == "Level4")){
								//instance_create_layer(newX, newY, curLayer, obj_Heru);
								// Added code for persistent object
								obj_Heru.nx = newX; 
								obj_Heru.ny = newY;
								with(obj_Heru){
									x = nx;
									y = ny;
								}
							}
							break;
							
						case "S":
							instance_create_layer(newX, newY, curLayer, obj_statue);
							break;
							
						case "H":
							instance_create_layer(newX, newY, curLayer, obj_hole);
							break;
						
						case "E":
							switch(enemyType){
								case 1:
									instance_create_layer(newX, newY, curLayer, obj_snake);
									break;
								case 2:
									instance_create_layer(newX, newY, curLayer, obj_skeleton);
									break;
								case 3:
									instance_create_layer(newX, newY, curLayer, obj_griffin);
									break;
								default:
									break;
							}
							break;
							
						case "B":
							if(room_get_name(room) != "Level4"){
								instance_create_layer(newX, newY, curLayer, obj_stairs);
							}else{
								instance_create_layer(newX, newY, curLayer, obj_king);
							}
							break;
							
						default:
							break;
					}
		
				}
			}
			file_text_close(file);	
		}
	}
}
