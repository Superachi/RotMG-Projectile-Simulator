// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function createMenu(_page){
	with(objListMenu) {
		global.currentPage = _page;
		ds_list_clear(global.buttonList)
		instance_destroy(parMenuButton);
	
		var _structGeneric		= new buttonBaseStruct(room_width - 236, 0, 200, 56, 8);
		var _structBack			= new buttonBaseStruct(room_width - 186, 0, 100, 40, 8);
		var _structParam		= new buttonBaseStruct(room_width - 236, 0, 200, 80, 8);
		var _structSeperator	= new buttonBaseStruct(room_width - 232, 0, 192, 0, 12);
		menuTitle = "Undefined...";
		
		switch _page {
			case menuPages.home:
				menuTitle = "Home";
				createListMenuButton(_structGeneric, "Import background",		importBackground, -1);
				createSeperator(_structSeperator, "Add new bullet emitter (soonTM)");
			break;
			
			case menuPages.emitterSelected:
				menuTitle = "Editing emitter";
				createSeperator(_structSeperator, "Click emitter again to exit");
				createListMenuButton(_structGeneric, "Import background",		importBackground, -1);
				createListMenuButton(_structGeneric, "Import sprite sheet",		importSprite, -1);
				
				createSeperator(_structSeperator, "General");
				createListMenuButton(_structGeneric, "Bullet trajectory",		createMenu, [menuPages.trajectory]);
				createListMenuButton(_structGeneric, "Bullet visuals",			createMenu, [menuPages.visual]);
				createListMenuButton(_structGeneric, "Firing behaviour",	createMenu, [menuPages.emitter]);
				// createListMenuButton(_structGeneric, "Movement (soonTM)",	-1);
				
				createSeperator(_structSeperator, "Duplicate/remove emitter (soonTM)");
				// createListMenuButton(_structBack, "Duplicate", -1);
				// createListMenuButton(_structBack, "Remove", -1);
				createSeperator(_structSeperator, "Export settings as text/XML?? (soonTM)");
			break;
			
			case menuPages.trajectory:
				menuTitle = "Bullet trajectory";
				createListMenuButton(_structBack, "Back", createMenu, [menuPages.emitterSelected]);
				createParamSlider(_structParam, ParamTypes.projLifetime);
				createParamSlider(_structParam, ParamTypes.projSpeed);
				createParamBool(_structGeneric, ParamTypes.boomerang);
				
				createSeperator(_structSeperator, "Acceleration settings");
				createParamSlider(_structParam, ParamTypes.accelDelay);
				createParamSlider(_structParam, ParamTypes.accelTime);
				createParamSlider(_structParam, ParamTypes.accelGoal);
				
				createSeperator(_structSeperator, "Turning settings");
				createParamSlider(_structParam, ParamTypes.turnDelay);
				createParamSlider(_structParam, ParamTypes.turnRate);
			break;
			
			case menuPages.visual:
				menuTitle = "Bullet visuals";
				createListMenuButton(_structBack, "Back", createMenu, [menuPages.emitterSelected]);
				createParamSlider(_structParam, ParamTypes.animDelay);
				createParamSlider(_structParam, ParamTypes.animRotate);
				createParamBool(_structGeneric, ParamTypes.faceDiag);
				createParamBool(_structGeneric, ParamTypes.stopOnLastFrame);
			break;
			
			case menuPages.emitter:
				menuTitle = "Firing behaviour";
				createListMenuButton(_structBack, "Back", createMenu, [menuPages.emitterSelected]);
				createParamSlider(_structParam, ParamTypes.emitCooldown);
				createParamSlider(_structParam, ParamTypes.emitAmount);
				createParamSlider(_structParam, ParamTypes.emitArc);
			break;
		}
	
		getListMenuHeight();
	}
}