// Create a struct holding common information for a button
function buttonBaseStruct(_x, _y, _width, _height, _bottomPadding) constructor {
	buttonX			= _x;
	buttonY			= _y;
	buttonWidth		= _width;
	buttonHeight	= _height;
	bottomPadding	= _bottomPadding;
}

// Apply the values from the struct to the actual button instance
function buttonApplyBaseStruct(_buttonBaseStruct) {
	buttonX			= _buttonBaseStruct.buttonX;
	buttonY			= _buttonBaseStruct.buttonY;
	buttonWidth		= _buttonBaseStruct.buttonWidth;
	buttonHeight	= _buttonBaseStruct.buttonHeight;
	bottomPadding	= _buttonBaseStruct.bottomPadding;
}

// Get the height of the list menu in pixels
// This can be used to calculate how far the user can scroll the menu
function getListMenuHeight() {
	var _h = 0;
	with(parMenuButton) {
		_h += buttonHeight + bottomPadding;
	}
	
	menuHeight = _h;
	menuScrollYMax = menuHeight * -1 + (room_height - global.buttonList[| ds_list_size(global.buttonList) - 1].buttonHeight);
	show_debug_message("The height of the list is: " + string(menuHeight));
}

// Check the last button from a given ds_list. Return a new y-value based on its Y, height and padding values
function getPreviousButtonY (_dsList) {
	var _prevButton = noone;
	var _y = 32;
	
	// Look at the last button within the given ds_list
	if (ds_list_size(_dsList) > 0) {
		_prevButton = ds_list_find_value(_dsList, ds_list_size(_dsList) - 1);
	}
	
	// If a button was found, return its Y. Otherwise, return a default value
	if _prevButton != noone {
		_y = _prevButton.buttonY + _prevButton.buttonHeight + _prevButton.bottomPadding;
	}
	
	return _y;
}

// Create a button to be placed within the list menu
function createListMenuButton(_buttonBaseStruct, _text, _function, _arguments) {
	var _y = getPreviousButtonY(global.buttonList);
	var obj = instance_create_depth(0, 0, 0, objListMenuButton);
	with(obj) {
		buttonApplyBaseStruct(_buttonBaseStruct);
		
		// The Y-coordinates of the button
		buttonY = _y;
		startY = buttonY;
		
		// The text displayed on the button
		buttonText = _text;
		
		// Pass in a function for the button to run, as well as any arguments
		buttonFunction = _function;
		buttonArguments = (_arguments == undefined) ? -1 : _arguments;
	}
	
	ds_list_add(global.buttonList, obj);
	return obj;
}

// Create a slider object, used for adjusting the value of a parameter
function createParamSlider(_buttonBaseStruct, _paramType) {
	var _y = getPreviousButtonY(global.buttonList);
	var obj = instance_create_depth(0, 0, 0, objParamSlider);
	with (obj) {
		buttonApplyBaseStruct(_buttonBaseStruct);
		
		// The Y-coordinates of the button
		buttonY = _y;
		startY = buttonY;
		
		// Parameter local values
		paramType =		_paramType;
		paramCurrent	= getEmitterParam(paramType);
		
		var struct		= getParamDefaults(paramType);
		paramMin		= struct.paramMin;
		paramMax		= struct.paramMax;
		paramRange		= abs(paramMax - paramMin);
		paramUnit		= struct.paramUnit;
		paramRounding	= struct.paramRounding;
		buttonText		= struct.paramName;
		
		// Slider dimensions/coordinates
		sliderX = buttonX + 32;
		sliderY = buttonY + buttonHeight - 20
		sliderWidth = buttonWidth - 64;
		sliderHeight = 6;
		
		sliderPercentage = (paramCurrent + abs(paramMin)) / paramRange
		sliderPos = sliderPercentage * sliderWidth;
	}
	
	ds_list_add(global.buttonList, obj);
	return obj;
}

// Create a slider object, used for adjusting the value of a parameter
function createParamBool(_buttonBaseStruct, _paramType) {
	var _y = getPreviousButtonY(global.buttonList);
	var obj = instance_create_depth(0, 0, 0, objParamBool);
	with (obj) {
		buttonApplyBaseStruct(_buttonBaseStruct);
		
		// The Y-coordinates of the button
		buttonY = _y;
		startY = buttonY;
		
		// Parameter local values
		paramType =		_paramType;
		paramCurrent	= getEmitterParam(paramType);
		
		var struct		= getParamDefaults(paramType);
		buttonText		= struct.paramName;
	}
	
	ds_list_add(global.buttonList, obj);
	return obj;
}

// Create a menu seperator, improving menu readability
function createSeperator(_buttonBaseStruct, _text) {
	var _y = getPreviousButtonY(global.buttonList);
	
	var obj = instance_create_depth(0, 0, 0, objListMenuSeperator);
	with (obj) {
		buttonApplyBaseStruct(_buttonBaseStruct);
		
		buttonText = _text;
		buttonHeight = string_height_ext(_text, 16, buttonWidth - 16);
		buttonY = _y;
		startY = buttonY;
	}
	
	ds_list_add(global.buttonList, obj);
	return obj;
}