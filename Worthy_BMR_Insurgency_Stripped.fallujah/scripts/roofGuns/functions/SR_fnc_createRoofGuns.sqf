

#include "rg_defines.sqf";


SR_fnc_createRoofGun = {
	private ["_class","_housePositions","_id","_housePosition","_classId","_gun","_house","_dir","_grp","_gCount","_ai"];
	_id		= _this select 0;
	_house	= _this select 1;
	_gCount = _this select 2;

	_housePositions = GUNROOFPOSITIONS select (_id+1);
	_housePosition  = (_housePositions select random (count _housePositions - 1)) select 0;
	_classId        = (_housePositions select random (count _housePositions - 1)) select 1;
	if (_classId <= 0.2) then { _class = stationaryGunsLow select random(count stationaryGunsLow - 1); };
	if (_classId > 0.2 && _classId < 0.5) then { _class = stationaryGunsMed select random(count stationaryGunsMed - 1); };
	if (_classId >= 0.5) then { _class = stationaryGunsHigh select random(count stationaryGunsHigh - 1); };
	_gun = createVehicle [_class, spawnPos, [], 0, "None"];
	for "_j" from 0 to 10 do { _gun addMagazine (magazines _gun select 0); };
	_gun setPosATL (_house buildingPos _housePosition);
	_dir = ((boundingCenter _house select 0) - (getPosATL _gun select 0)) atan2 ((boundingCenter _house select 1) - (getPosATL _gun select 1));
	_dir = (360 - _dir);
	//_dir = ((getPosATL startLocation select 0) - (getPosATL _gun select 0)) atan2 ((getPosATL startLocation select 1) - (getPosATL _gun select 1));
	_gun setDir _dir;
	_grp = ["static","Grp",str _gCount,"east"] call getGroup;
	_ai  = _grp createUnit [staticClass, spawnPos, [], 0, "NONE"];
	_ai assignAsGunner _gun;
	_ai moveInGunner _gun;
	_grp setFormDir _dir;
	if (DebugEnabled isEqualTo 1) then { [_house, _ai] call createDebugMarker; };
};