/// @description Show Info
// You can write your code in this editor
if instance_exists(obj_Heru){
	draw_healthbar(8,8,256,32,obj_Heru.hp,c_black,c_red,c_lime,0,true,true);
	draw_text(16,32,"Level: " + string(obj_Heru.level));
}
if (global.gameover) {
	draw_text_color(view_hport[0]/2, view_wport[0]/2, "Game Over! Press R to restart.", c_black, c_black, c_black, c_black, false)
}
