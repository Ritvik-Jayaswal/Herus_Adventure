/// @description determine floor and room layout
// You can write your code in this editor

//Level Layout Generation
//Randomly pull a level layout
//Read it and store in the room array for easy reference
file = file_text_open_read("level1Layout/lvlLayout1.txt");
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
show_message(array_length(levelArray));
show_message(array_length(levelArray[0]));


//Room Layout for each room
//For each room in the level layout generate
for(levelI = 0; levelI < array_length(levelArray); levelI++){
	for(levelJ = 0; levelJ < array_length(levelArray[0]); levelJ++){
		if(levelArray[levelI][levelJ] != "-"){			
			roomX = levelJ * 1344;
			roomY = levelI * 704;
			curLayer = "Room" + string(levelI*levelJ + levelJ);
		
			//Randomly select the room layout, read it, generate it
			file = file_text_open_read("roomLayout/room1.txt");
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
		
					curChar = string_char_at(curline, j+1);
					switch(curChar){
						case "W": 
							instance_create_layer(newX, newY, curLayer, obj_wall);
							break;
			
						case "V":
							instance_create_layer(newX, newY, curLayer, obj_vase);
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
		}
	}
}
