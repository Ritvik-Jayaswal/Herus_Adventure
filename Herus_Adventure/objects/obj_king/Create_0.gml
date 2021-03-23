/// @description Resize
// You can write your code in this editor
image_xscale = .5;
image_yscale = .5;

health = hp;
enum BOSS_STATE{
	waiting,
	charge,
	pathing,
	projectile
}


state = BOSS_STATE.waiting;
isHurt = false;
alarm[0] = 45;