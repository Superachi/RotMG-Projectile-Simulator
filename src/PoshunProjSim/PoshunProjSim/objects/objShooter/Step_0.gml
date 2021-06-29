/// @desc Allow the object to fire
if cooldownTime > 0 {
	cooldownTime --;
}

if mouse_check_button(mb_left) && cooldownTime == 0 && global.projSprite != -1 {
	cooldownTime = cooldownBase;
	var dir = point_direction(x, y, mouse_x, mouse_y);
	var action = new bulletAction(100, 6, dir);
	var visual = new bulletVisual(100, 0.05, true, false, true, 0);
	bulletCreateMulti(action, visual, 5, 5)
}