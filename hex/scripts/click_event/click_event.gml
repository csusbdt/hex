function hex_round(_q, _r, _s) {
    var q = round(_q)
    var r = round(_r)
    var s = round(_s)
    //var q = floor(_q + .5)
    //var r = floor(_r + .5)
    //var s = floor(_s + .5)

    var q_diff = abs(q - _q)
    var r_diff = abs(r - _r)
    var s_diff = abs(s - _s)

	if (q_diff > r_diff and q_diff > s_diff) {
		q = -r - s;
	} else if (r_diff > s_diff) {
		r = -q - s;
	} else {
		s = -q - r;
	}
    return hex(q, r);
}

function click_event() {
	var frac_q = (sqrt(3.)/3. * (mouse_x - room_width / 2.) -  1./3. * (mouse_y - room_height / 2.)) / 32.;
    var frac_r = (2./3. * (mouse_y - room_height / 2.)) / 32.;
	var h = hex_round(frac_q, frac_r, -frac_q - frac_r);
	h.hex_sprite = red_hex_sprite;
	ds_list_add(global.object_level, h);
}