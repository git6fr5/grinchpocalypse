// ----------------- //
function hurt() {
	
	other.anger -= damage;
	
	obj_cam_controller.shake = true;
	
	knockback(other, 1);
	if (other.has_present) {
		 other.has_present = false;
		 var present = instance_create_depth(other.x, other.y, -y, obj_present);
		 present.is_dropped = true;
		 knockback(present, -1);
	}

}

function knockback(object, dir) {
	
	// object.path_index = -1;
	
	var dt = delta_time / 1000000;
	
	var magnitude = power(hspeed * hspeed + vspeed * vspeed, 0.5)
	
	object.knockback_hspeed = knockback_speed * dir * hspeed * dt / magnitude;
	object.knockback_vspeed = knockback_speed * dir * vspeed * dt / magnitude;
	
	// object.path_end();
	object.is_knockbacked = true;
	
}

// ----------------- //
function main(){
	
	audio_play_sound(impact_sound, 1, false);
	
	hurt();
	instance_destroy();
}

if (init == true) {
	main();
}