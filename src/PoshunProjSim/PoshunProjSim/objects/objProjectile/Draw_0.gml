/// @desc Draw the projectile
// Calculate the visual angle of the projectile
var dir = rotateAngle;
if faceDir {
	dir += projDir;
}
if faceDiag {
	dir -= 45;
}

// Set the visual size
var _size = size / 100;

// Draw the sprite
draw_sprite_ext(sprite_index, animFrame - 1, x, y, 4 * _size, 4 * _size, dir, c_white, 1);