#include "defines.sqf";

private ["_pUnitCount","_zID","_e"];
{
	//_wUnits = [_x,SPAWNRANGE + 100,true,"array"] call SR_fnc_nearestPlayers;
	_pUnitCount = 0;
	_pos = _x;
	{
		if (_x distance _pos < SPAWNRANGE + 50) then // Upgrade to distance2D in Arma 3 Version 1.50+
		{
			_pUnitCount = _pUnitCount + 1;
		};
	} forEach playableUnits;

	if (_pUnitCount < 1) then
	{
		// Despawn units in zone
		{
			_zID = (_x select 0);
			_e = [_zID,_pos] call bis_fnc_areEqual;
			if (_e) then
			{
				{
					deleteVehicle _x;
				} forEach units (_x select 1);
				ActiveGroups = ActiveGroups - [_x];
			};
		} forEach ActiveGroups;

		// Disable zone
		if (DEBUG) then { server globalChat format ["Deactiving Zone %1", _pos]; };
		ActiveZones = ActiveZones - [_x];
	};
} forEach ActiveZones;

publicVariable "ActiveGroups";
publicVariable "ActiveZones";