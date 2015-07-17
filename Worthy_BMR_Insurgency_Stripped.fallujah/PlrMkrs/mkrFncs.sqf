//Marker Functions - Runs the tracking process to all clints
//called by mkrInit.sqf

#include "mkrDef.sqf";

//West Marker Functions
SR_fnc_plrMkrs = {
	private ["_colour","_plr","_vcl","_mkrTextPlr"];

    {
		if !isNil _x then {
			_plr = call compile _x;
			if(isNull _plr) exitWith { _x setMarkerPosLocal mkrSpawnPos; _x setMarkerTextLocal ""; };
			_vcl = vehicle _plr;
			if (_vcl != _plr) exitWith { _x setMarkerPosLocal mkrSpawnPos; };
			_colour = "ColorBlue";
			_mkrTextPlr = name _plr;
			if (!alive _plr) then { _colour = "ColorBlack"; };
			//if (lifeState _plr == "UNCONSCIOUS") then { _colour = "ColorRed"; };
			if (_plr getvariable ["ACE_isUnconscious",true]) then { _colour = "ColorRed"; };
			_x setMarkerColorLocal _colour;
			//_x setMarkerTextLocal _mkrTextPlr;
			_x setMarkerPosLocal getPosATL _plr;
			_x setMarkerDirLocal getDir _plr;
		} else { _x setMarkerPosLocal mkrSpawnPos; _x setMarkerTextLocal ""; };
	} forEach westPlrs;
};

SR_fnc_vehMkrs = {
    private ["_mkr","_vcl","_crew","_type","_dist","_base","_mkrText"];

    {
		if !isNil _x then {
			_mkr = _x;
			_vcl = call compile _x;
			_mkr setMarkerPosLocal getPosATL _vcl;
			_mkr setMarkerTextLocal "";
			_base = getMarkerPos "baseMkrCntr";
			_dist = _vcl distance _base;
			_crew = crew _vcl;
			_type = typeOf _vcl;
			_mkrText = getText (configFile >> "cfgVehicles" >> _type >> "displayName");
			if (!alive _vcl) then {
				_mkr setMarkerColorLocal "ColorBlack";
				_mkr setMarkerTextLocal _mkrText;
			} else {
				if (count _crew == 0) then {
					_mkr setMarkerColorLocal "ColorYellow";
					if (_dist < 500) then {
						_mkr setMarkerTextLocal "";
					} else {
						_mkr setMarkerTextLocal _mkrText;
					};
				} else {
					_mkr setMarkerColorLocal "ColorBlue";
					_mkr setMarkerTextLocal _mkrText;
				};
			};
		};
	} forEach westVeh;
};