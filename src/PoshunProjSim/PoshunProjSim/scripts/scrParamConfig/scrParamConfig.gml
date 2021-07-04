enum ParamTypes {
	// Bullet behaviour
	projLifetime,
	projSpeed,
	projDir,
	boomerang,
	
	accelDelay,
	accelTime,
	accelGoal,
	
	turnDelay,
	turnRate,
	
	// Bullet visuals
	animDelay,
	animRotate,
	faceDiag,
	stopOnLastFrame,
	
	// Emitter settings
	emitCooldown,
	emitArc,
	emitAmount
}

function ParamStruct(_min, _max, _default, _name, _unit, _rounding) constructor {
	paramMin		= _min;
	paramMax		= _max;
	paramDefault	= _default;
	paramName		= _name;
	
	// Determine what unit to display the parameter value as
	paramUnit		= _unit;
	// Determine whether the parameter should get rounded to a full int
	paramRounding	= _rounding;
}

// Get an emitter's parameter setting
function getEmitterParam(_paramType) {
	var _emitter = global.selectedEmitter;
	var _action = global.selectedEmitter.actionStruct;
	var _visual = global.selectedEmitter.visualStruct;
	var _val = 0;
	switch _paramType {
		// Bullet behaviour
		case ParamTypes.projLifetime:		_val = _action.lifeTime;		break;
		case ParamTypes.projSpeed:			_val = _action.projSpeed;		break;
		case ParamTypes.boomerang:			_val = _action.boomerang;		break;
		
		case ParamTypes.accelDelay:			_val = _action.accelDelay;		break;
		case ParamTypes.accelTime:			_val = _action.accelTime;		break;
		case ParamTypes.accelGoal:			_val = _action.accelGoal;		break;
		
		case ParamTypes.turnDelay:			_val = _action.turnDelay;		break;
		case ParamTypes.turnRate:			_val = _action.turnRate;		break;
		
		// Bullet visuals
		case ParamTypes.animDelay:			_val = _visual.animDelay;		break;
		case ParamTypes.animRotate:			_val = _visual.animRotate;		break;
		case ParamTypes.faceDiag:			_val = _visual.faceDiag;		break;
		case ParamTypes.stopOnLastFrame:	_val = _visual.stopOnLastFrame; break;
		
		// Emitter settings
		case ParamTypes.emitCooldown:		_val = _emitter.emitCooldown;	break;
		case ParamTypes.emitArc:			_val = _emitter.emitArc;		break;
		case ParamTypes.emitAmount:			_val = _emitter.emitAmount;	break;
	}
	
	return _val;
}

// Save a parameter setting into the emitter object
function setEmitterParam(_paramType, _val) {
	switch _paramType {
		// Bullet behaviour
		case ParamTypes.projLifetime:	global.selectedEmitter.actionStruct.lifeTime	= _val; break;
		case ParamTypes.projSpeed:		global.selectedEmitter.actionStruct.projSpeed	= _val; break;
		case ParamTypes.boomerang:		global.selectedEmitter.actionStruct.boomerang	= _val;	break;
		
		case ParamTypes.accelDelay:		global.selectedEmitter.actionStruct.accelDelay	= _val; break;
		case ParamTypes.accelTime:		global.selectedEmitter.actionStruct.accelTime	= _val; break;
		case ParamTypes.accelGoal:		global.selectedEmitter.actionStruct.accelGoal	= _val; break;
		
		case ParamTypes.turnDelay:		global.selectedEmitter.actionStruct.turnDelay	= _val; break;
		case ParamTypes.turnRate:		global.selectedEmitter.actionStruct.turnRate	= _val; break;
		
		// Bullet visuals
		case ParamTypes.animDelay:		global.selectedEmitter.visualStruct.animDelay	= _val;	break;
		case ParamTypes.animRotate:		global.selectedEmitter.visualStruct.animRotate	= _val; break;
		case ParamTypes.faceDiag:		global.selectedEmitter.visualStruct.faceDiag	= _val; break;
		case ParamTypes.stopOnLastFrame: global.selectedEmitter.visualStruct.stopOnLastFrame = _val; break;
		
		// Emitter settings
		case ParamTypes.emitCooldown:		global.selectedEmitter.emitCooldown = _val;	break;
		case ParamTypes.emitArc:			global.selectedEmitter.emitArc		= _val;	break;
		case ParamTypes.emitAmount:			global.selectedEmitter.emitAmount	= _val;	break;
	}
}

function getParamDefaults(_paramType) {
	var _struct;
	switch _paramType {
		// Bullet behaviour
		case ParamTypes.projLifetime:
			_struct = new ParamStruct(1, 600, 60, "Lifetime", "frame(s)", true);
		break;
		case ParamTypes.projSpeed:
			_struct = new ParamStruct(0, 20, 5, "Speed", "px. per frame", true);
		break;
		case ParamTypes.boomerang:
			_struct = new ParamStruct(0, 1, 0, "Boomerang", "boolean", true);
		break;
		
		case ParamTypes.accelDelay:
			_struct = new ParamStruct(1, 300, 300, "Accel. Delay", "frame(s)", true);
		break;
		case ParamTypes.accelTime:
			_struct = new ParamStruct(1, 300, 60, "Accel. Time", "frame(s)", true);
		break;
		case ParamTypes.accelGoal:
			_struct = new ParamStruct(-20, 20, 0, "Accel. Speed", "px. per frame", true);
		break;
		
		case ParamTypes.turnDelay:
			_struct = new ParamStruct(0, 300, 0, "Turning delay", "frame(s)", true);
		break;
		case ParamTypes.turnRate:
			_struct = new ParamStruct(-36, 36, 0, "Turning rate", "degree(s)", true);
		break;
		
		// Bullet visuals
		case ParamTypes.animDelay:
			_struct = new ParamStruct(1, 60, 5, "Animation speed", "", true);
		break;
		case ParamTypes.animRotate:
			_struct = new ParamStruct(-36, 36, 0, "Rotation", "degrees", true);
		break;
		case ParamTypes.faceDiag:
			_struct = new ParamStruct(0, 1, 0, "Face diagonally", "boolean", true);
		break;
		case ParamTypes.stopOnLastFrame:
			_struct = new ParamStruct(0, 1, 0, "Freeze on last frame", "boolean", true);
		break;
		
		// Emitter settings
		case ParamTypes.emitCooldown:
			_struct = new ParamStruct(3, 120, 12, "Attack cooldown", "frames", true);
		break;
		case ParamTypes.emitArc:
			_struct = new ParamStruct(1, 180, 5, "Shotgun arc", "degrees", true);
		break;
		case ParamTypes.emitAmount:
			_struct = new ParamStruct(1, 30, 1, "Bullet amount", "bullets", true);
		break;
		
		default:
			show_error("Error: parameter type " + string(_paramType) + " was not defined!", true);
		break;
	}
	
	return _struct;
}