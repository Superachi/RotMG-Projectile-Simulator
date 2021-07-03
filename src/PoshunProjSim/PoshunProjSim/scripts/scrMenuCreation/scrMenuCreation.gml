// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createMenu(_page){
	with(objListMenu) {
		global.currentPage = _page;
		ds_list_clear(global.buttonList)
		instance_destroy(parMenuButton);
	
		var _structGeneric = new buttonBaseStruct(room_width - 236, 0, 200, 64, 8);
		var _structBack = new buttonBaseStruct(room_width - 186, 0, 100, 48, 8);
		var _structParam = new buttonBaseStruct(room_width - 236, 0, 200, 80, 8);
	
		switch _page {
			case menuPages.home:
				createListMenuButton(_structGeneric, "Import sprite sheet",		importSprite, -1);
				createListMenuButton(_structGeneric, "Import background",		importBackground, -1);
				createListMenuButton(_structGeneric, "Trajectory (soonTM)",		createMenu, [menuPages.trajectory]);
				createListMenuButton(_structGeneric, "Visuals (soonTM)",		createMenu, [menuPages.visual]);
				createListMenuButton(_structGeneric, "Emitter (soonTM)",		-1);
				createListMenuButton(_structGeneric, "Bullet presets (soonTM)",	-1);
			break;
			case menuPages.trajectory:
				createListMenuButton(_structBack, "Back", createMenu, [menuPages.home]);
				for (var i = 0; i < 30; i ++) {
					createParamSlider(_structParam, "Emitter (soonTM)",		-1);
				}
			break;
			case menuPages.visual:
				createListMenuButton(_structBack, "Back", createMenu, [menuPages.home]);
			break;
		}
	
		getListMenuHeight();
	}
}