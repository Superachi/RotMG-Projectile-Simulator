/// @desc Allow the object to fire
if global.popupDialogue {
	exit;
}

if cooldownTime > 0 {
	cooldownTime --;
}

if abs(mouse_x - x) < hitboxSize && abs(mouse_y - y) < hitboxSize {
	if mouse_check_button_pressed(mb_left) {
		if global.selectedEmitter != id {
			global.selectedEmitter = id;
			createMenu(menuPages.emitterSelected);
		} else {
			global.selectedEmitter = noone;
			createMenu(menuPages.home);
		}
	}
}

// Shoot
else if mouse_check_button(mb_left) && !global.mouseInMenu
&& cooldownTime == 0
&& global.projSprite != -1
&& global.heldButton == noone {
	cooldownTime = emitCooldown;
	actionStruct.projDir = random(360);
	bulletCreateMulti(actionStruct, visualStruct, emitAmount, emitArc)
}

// Move
var spd = 6;
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