/*
v1.0
This script was created by [EVO] Dan, with help from [EVO] Curry, with snippets from the BIS module, this script creates a parachute and a box, then drops it. When it contacts the ground it will run VAS.

You will need VAS from Tonic in your mission if you want VAS to be activated with the box!

To use this, you also need to add the following to your server functions:
fnc_supplyBoxInit = {  _this addAction["<t color='#ff1111'>Gear Select</t>", "ASORGS\open.sqf"]; };
or else this will not work.

In the editor you can place this in a trigger with the following 'on activation' code:
0 = ["lz"] execVM "boxdroponmarker.sqf"
Where "lz" is the name of the marker you want to drop the crate on.
*/

if (sr_SDRunning) exitWith {["SUPPLY DROP ALREADY CALLED \nCHECK MAP FOR GPS LOCATION","hint",true] call BIS_fnc_MP;};

private ["_wpPos","_chuteType","_crateType","_smokeType","_demoType","_chute","_crate","_smoke","_delayStart","_delayEnd","_delayCountEnd","_sdTimeout","_aliveCrate","_demo","_chemType","_irType","_flareType","_chem","_ir","_flare","_smoke2","_flare2","_flare3","_flare4","_player","_playertype"];

_player = _this select 0;
_playertype = typeOf (vehicle player);

if(vehicle _player != player) exitWith {hint "You must be on foot to call support."};
sr_SDRunning = true;
publicVariable "sr_SDRunning";
player removeAction sdAction;
sr_sdActionAdded = false;
publicVariable "sr_sdActionAdded";
call fnc_SR_SD_crtMkr;
"sdMkr" setMarkerAlpha 0;
["SUPPLY DROP INBOUND \nETA 60 SECONDS \nNEXT DROP AVAILABLE IN: \nAPPROX 20 MINUTES","hint",true] call BIS_fnc_MP;

sleep 60;
"sdMkr" setMarkerAlpha 1;
["SUPPLY DROP DEPLOYED \nCHECK MAP FOR GPS LOCATION","hint",true] call BIS_fnc_MP;

_wpPos = getMarkerPos "sdMkr";
_chuteType = "B_Parachute_02_F";	//parachute for blufor, for opfor and greenfor replace the 'B' with 'O' or 'G' respectively
_crateType =  "Box_NATO_AmmoVeh_F";	//ammocrate class for blufor, feel free to change to whichever box you desire
_smokeType = "SmokeShellGreen";
_chemType = "Chemlight_green";
_irType = "B_IRStrobe";
_flareType = "F_20mm_Green";
_demoType = "ModuleExplosive_SatchelCharge_F";
_chute = createVehicle [_chuteType, [100, 100, 200], [], 0, 'FLY'];
_chute setPos [_wpPos select 0, _wpPos select 1, 250];
_crate = createVehicle [_crateType, position _chute, [], 0, 'NONE'];
_crate attachTo [_chute, [0, 0, -1.3]];
[_crate, 1] spawn fnc_SR_SD_trkMkr;
_smoke = createVehicle [_smokeType, position _crate, [], 0, "NONE"];
_smoke attachTo [_crate, [0,0,1]];
_chem = createVehicle [_chemType, position _crate, [], 0, 'NONE'];
_chem attachTo [_crate, [0,0.1,0.71]];
_ir = createVehicle [_irType, position _crate, [], 0, 'NONE'];
_ir attachTo [_crate, [0.1,0,0.71]];
_flare = createVehicle [_flareType, position _crate, [], 0, 'NONE'];
_flare attachTo [_crate, [0,0,1.2]];
sleep 11;
_flare3 = createVehicle [_flareType, position _crate, [], 0, 'NONE'];
_flare3 attachTo [_crate, [0,0,1.2]];
sleep 11;
_flare4 = createVehicle [_flareType, position _crate, [], 0, 'NONE'];
_flare4 attachTo [_crate, [0,0,1.2]];
sleep 20;
_smoke2 = createVehicle [_smokeType, position _crate, [], 0, 'NONE'];
_smoke2 attachTo [_crate, [0,0.5,1]];


waitUntil {position _crate select 2 < 0.5 || isNull _chute};
detach _crate;
deleteVehicle _chute;
_crate setPos [position _crate select 0, position _crate select 1, 0];
//"sdMkr" setMarkerPos [position _crate select 0, position _crate select 1];
[_crate, "fnc_supplyBoxInit"] spawn BIS_fnc_MP; //remove this if you don't want VAS on your box

_delayStart = 0;
_delayEnd = 600;
_delayCountEnd = false;
_sdTimeout = false;
_aliveCrate = true;
while {_aliveCrate} do {
	while {_delayStart < _delayEnd} do {
		_delayStart = _delayStart + 1;
		if (_delayStart == _delayEnd) exitWith {_delayCountEnd = true};
		if (!alive _crate) exitWith {
			_aliveCrate = false;
			["SUPPLY DROP DESTROYED!","hint",true] call BIS_fnc_MP;
			deleteVehicle _crate;
			deleteVehicle _chem;
			deleteVehicle _ir;
		};
		sleep 1;
	};
	if (_delayCountEnd) exitWith {_sdTimeout = true};
	if (!alive _crate) exitWith {_aliveCrate = false};
	sleep 1;
};


waitUntil {_sdTimeout || !alive _crate};
if (alive _crate) then {
	["SUPPLY DROP BEING SECURED \nDEMO IN 60 SECONDS \nCLEAR THE AREA","hint",true] call BIS_fnc_MP;
	sleep 60;
	_demo = createVehicle [_demoType, position _crate, [], 0, 'NONE'];
	_demo attachTo [_crate, [0,0,0]];
	sleep 1;
	_demo setDamage 1;
	_crate setDamage 1;
	sleep 2;
	deleteVehicle _crate;
	deleteVehicle _chem;
	deleteVehicle _ir;
};

sleep 1;
if (!alive _crate || isNull _crate) then {call fnc_SR_SD_delMkr};
sleep 300;

if ((!alive _crate || isNull _crate) && (_playertype in INS_W_PlayerJTAC)) then {
	player execVM "supplyDrop\addAction.sqf";
	["SUPPLY DROP NOW AVAILABLE \nCALL WHEN READY","hint",true] call BIS_fnc_MP;
};

sr_SDRunning = false;
publicVariable "sr_SDRunning";

