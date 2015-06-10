/*
Created by Simon Roth
Supply Drop Functions
This file needs to be called in the init.sqf as:

if (isServer) then {
	call compile preprocessFileLineNumbers "functions\svr_fncs.sqf";
};

if you already have a sever functions file, just add these to the end of it.

*/
#include "defines.sqf";


fnc_SR_SD_plrAddAction = {

	private ["_unitType","_sdAction"];

	_unitType = typeOf (vehicle player);

	if (_unitType in jtacClasses) then {
		player execVM "supplyDrop\addAction.sqf";
	};
};

fnc_SR_SD_crtMkr = {

	private ["_unit","_unitPos","_unitXPos","_unitYPos","_unitZPos","_distX","_distY","_ranX","_ranY","_ranPos","_dropMkr"];

	_unit = _this select 0;
	_unitPos = getPos _unit;
	_unitXPos = _unitPos select 0;
	_unitYPos = _unitPos select 1;
	_unitZPos = _unitPos select 2;

	_disX = [50,200] call BIS_fnc_randomInt;
	_disY = [50,200] call BIS_fnc_randomInt;
	_ranX = random (_disX*2)-_disX;
	_ranY = random (_disY*2)-_disY;

	_rndPos = [(_unitXPos) + _ranX, (_unitYPos) + _ranY];
	//hint str _rndPos;
	_dropMkr = createMarker ["sdMkr", _rndPos];
	_dropMkr setMarkerType "b_support";
	_dropMkr setMarkerSize [0.5,0.5];
	_dropMkr setMarkerColor "ColorOrange";
	_dropMkr setMarkerText "Supply Drop";
};

fnc_SR_SD_delMkr = {
	deleteMarker "sdMkr";
};

fnc_supplyBoxInit = {
	_this addAction["<t color='#ff1111'>Gear Select</t>", "ASORGS\open.sqf"];
};

fnc_SR_SD_trkMkr = {

	_object = _this select 0;
	_time = _this select 1;

	if (alive _object) then {
		while {alive _object} do {
			"sdMkr" setMarkerPos [position _object select 0, position _object select 1];
			if (!alive _object) exitWith {};
			sleep 1;
		};
	};
};