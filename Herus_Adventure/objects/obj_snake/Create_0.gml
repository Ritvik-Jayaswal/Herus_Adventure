/// @description Resizing
// You can write your code in this editor
image_xscale = -.2;
image_yscale = .18;
variant = irandom_range(0,1);
if (variant = 0){
	hspeed = sp;
	vspeed = 0;
}
else{
	hspeed = 0;
	vspeed = sp;
}
health = hp;
enum ENEMY_STATE{
	regular,
	aggro,
	hurt
}
state = ENEMY_STATE.regular;