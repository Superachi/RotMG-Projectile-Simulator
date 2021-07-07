/// @desc Allow for scrolling through the menu
if global.popupDialogue {
	exit;
}

// Close the menu
if keyboard_check_pressed(vk_escape) {
	global.menuOpened = !global.menuOpened;
}

// Scroll using either the mouse or the keyboard
if (!global.disableMouseScrolling) {
	menuScrollYGoal += (mouse_wheel_up() - mouse_wheel_down()) * menuScrollYInc;
}

menuScrollYGoal += (keyboard_check_pressed(vk_pageup) - keyboard_check_pressed(vk_pagedown)) * menuScrollYInc * 8;
menuScrollYGoal = clamp(menuScrollYGoal, menuScrollYMax, 0);
menuScrollY += (menuScrollYGoal - menuScrollY) / 4;
var _yOff = menuScrollY;

with (parMenuButton) {
	scrollY = _yOff;
	buttonY = startY + scrollY;
}

global.mouseInMenu = mouse_x > global.menuX && global.menuOpened;

// Re-enable scrolling through the menu using the mouse
global.disableMouseScrolling = false;