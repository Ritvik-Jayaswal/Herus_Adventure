/// @description Resizing
// You can write your code in this editor
image_xscale = -.2;
image_yscale = .18;
hspeed = hsp;
health = hp;
enum ENEMY_STATE{
	regular,
	aggro,
	hurt
}
state = ENEMY_STATE.regular;