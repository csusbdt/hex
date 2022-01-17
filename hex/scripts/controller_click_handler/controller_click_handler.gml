function controller_click_handler() {
	ds_list_clear(global.object_level);	
	var mouse_world = room2world([mouse_x, mouse_y]);
	var qr = world_xy_to_hex_center(mouse_world);
	ds_list_add(global.object_level, hex(qr[0], qr[1], red_hex_sprite));
}
