/// @description Show Info
// You can write your code in this editor
draw_healthbar(8,8,256,32,obj_Heru.hp,c_black,c_red,c_lime,0,true,true);
draw_text(16,32,"Level: " + string(obj_Heru.level));
/*
if (global.gameover) {
	draw_text(room_width / 2, room_height / 2, "Game Over! Press R to restart.")
}
*/