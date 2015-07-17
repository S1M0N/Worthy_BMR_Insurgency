

#include "rg_defines.sqf";

SR_fnc_spawnAIGuns = {
	private ["_id","_gCount","_house","_buildingsArray","_gzPos","_gzRad"];
	_gzPos = getMarkerPos "Marker_GameZone";
	_gzRad = (getMarkerSize "Marker_GameZone") select 0;
	_buildingsArray = [_gzPos,_gzRad,3] call WP_fnc_FindHouses;
	_gCount	= 0;
	while{ _gCount < maxStaticGuns && count _buildingsArray > 0} do{
		_house = _buildingsArray select random(count _buildingsArray - 1);
		_id	   = GUNROOFPOSITIONS find (typeOf _house);
        if (_id != -1 && _house distance startLocation > 1000) then {
			if (count nearestObjects[getPosATL _house, eastStationaryGuns, 800] == 0) then {
				[_id, _house, _gCount] call SR_fnc_createRoofGuns;
				_gCount = _gCount + 1;
			};
		};
		_buildingsArray = _buildingsArray - [_house];
		};

	_gCount
};
