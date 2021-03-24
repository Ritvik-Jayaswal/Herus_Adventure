/// @description Play Sound and drop items
// You can write your code in this editor
audio_play_sound(snd_enemyDeath,1,false);
score += score_value;
if (irandom_range(1,6) == 1){
	instance_create_layer(x,y,layer,obj_life);
}