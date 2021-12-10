
function activate() {
	
	if (instance_exists(obj_gun_ornament)) {
		audio_play_sound(sfx_ammo_reload, 1, false);

		obj_gun_ornament.ammo += obj_gun_ornament.max_ammo / 2;
		if (obj_gun_ornament.ammo > obj_gun_ornament.max_ammo) {
			obj_gun_ornament.ammo = obj_gun_ornament.max_ammo;
		}
	}
	
	instance_destroy();
}

activate();