hp = 100;
image_xscale = .2;
image_yscale = .18;
enum PLAYER_STATE{
	walking,
	stabbing,
	shooting,
	hurt
}
nx = 0;
ny = 0;
level = 1;
state = PLAYER_STATE.walking;
atBoss = false;
canShoot = true;
global.gameover = false;