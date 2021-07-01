/// @desc Allow the object to fire
if cooldownTime > 0 {
	cooldownTime --;
}

// Shoot
if mouse_check_button(mb_left) && mouse_x < room_width - 160
&& cooldownTime == 0
&& global.projSprite != -1
&& global.heldButton == noone {
	cooldownTime = emitCooldown;
	actionStruct.projDir = point_direction(x, y, mouse_x, mouse_y);
	bulletCreateMulti(actionStruct, visualStruct, emitAmount, emitArc)
}

// Move
var spd = 4;
var deltaX = keyboard_check(ord("D")) - keyboard_check(ord("A"))
var deltaY = keyboard_check(ord("S")) - keyboard_check(ord("W"))
if deltaX != 0 {
	x += deltaX * spd;
}

if deltaY != 0 {
	y += deltaY * spd;
}

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);