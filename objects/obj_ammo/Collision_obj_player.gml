
function activate() {
	
	if (instance_exists(obj_gun_ornament)) {
		obj_gun_ornament.ammo += 50;
		if (obj_gun_ornament.ammo > obj_gun_ornament.max_ammo) {
			obj_gun_ornament.ammo = obj_gun_ornament.max_ammo;
		}
	}
	
	instance_destroy();
}

activate();