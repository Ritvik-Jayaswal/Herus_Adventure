/// @description Gain life
// You can write your code in this editor
with (obj_Heru){
	hp += 10;
	if hp > 100{
		hp = 100;
	}
}
instance_destroy();