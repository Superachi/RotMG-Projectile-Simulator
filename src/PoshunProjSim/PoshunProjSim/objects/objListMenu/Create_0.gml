/// @desc
enum menuPages {
	home,
	emitterSelected,
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
menuTitle = "";

// Menu navigation
global.disableMouseScrolling = false;
global.menuOpened = true;
global.currentPage = menuPages.home;
global.buttonList = ds_list_create();
createMenu(global.currentPage);