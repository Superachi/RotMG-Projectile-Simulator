/// @desc
hover = false;

if global.popupDialogue || !global.menuOpened {
	exit;
}

// If active, check if hovering and become visible
if isMouseOnButton() {
	hover = true;
}

// After hovering, make the user click the button to use the slider
if (hover) {
	if mouse_check_button_pressed(mb_left) {
		paramCurrent = !paramCurrent;
	}
}

// Sync parameter value to the selected emitter
setEmitterParam(paramType, paramCurrent);