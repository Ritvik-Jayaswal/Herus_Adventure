hp = 100;
image_xscale = .2;
image_yscale = .18;
enum PLAYER_STATE{
	walking,
	slashing,
	shooting,
	hurt
}
state = PLAYER_STATE.walking;