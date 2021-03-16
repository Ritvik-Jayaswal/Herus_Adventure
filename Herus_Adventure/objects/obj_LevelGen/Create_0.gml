/// @description determine floor and room layout
// You can write your code in this editor

//Level Layout Generation
//Randomly pull a level layout
levelFile = "level1Layout/lvlLayout" + string(irandom_range(1,4)) + ".txt";
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
		
			//Randomly select the room layout, read it, generate it
			roomFile = "roomLayout/room" + string(irandom_range(2,5)) + ".txt";
			//unless that room is the spawn room or boss room
			if(levelArray[levelI][levelJ] == "S" || levelArray[levelI][levelJ] == "B"){
				roomFile = "roomLayout/room1.txt";
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
							instance_create_layer(newX, newY, curLayer, obj_door);
							continue;
						}
					}//Checks to see if a room to the West exists
					else if(i == 5 && j == 0 && levelJ != 0){
						if(levelArray[levelI][levelJ - 1] != "-"){
							instance_create_layer(newX, newY, curLayer, obj_door);
							continue;
						}
					}//Checks to see if a room to the East exists
					else if(i == 5 && j == 20 && levelJ != (array_length(levelArray[0]) - 1)){
						if(levelArray[levelI][levelJ + 1] != "-"){
							instance_create_layer(newX, newY, curLayer, obj_door);
							continue;
						}
					}//Checks to see if a room to the South exists
					else if(i == 10 && j == 10 && levelI != (array_length(levelArray) - 1)){
						if(levelArray[levelI + 1][levelJ] != "-"){
							instance_create_layer(newX, newY, curLayer, obj_door);
							continue;
						}
					}
					
					//Spawn each object in it's correct location
					curChar = string_char_at(curline, j+1);
					switch(curChar){
						case "W": 
							instance_create_layer(newX, newY, curLayer, obj_dirt);
							break;
			
						case "V":
							instance_create_layer(newX, newY, curLayer, obj_snake);
							break;
			
						case "P":
							//Might be removed depending on how we move player between levels
							instance_create_layer(newX, newY, curLayer, obj_Heru);
							break;
							
						case "S":
							instance_create_layer(newX, newY, curLayer, obj_skeleton);
							break;
							
						case "H":
							instance_create_layer(newX, newY, curLayer, obj_hole);
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
