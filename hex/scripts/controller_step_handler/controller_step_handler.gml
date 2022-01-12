#macro camera_speed 8

function controller_step_handler() {
	if (keyboard_check(ord("A"))) {
		global.camera_x += camera_speed;
	}
	if (keyboard_check(ord("D"))) {
		global.camera_x -= camera_speed;
	}
	if (keyboard_check(ord("W"))) {
		global.camera_y -= camera_speed;
	}
	if (keyboard_check(ord("S"))) {
		global.camera_y += camera_speed;
	}
}