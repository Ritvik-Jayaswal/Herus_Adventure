/// @description Move bow with player
// You can write your code in this editor
if (instance_exists(obj_Heru)){
	x = obj_Heru.x;
	if (image_angle == 90){
		y = obj_Heru.y - 10;
	}
	else if(image_angle == 270){
		y = obj_Heru.y + 10;
	}
	else{
		y = obj_Heru.y;
	}
}