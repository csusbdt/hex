function round_axial(axial) {
    var _q = axial[0];
    var _r = axial[1];
    var _s = -_q - _r;
	
    var q  = round(_q);
    var r  = round(_r);
    var s  = round(_s);

    var q_diff = abs(q - _q)
    var r_diff = abs(r - _r)
    var s_diff = abs(s - _s)

	if (q_diff > r_diff and q_diff > s_diff) {
		q = -r - s;
	} else if (r_diff > s_diff) {
		r = -q - s;
	}
	//else {
	//	s = -q - r;
	//}
    return [q, r];
}

function controller_click_handler() {
	ds_list_clear(global.object_level);	
	var mouse_world = room2world([mouse_x, mouse_y]);
	var mouse_axial = xy2qr(mouse_world);
	var hex_axial   = round_axial(mouse_axial);
	ds_list_add(global.object_level, hex(hex_axial[0], hex_axial[1], red_hex_sprite));
}
