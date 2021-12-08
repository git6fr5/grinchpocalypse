
function activate() {
	
	instance_create_depth(x, y, -y, loot);
	if (is_weapon) {
		obj_player.loot_weapon = loot;
	}
	
}

activate();