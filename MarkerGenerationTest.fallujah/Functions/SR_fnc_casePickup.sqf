

#include "defines.sqf"

private ["_case","_cases","_cache"];


if (block < 10) exitWith { block = block + 1; };
_cases = nearestObjects[getPosATL player, intelType, 3];
if (count _cases == 0) exitWith {};
_case = _cases select 0;
if isNull _case exitWith {};
block = 0;
deleteVehicle _case;
player sideChat format["%1 Retreived Intel! Check Map for location.", name player];
_cache = nearestObjects[getPosATL player, [cacheType], aoRadius] select 0;
if (isNil "_cache") exitWith { ["No caches found in your AO! /nKeep looking for intel!", "hint", true, true, true] call BIS_fnc_MP; };
_cache call SR_fnc_createIntel;

/*
[[[_cache],{(_this select 0) SR_fnc_createIntel;}],"BIS_fnc_call",true,true,true] call BIS_fnc_MP;
*/