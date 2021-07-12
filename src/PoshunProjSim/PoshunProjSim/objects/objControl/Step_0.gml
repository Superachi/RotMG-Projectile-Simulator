/// @desc
if keyboard_check_pressed(ord("C")) {
	instance_destroy(objProjectile);
}

if keyboard_check_pressed(ord("H")) {
	with(objShooter) {
		visible = !visible;
	}
}