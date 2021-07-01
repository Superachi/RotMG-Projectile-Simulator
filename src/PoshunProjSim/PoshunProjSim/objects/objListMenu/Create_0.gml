/// @desc
enum menuPages {
	home,
	action,
	visual
}

// Menu navigation
menuOpened = false;
currentPage = menuPages.home;

buttonList = ds_list_create();

// Temp create buttons
for (var i = 0; i < 30; i ++) {
	var obj = createListMenuButton(buttonList, room_width - 236, 200, 64, 8, "Button " + string(i + 1), 0);
	ds_list_add(buttonList, obj);
}

// Scrolling
menuScrollY = 0;
menuScrollYGoal = 0;
menuScrollYInc = 72;
menuHeight = getListMenuHeight();
menuScrollYMax = menuHeight *-1 + (room_height - buttonList[| ds_list_size(buttonList) - 1].buttonHeight);