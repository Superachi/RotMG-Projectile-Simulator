/// @desc
enum menuPages {
	home,
	trajectory,
	visual,
	emitter,
	presets,
}

// Scrolling
menuScrollY = 0;
menuScrollYGoal = 0;
menuScrollYInc = 72;
menuHeight = 0;
menuScrollYMax = 0;

// Menu navigation
global.menuOpened = true;
global.currentPage = menuPages.home;
global.buttonList = ds_list_create();
createMenu(global.currentPage);