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

function c_hex(_q, _r, _sprite = green_hex_sprite, _subimg = 0) constructor {
	q          = _q;
	r          = _r;
	hex_sprite = _sprite;
	subimg     = _subimg;
	
	static draw = function() {
		// hex_sprite must use middle/center for its origin
		var xy = qr2xy([q, r]);
		var room_coords = world2room(xy);
		draw_sprite(hex_sprite, subimg, room_coords[0], room_coords[1]);
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

function hex(_q = 0, _r = 0, _sprite = green_hex_sprite, _subimg = 0) {
	return new c_hex(_q, _r, _sprite, _subimg);
}
