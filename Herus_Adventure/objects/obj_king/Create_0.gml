/// @description Resize
// You can write your code in this editor
image_xscale = .5;
image_yscale = .5;

health = hp;
enum BOSS_STATE{
	waiting,
	charging,
	pathing,
	shooting,
	hurt
}
state = BOSS_STATE.waiting;
alarm[0] = 45;