
//execVM "Scripts\MarkerGenerator.sqf";
WP_fnc_FindHouses = compile preprocessFile "Scripts\MarkerGenerator\WP_fnc_FindHouses.sqf";
WP_fnc_GetGridPos = compile preprocessFile "Scripts\MarkerGenerator\WP_fnc_GetGridPos.sqf";

//Set Global Vars
missionNamespace setVariable ["MarkerGenComplete",false];

private ["_buildingsArray","_pos","_mkrName","_markerArray"];
_buildingsArray = [];
_markerArray = [];

private ["_gzPos","_gzRad"];
_gzPos = getMarkerPos "Marker_GameZone";
_gzRad = (getMarkerSize "Marker_GameZone") select 0;
_buildingsArray = [_gzPos,_gzRad,3] call WP_fnc_FindHouses;
{
	_pos = [position _x] call WP_fnc_GetGridPos;
	_mkr = str _pos;
	if (getMarkerPos _mkr select 0 == 0) then
	{
		_mkr = createMarker[_mkr, _pos];
		_mkr setMarkerShape "RECTANGLE";
		_mkr setMarkerType "SOLID";
		_mkr setMarkerSize [50,50];
		//_mkr setMarkerAlpha 0;
		//_mkr setMarkerColor "ColorRed";
		_markerArray set [count _markerArray, _mkr];
	};
} forEach _buildingsArray;
missionNamespace setVariable ["MarkerArray", _markerArray];

all_eos_mkrs = (missionNamespace getVariable "MarkerArray");publicVariable "all_eos_mkrs";

missionNamespace setVariable ["MarkerGenComplete",true];