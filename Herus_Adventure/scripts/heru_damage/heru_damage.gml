// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function heru_damage(damage){
    obj_Heru.hp += damage;
	// Death
    if obj_Heru.hp <= 0 {
		instance_destroy(obj_Heru.id);
	}
}