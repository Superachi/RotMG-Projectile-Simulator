/// @desc Draw the projectile
var dir = 0;
if faceDir {
	dir = projDir;
}
if faceDiag {
	dir -= 45;
}

var _size = size / 100;

draw_sprite_ext(sprite_index, animFrame - 1, x, y, 4 * _size, 4 * _size, dir, c_white, 1);