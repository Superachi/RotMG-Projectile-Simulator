enum optionTypes {
	lifetime,
	projSpeed,
	//projDir,
	boomerang,
	
	fireCooldown,
	arc,
	amount,
	
	animDelay,
	animRotate,
	faceDiag,
	stopOnLastFrame,
}

function getDefaultValues(_optionType){
	switch _optionType {
		// Action
		case optionTypes.lifetime:
			setOptionValues(60, 0, 300, "Lifetime", "frames", 0)
		break;
		
		case optionTypes.projSpeed:
			setOptionValues(3, 0, 20, "Velocity", "px per frame", 1)
		break;
		
		case optionTypes.boomerang:
			setOptionValues(0, 0, 1, "Boomerang", "(boolean)", 2)
		break;

		// Emitter
		case optionTypes.fireCooldown:
			setOptionValues(12, 3, 60, "Attack cooldown", "frames", 3)
		break;
		
		case optionTypes.arc:
			setOptionValues(10, 1, 180, "Arc", "degrees", 4)
		break;
		
		case optionTypes.amount:
			setOptionValues(1, 1, 30, "Amount", "projectiles", 5)
		break;
		
		// Visual
		case optionTypes.animDelay:
			setOptionValues(5, 3, 60, "Animation delay", "frames", 6)
		break;
		case optionTypes.animRotate:
			setOptionValues(0, -36, 36, "Rotation speed", "degrees", 7)
		break;
		case optionTypes.faceDiag:
			setOptionValues(0, 0, 1, "Diagonal angle", "(boolean)", 8)
		break;
		case optionTypes.stopOnLastFrame:
			setOptionValues(0, 0, 1, "Animate once only", "(boolean)", 9)
		break;
	}
}

/*


function setOptionValues(_startingValue, _minValue, _maxValue, _name, _unit, _iconIndex) {
	option_value = _startingValue;
	option_min = _minValue;
	option_max = _maxValue;
	option_name = _name;
	option_unit = _unit;
	option_icon = _iconIndex;
	
	// Update the visual position of the button on the slider
	var oRange = abs(option_max - option_min);
	slider_value = round((option_value - option_min) / oRange * slider_length);
}

*/