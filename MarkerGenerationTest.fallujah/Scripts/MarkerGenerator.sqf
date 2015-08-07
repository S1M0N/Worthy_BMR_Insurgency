
//Input Circle Marker [Marker] execVM "Scripts\MarkerGenerator.sqf";

//Set Global Vars
MarkerGenComplete = false;

private ["_buildingsArray","_pos","_mkrName"];
_buildingsArray = [];
markerArray = [];

private ["_gzPos","_gzRad"];
_gzPos = getMarkerPos "Marker_GameZone";
_gzRad = (getMarkerSize "Marker_GameZone") select 0;
_buildingsArray = [_gzPos,_gzRad,3] call WP_fnc_FindHouses;
{
	_pos = [position _x] call WP_fnc_GetGridPos;
	_mkr = str _pos;
	if (getMarkerPos _mkr select 0 == 0) then
	{
		_mkr = createMarkerLocal[_mkr, _pos];
		_mkr setMarkerShapeLocal "RECTANGLE";
		_mkr setMarkerTypeLocal "SOLID";
		_mkr setMarkerSizeLocal [50,50];
		_mkr setMarkerAlphaLocal 0.3;
		_mkr setMarkerColor "ColorRed";
		markerArray set [count markerArray, _x];
	};
} forEach _buildingsArray;
publicVariable "markerArray";
MarkerGenComplete = true;