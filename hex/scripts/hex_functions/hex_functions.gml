/*
	Code uses axial coordinates as described here:
	https://www.redblobgames.com/grids/hexagons/
*/

// convert world pixel coords to world axial coords
function xy2qr(xy) {
	var _x = xy[0];
	var _y = xy[1];
	var q = (sqrt_3 / 3 * _x - 1 / 3 * _y) / hex_size;
	var r = (2 / 3 * _y                  ) / hex_size;	
	return [q, r];
}

// convert axial coords to world pixel coords
function qr2xy(qr) {
	var q = qr[0];
	var r = qr[1];
	var _x = (sqrt_3 * q + sqrt_3 / 2 * r) * hex_size;
	var _y = (3 / 2 * r                  ) * hex_size;
	return [_x, _y];
}

// convert world pixel coords to room coords
function world2room(world_coords) {
	return [
		world_coords[0] - global.camera_x + room_width  / 2, 
		world_coords[1] - global.camera_y + room_height / 2
	];
}

// convert room coords to world pixel coords
function room2world(room_coords) {
	return [
		room_coords[0] + global.camera_x - room_width  / 2, 
		room_coords[1] + global.camera_y - room_height / 2
	];
}

// round_axial used to convert xy coord to axial coord
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

function world_xy_to_hex_center(xy) {
	var mouse_axial = xy2qr(xy);
	return round_axial(mouse_axial);
}

function c_hex(_q, _r, _sprite = green_hex_sprite, _subimg = 0, _seconds_per_step = 1 / 6) constructor {
	q          = _q;
	r          = _r;
	hex_sprite = _sprite;
	subimg     = _subimg;
	seconds_per_step = _seconds_per_step;
	
	if (subimg == -1) {
		seconds_remaining = seconds_per_step;
		subimg2 = 0;
	} else {
		subimg2 = subimg;
	}

	static draw = function() {
		// hex_sprite must use middle/center for its origin
		if (subimg == -1) {
			seconds_remaining -= 1 / 30;
			if (seconds_remaining <= 0) {
				seconds_remaining += seconds_per_step;
				if (++subimg2 >= sprite_get_number(hex_sprite)) {
					subimg2 = 0;
				}
			}
		}
		var xy = qr2xy([q, r]);
		var room_coords = world2room(xy);
		draw_sprite(hex_sprite, subimg2, room_coords[0], room_coords[1]);
		return self;
	}
	
	static move_right = function() {
		++q;
		return self;
	}
	
	static move_left = function() {
		--q;
		return self;
	}
	
	static move_up_right = function() {
		++q;
		--r;
		return self;
	}
	
	static move_up_left = function() {
		--r;
		return self;
	}
	
	static move_down_right = function() {
		++r;
		return self;
	}
	
	static move_down_left = function() {
		--q;
		++r;
		return self;
	}
}

function hex(_q = 0, _r = 0, _sprite = green_hex_sprite, _subimg = 0, _seconds_per_step) {
	return new c_hex(_q, _r, _sprite, _subimg, _seconds_per_step);
}
