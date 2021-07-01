/// @desc Allow for scrolling through the menu
if global.popupDialogue {
	exit;
}

// Scroll using either the mouse or the keyboard
menuScrollYGoal += (mouse_wheel_up() - mouse_wheel_down()) * menuScrollYInc;
menuScrollYGoal += (keyboard_check_pressed(vk_pageup) - keyboard_check_pressed(vk_pagedown)) * menuScrollYInc * 10;

// Clamp the values
menuScrollYGoal = clamp(menuScrollYGoal, menuScrollYMax, 0);
menuScrollY += (menuScrollYGoal - menuScrollY) / 4;
var _yOff = menuScrollY;

with (objListMenuButton) {
	scrollY = _yOff;
}