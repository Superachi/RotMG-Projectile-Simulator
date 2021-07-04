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
	global.disableMouseScrolling = true;
	if mouse_wheel_up() - mouse_wheel_down() != 0 {
		paramCurrent += mouse_wheel_up() - mouse_wheel_down();
		sliderPercentage = (paramCurrent + abs(paramMin)) / paramRange
		sliderPos = sliderPercentage * sliderWidth;
	}
	
	if mouse_check_button_pressed(mb_left) {
		selected = true;
	}
}

// Move the slider to match the mouse_x
if selected {
	var padding = 16;
	if mouse_x > sliderX - padding && mouse_x < sliderX + sliderWidth + padding {
		sliderPos = mouse_x - sliderX;
	}
	
	if mouse_check_button_released(mb_left) || !hover {
		selected = false;
	}
	
	sliderPos = clamp(sliderPos, 0, sliderWidth);
	sliderPercentage = sliderPos / sliderWidth;
	paramCurrent = (sliderPercentage * paramRange)+ paramMin
}

if paramRounding {
	paramCurrent = round(paramCurrent);
}

paramCurrent = clamp(paramCurrent, paramMin, paramMax);

// Sync parameter value to the selected emitter
setEmitterParam(paramType, paramCurrent);