/// @desc
var oRange = abs(option_max - option_min);

// Allow the user to manipulate the slider
if mouse_x >= min_x && mouse_x <= max_x
&& abs(mouse_y - slider_y) < 16 {
	if mouse_check_button(mb_left) {
		global.heldButton = id;
		
		// Set the slider value based on the mouse_x, granting a value between 0 and 100
		slider_value = mouse_x - x + (slider_length div 2);
		option_value = round(oRange * (slider_value / slider_length)) + option_min;
	} else {
		
		// Allow the user to scroll to more precisely adjust the value
		option_value += mouse_wheel_up() - mouse_wheel_down();
		slider_value = round((option_value - option_min) / oRange * slider_length);
	}
	
	slider_value = clamp(slider_value, 0, slider_length);
	option_value = clamp(option_value, option_min, option_max);
}

// Animate the button
if global.heldButton == id {
	if mouse_x <= min_x {
		slider_x = min_x;
	}
	
	if mouse_x >= max_x {
		slider_x = max_x;
	}
	
	image_index = 1;
} else {
	image_index = 0;
}

// Release the button
if !mouse_check_button(mb_left) {
	global.heldButton = noone;
}

if keyboard_check_pressed(ord("R")) {
	option_value = irandom_range(option_min, option_max);
	slider_value = round((option_value - option_min) / oRange * slider_length);
}

// Apply the value to the chosen emitter
var obj = objShooter;
switch option_type {
	// Action
	case optionTypes.lifetime:
		obj.actionStruct.lifeTime = option_value;
	break;
	case optionTypes.projSpeed:
		obj.actionStruct.projSpeed = option_value;
	break;
	case optionTypes.boomerang:
		obj.actionStruct.boomerang = option_value;
	break;
	
	// Emitter
	case optionTypes.fireCooldown:
		obj.emitCooldown = option_value;
	break;
	case optionTypes.arc:
		obj.emitArc = option_value;
	break;
	case optionTypes.amount:
		obj.emitAmount = option_value;
	break;
	
	// Visual
	case optionTypes.animDelay:
		obj.visualStruct.animDelay = option_value;
	break;
	case optionTypes.animRotate:
		obj.visualStruct.animRotate = option_value;
	break;
	case optionTypes.faceDiag:
		obj.visualStruct.faceDiag = option_value;
	break;
	case optionTypes.stopOnLastFrame:
		obj.visualStruct.stopOnLastFrame = option_value;
	break;
}