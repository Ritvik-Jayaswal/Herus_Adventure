/// @description Movement and Actions
// You can write your code in this editor
if (keyboard_check(vk_left) and !instance_place(x-4,y,obj_dirt)) {
	x += -4
	image_xscale = -.2
}

if (keyboard_check(vk_right) and !instance_place(x+4,y,obj_dirt)) {
	x += 4
	image_xscale = .2
}
if (keyboard_check(vk_up) and !instance_place(x,y-4,obj_dirt)) {
	y -= 4
}
if (keyboard_check(vk_down) and !instance_place(x,y+4,obj_dirt)) {
	y += 4
}
