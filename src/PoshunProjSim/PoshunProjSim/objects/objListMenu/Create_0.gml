/// @desc
enum menuPages {
	home,
	action,
	visual
}

// Menu navigation
menuOpened = true;
global.currentPage = menuPages.home;

buttonList = ds_list_create();
createMenu(global.currentPage, buttonList);

// Scrolling
menuScrollY = 0;
menuScrollYGoal = 0;
menuScrollYInc = 72;
menuHeight = getListMenuHeight();
menuScrollYMax = menuHeight *-1 + (room_height - buttonList[| ds_list_size(buttonList) - 1].buttonHeight);