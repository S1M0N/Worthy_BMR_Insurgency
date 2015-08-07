



private ["_house","_cleared","_houses","_gMkr"];

//_gMkr  = str(player call WP_fnc_GetGridPos);
_gMkr = str(missionNamespace getVariable "MarkerArray");
if (markerColor _gMkr == "ColorRed") then {
	_houses = [getPosATL player, 8, 3, false] call WP_fnc_FindHouses;
	if (count _houses > 0) then {
		_house = _houses select 0;
		if (([getPosATL _house, 10, true, "count"] call SR_fnc_nearestEastMen) == 0) then {
			_gMkr setMarkerColor "ColorGreen";
		};
	};
};
