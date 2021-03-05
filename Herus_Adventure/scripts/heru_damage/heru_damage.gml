// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function heru_damage(damage){
    heru.hp += damage;
	// Death
    if heru.hp <= 0 {
		instance_destroy(heru.id);
	}
}