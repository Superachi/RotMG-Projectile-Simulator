// Check if the user's mouse is within the dimensions of the button
function isMouseOnButton(){
	var result = false;
	if  mouse_x > buttonX && mouse_x < buttonX + buttonWidth &&
		mouse_y > buttonY && mouse_y < buttonY + buttonHeight {
		result = true;
	}
	
	return result;
}