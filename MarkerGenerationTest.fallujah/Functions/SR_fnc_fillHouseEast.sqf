

#define eastInfClasses		["O_medic_F","O_officer_F","O_Soldier_AA_F","O_Soldier_AR_F","O_Soldier_AT_F","O_soldier_exp_F","O_Soldier_F","O_Soldier_GL_F","O_Soldier_LAT_F","O_soldier_M_F","O_soldier_repair_F","O_Soldier_SL_F","O_Soldier_TL_F","O_Soldier_A_F"]

#define findSquadAIName(X) ([X,1] call findSquadAIName)

#define exitCondition (findSquadAIName(player) == "" || !alive player)

#define nPos(X) ([X,0] call SR_fnc_countPositions)

SR_fnc_fillHouseEast = {
	private ["_x","_process","_arr","_inc","_pID","_pos","_bool","_unit","_name","_class","_ai","_nPos","_house","_cCount","_hID","_wCount","_i","_group","_skill"];
	scopeName "fillHouseEastMain";

	_house	 = _this select 0;
	_wCount  = _this select 1;
	_inc	 = _this select 2;

	// when this is true, setVehicleInit is processed (i.e. AI is created)
	_process	= false;
	// number of spawn positions in a house
	_nPos		= nPos(_house);
	// 0 based count of OPFOR infantry class members
	_cCount		= count eastInfClasses - 1;
	// random spawn position
	_x			= round random (_nPos-1);
	// checks if the house is a valid house for AI spawns (if not it's -1)
	_hID		= CACHEHOUSEPOSITIONS find (typeOf _house);
	_arr		= [];
	if (_hID != -1 && _wCount > 0) then {
		_arr = CACHEHOUSEPOSITIONS select (_hID + 1);
	};

	for [{ _i=_x},{ _i<((_nPos-1)+_x)},{ _i=_i+_inc}] do {
		if (count _arr == 0 && _wCount > 0 && _hID != -1) exitWith {};
		_pos   = _house buildingPos (_i % _nPos);
		if (count _arr > 0) then {
			_pID = (_arr select 0);
			_pos = _house buildingPos _pID;
			_arr = _arr - [(_arr select 1)] - [_pID];
		};
		// create an AI at _pos if no other "Man" in radus of 3 meters of _pos
		if (count nearestObjects[_pos, ["Man"], 3] == 0) then {
			_name  = findSquadAIName(player);
			if (_name == "") exitWith { breakTo "fillHouseEastMain"; };
			_bool  = !isNil _name;
			if _bool then { _bool = alive (call compile _name); };
			// when the AI unit (found by name) is alive, make sure it's healthy and, make it
			// "look-alive" by issuing a move command
			if _bool exitWith {
				_unit = call compile _name;
				_unit setPosATL _pos;
				_unit setDamage 0;
				[server,server,"loc",rSPAWN,_unit,{
					_this doMove getPosATL _this;
					sleep 1;
					doStop _this;
				}] call RE;
				if DEBUG then { server globalChat format["moving %1", _name]; };
			};
			// if there are no appropriate AI units around,  prepare for spawning them
			if DEBUG then { server globalChat format["spawning %1", _name]; };
			_class = eastInfClasses select (random _cCount);
			_group  = [player, "EastAIGrp", "", "east"] call getGroup; // create an AI group
			_ai    = _group createUnit [_class, spawnPos, [], 0, "NONE"];
			_ai setPosATL _pos;
			_skill = aiSkill / 10;
			call compile format['
				%1 = _ai;
				_ai setVehicleInit ''
					this setVehicleVarName ''''%1'''';
					%1 = this;
					doStop this;
					this addMagazine (%2 select (random (count %2 - 1)));
					this addMagazine (%2 select (random (count %2 - 1)));
					// Chance AI will have a nightvision device - Disabled in coop only!!!
					if (random 100 > 75 && eastRatio > 0) then {
						if !(this hasWeapon ''''NVGoggles'''') then { this addWeapon ''''NVGoggles''''; if DEBUG then { diag_log format [''''Adding NVG to %1'''', this]; }; };
					};
					this setSkill %3;
					this addEventHandler [''''killed'''', {
						missionNamespace setVariable [''''%1var'''', time];
						if (random 100 > 90 || DEBUG) then {
							_case = createVehicle [''''suitcase'''', %4, [], 0, ''''None''''];
							_case setPosATL getPosATL (_this select 0);
						};
					}];
				'';
			', _name, IEDList, _skill, spawnPos];
			_process = true;
		};
		sleep 0.1;
	};
	// spawns the AI prepared with 'setVehicleInit'
	if _process then { processInitCommands; };
};