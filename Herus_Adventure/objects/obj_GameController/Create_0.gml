/// @description Sets seed for level generation
// You can write your code in this editor

//256 possible seeds based on the current (probably change later) 
gameSeed = date_get_second_of_year(date_current_datetime()) % 256;
random_set_seed(gameSeed);
