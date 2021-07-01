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
	var _listHeight = 0;
	with(objListMenuButton) {
		_listHeight += buttonHeight + bottomPadding;
	}
	
	show_debug_message("The height of the list is: " + string(_listHeight));
	return _listHeight;
}

// Create a button to be placed within the list menu
function createListMenuButton(_buttonBaseStruct, _text, _function, _arguments) {
	var _dsList = global.buttonList;
	var _prevButton = noone;
	var _y;
	
	// Get the position of the previous button, then add it to this button's Y coordinates
	if (ds_list_size(_dsList) > 0) {
		_prevButton = ds_list_find_value(_dsList, ds_list_size(_dsList) - 1);
	}
	
	if _prevButton != noone {
		_y = _prevButton.buttonY + _prevButton.buttonHeight + _prevButton.bottomPadding;
	} else {
		_y = 32;
	}
	
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
	
	ds_list_add(_dsList, obj);
	return obj;
}

// Create a slider object, used for adjusting the value of a parameter
function createParamSlider(_buttonBaseStruct, _paramId) {
	var obj = instance_create_depth(0, 0, -10, objParamSlider);
	with (obj) {
		buttonApplyBaseStruct(_buttonBaseStruct);
	}
}

// Temp: remove this function, replace it with the new createParamSlider
function createOptionButton(_optionType, _x, _y) {
	var obj = instance_create_depth(_x, _y, 0, objOption);
	with (obj) {
		option_type = _optionType;
		getDefaultValues(option_type);
	}
}