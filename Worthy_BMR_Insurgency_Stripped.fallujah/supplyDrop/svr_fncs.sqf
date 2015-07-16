/*
Created by Simon Roth.

Simon's Supply Drop Package Script - svr_fncs.sqf
I took inspiration from[EVO] Dan & [EVO] Curry's script, however this script has been written from scratch.
This system utilizes several functions and supports JIP and respawning on persistant servers.
There are specific locations that you will need to have files placed in order for theis script package to function properly.
Failing to place the appropriate files/folders and commands in the appropriate locations will cause failure of this system.


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
	//_this addAction["<t color='#ff1111'>Gear Select</t>", "ASORGS\open.sqf"];
	_this addAction[("<t color='#ff1111'>") + ("Open Virtual Arsenal") + "</t>",{["Open",true] spawn BIS_fnc_arsenal;}];
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