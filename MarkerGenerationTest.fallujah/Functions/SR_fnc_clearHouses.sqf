


SR_fnc_clearHouses = {
    private ["_house","_cleared","_houses","_gMkr"];

    _gMkr  = str(player call WP_fnc_GetGridPos);
	if (markerColor _gMkr == "ColorRed") then {
		_houses = [getPosATL player, 8, 3, false] call WP_fnc_FindHouses;
		if (count _houses > 0) then {
			_house = _houses select 0;
			_cleared = _house getVariable "cleared";
			if (isNil "_cleared") then {
				if (([getPosATL _house, 10, true, "count"] call SR_fnc_nearestEastMen) == 0) then {
					_house setVariable ["cleared", true];
				};
			};
		};
	};
};