/*
	Code uses axial coordinates as described here:
	https://www.redblobgames.com/grids/hexagons/
	
	The origin of the axial coordinate system is assumed to be center of room.
*/
#macro sqrt_3   sqrt(3)
#macro hex_size 32

function c_hex(_q, _r, _sprite = green_hex_sprite, _subimg = 0) constructor {
	q = _q;
	r = _r;
	hex_sprite = _sprite;
	subimg = _subimg;
	
	static draw = function() {
		draw_sprite(
			hex_sprite, 
			subimg,
			room_width  / 2 + hex_size * sqrt_3 * (q + r / 2), 
			room_height / 2 + hex_size * 3 / 2 * r
		);
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

function hex(_q = 0, _r = 0, _sprite = green_hex_sprite, _subimg) {
	return new c_hex(_q, _r, _sprite, _subimg);
}
