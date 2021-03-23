/// @description Resizing
// You can write your code in this editor
image_xscale = .30;
image_yscale = .30;
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
state = ENEMY_STATE.regular;