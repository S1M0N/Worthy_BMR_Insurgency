
#include "defines.sqf"

private ["_cachePos","_cacheHouse","_tempCache","_cid","_positions","_type","_nWestUnits","_cacheHouses","_n","_m","_cacheCount","_cacheAray","_gzPos","_gzRad","_cPosSelect","_cacheHousesCount","_cPosCnt","_index"];


_cacheCount = 9;
//_cacheHouses = [[4349,4636,0], AORADIUS, 6, true] call WP_fnc_FindHouses;
_gzPos = getMarkerPos "Marker_GameZone";
_gzRad = (getMarkerSize "Marker_GameZone") select 0;
_cacheHouses = [_gzPos,_gzRad,3] call WP_fnc_FindHouses;
_cacheHousesCount = (count _cacheHouses);
if (DEBUG) then {hint format["CachHouseCount %1",_cacheHousesCount];};
//_illHouse = typeOf vehicle in ILLEGALHOUSES;

for "_index" from 1 to cacheCount do {
	while { _cacheHousesCount > 1 } do {
		_cacheHouse	= _cacheHouses select floor(random(count _cacheHouses - 1));
		_nWestUnits	= nearestObjects[(getPosATL _cacheHouse), WestPlrCls+[cacheType], cacheRadius];
		if (count _nWestUnits == 0) exitWith {
		_positions = _cacheHouse call SR_fnc_bldPos;
		_cPosCnt = (count _positions);
		_cPosSelect = floor(random(_cPosCnt));
		if (DEBUG) then { server globalChat format["cPosSelect %1",_cPosSelect];};
		_cachePos = _cacheHouse buildingPos _cPosSelect;
	};
	};
	_tempCache = createVehicle [cacheType, _cachePos,[],1,"None"];
	if (DEBUG) then { server globalChat format["cache %1 spawning...", _index]; };
	_tempCache addEventHandler ["Killed",
	{
	// Kill Cache
	(_this select 0) spawn SR_fnc_cacheKill;
	//Remove from global array
	//GlobalCacheArray - [_this select 0];
	}];
	//Get Cache House
	/*
	while { _cacheHousesCount > 1 } do {
		_cacheHouse	= _cacheHouses select floor(random(count _cacheHouses - 1));
		_nWestUnits	= nearestObjects[(getPosATL _cacheHouse), WestPlrCls+[cacheType], cacheRadius];
		if (count _nWestUnits == 0) exitWith {
		_positions = _cacheHouse call SR_fnc_bldPos;
		_cPosCnt = (count _positions);
		_cPosSelect = floor(random(_cPosCnt));
		if (DEBUG) then {systemChat format["cPosSelect %1",_cPosSelect];};
		_cachePos = _cacheHouse buildingPos _cPosSelect;
		};
	};
	*/

	//Set Cache Position
	//_tempCache setPosATL _cachePos;

	//Cache House Damage
	_cacheHouse addEventHandler ["handleDamage", {
	_damage = _this select 2;
	_tempCache  = getPosATL (_this select 0) nearestObject cacheType;
	if (_damage > 0.9) then { _tempCache setDamage 1; };
	_damage
	}];
	if (DEBUG) then { [_tempCache, format["cache%1", _index]] spawn SR_fnc_dbgMkr; };

	//_tempCache setPos _cachePlacementPos;
	GlobalCacheArray pushBack _tempCache;
	publicVariable "GlobalCacheArray";

	// Any cache test can be done with if(_cacheToTest in GlobalCacheArray) then {};
};



/*
for "_i" from 1 to cacheCount do {
	if (DEBUG) then { systemChat format["cache %1 spawning...", _i]; };
	_cache = createVehicle [cacheType, spawnPos, [], 0, "None"];
	_cacheAray pushBack _i;
	{_cache setVehicleVarName format["Cache%1",_i];} forEach _cacheAray;
	_cacheNames pushBack (vehicleVarName _cache);
	cacheNames = _cacheNames;
	cacheAray = _cacheAray;

	_cache addEventHandler["Killed", { (_this select 0) spawn SR_fnc_cacheKill; }];
	while { _cacheHousesCount > 1 } do {
		_cacheHouse	= _cacheHouses select floor(random(count _cacheHouses - 1));
		_nWestUnits	= nearestObjects[(getPosATL _cacheHouse), WestPlrCls+[cacheType], cacheRadius];
		if (count _nWestUnits == 0) exitWith {
		_positions = _cacheHouse call SR_fnc_bldPos;
		_cPosCnt = (count _positions);
		_cPosSelect = floor(random(_cPosCnt));
		if (DEBUG) then {systemChat format["cPosSelect %1",_cPosSelect];};
		_cachePos = _cacheHouse buildingPos _cPosSelect;
		};
	//_cacheHousesCount = _cacheHousesCount - _cacheHouse;
	};

	_cache setPosATL _cachePos;
	_cacheHouse addEventHandler ["handleDamage", {
	_damage = _this select 2;
	_cache  = getPosATL (_this select 0) nearestObject cacheType;
	if (_damage > 0.9) then {	_cache setDamage 1;	};
		_damage
	}];
	if (DEBUG) then { [_cache, format["cache%1", _i]] call SR_fnc_dbgMkr; };
};

*/