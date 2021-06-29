// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
enum optionTypes {
	lifetime,
	projSpeed,
	projDir,
	boomerang,
	
	fireCooldown,
	arc,
	amount,
	
	animRotate,
}


function setOptionValues(_startingValue, _minValue, _maxValue, _name, _unit) {
	option_value = _startingValue;
	option_min = _minValue;
	option_max = _maxValue;
	option_name = _name;
	option_unit = _unit;
	
	// Update the visual position of the button on the slider
	var oRange = abs(option_max - option_min);
	slider_value = round((option_value - option_min) / oRange * slider_length);
}

function getDefaultValues(_optionType){
	switch _optionType {
		// Action
		case optionTypes.lifetime:
			setOptionValues(60, 0, 300, "Lifetime", "frames")
		break;
		
		case optionTypes.projSpeed:
			setOptionValues(3, 0, 10, "Velocity", "px per frame")
		break;
		
		case optionTypes.boomerang:
			setOptionValues(0, 0, 1, "Boomerang", "(boolean)")
		break;

		// Emitter
		case optionTypes.fireCooldown:
			setOptionValues(12, 1, 120, "Attack cooldown", "frames")
		break;
		
		case optionTypes.arc:
			setOptionValues(10, 0, 180, "Arc", "degrees")
		break;
		
		case optionTypes.amount:
			setOptionValues(1, 1, 50, "Amount", "projectiles")
		break;
		
		// Visual
		case optionTypes.animRotate:
			setOptionValues(0, -18, 36, "Rotation speed", "degrees")
		break;
	}
}

function createOptionButton(_optionType, _x, _y) {
	var obj = instance_create_depth(_x, _y, 0, objOption);
	with (obj) {
		option_type = _optionType;
		getDefaultValues(option_type);
	}
}