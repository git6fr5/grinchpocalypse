
function activate() {
	
	instance_create_depth(x, y, -y, loot);
	if (is_weapon) {
		obj_player.loot_weapon = loot;
	}
	instance_destroy();
	
	audio_play_sound(sfx_power_up, 1, false);
	audio_play_sound(msc_loot, 1, false);

}

if (obj_player.loot_weapon == noone) {
	activate();
}