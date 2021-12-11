
function activate() {
	
	instance_create_depth(x, y, -y, loot);
	if (is_weapon) {
		obj_player.loot_weapon = loot;
	}
	instance_destroy();
}

if (obj_player.loot_weapon == noone) {
	activate();
}