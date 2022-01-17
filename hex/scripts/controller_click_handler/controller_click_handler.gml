function controller_click_handler() {
	var mouse_world = room2world([mouse_x, mouse_y]);
	var qr = world_xy_to_hex_center(mouse_world);
	var h = hex(qr[0], qr[1], rotating_red_hex_sprite, -1);
	ds_list_clear(global.object_level);	
	ds_list_add(global.object_level, h);
}
