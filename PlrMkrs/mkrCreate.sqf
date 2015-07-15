//Marker creation - createse markers for tracking.
//called by mkrInit.sqf.

#include "mkrDef.sqf";

private ["_mkr"];

if (isWest) then {
	{
		_mkr = createMarkerLocal[_x, mkrSpawnPos];
		_mkr setMarkerTypeLocal "mil_triangle";
		_mkr setMarkerSizeLocal [0.4,0.6];
	} forEach westPlrs;
	{
		_mkr = createMarkerLocal[_x, mkrSpawnPos];
		_mkr setMarkerTypeLocal "b_air";
		_mkr setmarkerSizeLocal [0.6,0.6];
	} forEach westAirVeh;
	{
		_mkr = createMarkerLocal[_x, mkrSpawnPos];
		_mkr setMarkerTypeLocal "b_mech_inf";
		_mkr setmarkerSizeLocal [0.6,0.6];
	} forEach westMechVeh;
	{
		_mkr = createMarkerLocal[_x, mkrSpawnPos];
		_mkr setMarkerTypeLocal "b_motor_inf";
		_mkr setmarkerSizeLocal [0.6,0.6];
	} forEach westGrndVeh;
};