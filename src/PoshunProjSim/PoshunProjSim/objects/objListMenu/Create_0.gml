/// @desc
enum menuPages {
	home,
	trajectory,
	visual,
	emitter,
	presets,
}

// Menu navigation
menuOpened = true;
global.currentPage = menuPages.home;

global.buttonList = ds_list_create();
createMenu(global.currentPage);

// Scrolling
menuScrollY = 0;
menuScrollYGoal = 0;
menuScrollYInc = 72;
menuHeight = getListMenuHeight();
menuScrollYMax = menuHeight *-1 + (room_height - global.buttonList[| ds_list_size(global.buttonList) - 1].buttonHeight);