/*
	Code uses axial/cube coordinates as described here:
	https://www.redblobgames.com/grids/hexagons/
	
	The origin of the cube coordinate system is assumed to be center of room.
*/
#macro sqrt_3   sqrt(3)
#macro hex_size 32

function f_draw_hex(_q, _r, _sprite, _subimg = 0) {
	draw_sprite(
		_sprite, 
		_subimg,
		room_width  / 2 + hex_size  / 2 * sqrt_3 * (_q + _r / 2), 
		room_height / 2 + hex_size * 3 / 2 * _r
	);
}

