/// @description Arrow direction
// You can write your code in this editor
image_xscale = .2;
image_yscale = .2;
if instance_exists(obj_Heru){
	direction = point_direction(x,y,obj_Heru.x,obj_Heru.y);
}
image_angle = direction;
/*
if (direction > 315 || direction < 45){
	sprite_index = spr_arrow1;
}
else if (direction > 45 && direction < 135){
	sprite_index = spr_arrow3;
}
else if (direction > 135 && direction < 225){
	sprite_index = spr_arrow2;
}
else{
	sprite_index = spr_arrow4;
}
*/
speed = 10;