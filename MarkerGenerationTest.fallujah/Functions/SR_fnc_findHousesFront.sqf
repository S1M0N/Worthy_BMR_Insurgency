
#define ILLEGALHOUSES		["land_nav_pier_c2_end", "Land_dum_olez_istan1", "Land_water_", "land_nav_pier_c", "Land_Nav_Boathouse_PierL", "Land_Nav_Boathouse_PierT", "Land_Nav_Boathouse_PierR", "Land_dum_olez_istan2", "Land_Shed_M03", "Land_dum_olez_istan2_maly", "Land_Shed_M01", "Land_hut06", "Land_Ind_SawMillPen", "land_nav_pier_c2", "Land_A_Crane_02a", "Land_vez", "Land_Ind_Expedice_1", "Land_Misc_Cargo1G", "Land_Ind_Stack_Big", "land_nav_pier_c_t15", "land_nav_pier_c_big", "Land_IndPipe2_big_18", "Land_Ind_Expedice_1", "Land_Ind_Expedice_3", "Land_IndPipe2_big_9","land_nav_pier_m_end", "land_nav_pier_m", "Land_Mil_hangar_EP1", "Land_Mil_ControlTower_EP1", "Land_Mil_Guardhouse_EP1", "Land_Mil_Repair_center_EP1","Land_Mil_Barracks_i_EP1","Land_A_Minaret_EP1","Land_Ind_Coltan_Main_EP1"]

#define EP1HOUSES			true

#define canSee(X,Y,Z) ([X,Y,Z] call SR_fnc_canSee)

SR_fnc_findHousesFront = {
	private ["_buildings","_minPositions","_enterables"];

	// find houses within a certain radius based on a position
	_buildings = nearestObjects [_this select 0, ["House"], _this select 1];
	// house should have _minPositions spawn points, 0 based
	_minPositions = (_this select 2) - 1;
	_enterables = [];
	{
		//checking if enough spawn positions are found in the house ([0,0,0] returned means illegal position),
		//if it's a house from OA (optional through mapping defines), is not listed in 'ILLEGALHOUSES', is not damaged and player can see it
		_arg1 = format["%1", _x buildingPos _minPositions] != "[0,0,0]";
		_arg2 = typeOf _x in ILLEGALHOUSES;
		_arg3 = damage _x == 0;
		//_arg4 = [player,_x,60] call SR_fnc_canSee;
		if (_arg1 && !_arg2 && _arg3) then {
			_enterables set [count _enterables, _x];
		};
	} forEach _buildings;
	missionNamespace setVariable ["enterableHouses", _enterables];
	_enterables
};

