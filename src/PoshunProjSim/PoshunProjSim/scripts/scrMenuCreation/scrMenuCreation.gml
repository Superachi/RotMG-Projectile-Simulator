// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createMenu(_page, _dsList){
	global.currentPage = _page;
	
	ds_list_clear(_dsList)
	instance_destroy(parMenuButton);
	
	var _x = room_width - 236;
	
	switch _page {
		case menuPages.home:
			createListMenuButton(_dsList, _x, 200, 64, 8, "Import sprite sheet",			importSprite);
			createListMenuButton(_dsList, _x, 200, 64, 8, "Import background",				importBackground);
			createListMenuButton(_dsList, _x, 200, 64, 8, "Trajectory (soonTM)",			-1);
			createListMenuButton(_dsList, _x, 200, 64, 8, "Visuals (soonTM)",				-1);
			createListMenuButton(_dsList, _x, 200, 64, 8, "Emitter (soonTM)",				-1);
			createListMenuButton(_dsList, _x, 200, 64, 8, "Bullet presets (soonTM)",		-1);
		break;
		case menuPages.action:
			createListMenuButton(_dsList, _x + 50, 100, 64, 8, "Back", menuPages.home);
		break;
		case menuPages.visual:
			createListMenuButton(_dsList, _x + 50, 100, 64, 8, "Back", menuPages.home);
		break;
	}
}