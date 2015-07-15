//Dynamic Group Marker System - By Simon Roth
//File: SR_fnc_setGrpID.sqf
//Based off of F3's Group Marker System - Customized for Worthy Platoon
//
//
// F3 - Folk Group Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//
//
//Preprocessed from grpMkrInit.sqf



private ["_grp","_name"];


if(!isnil (_this select 0)) then {
	_grp = call compile format ["%1",_this select 0];
	_name = _this select 1;
	_grp setGroupId [format ["%1",_name],"GroupColor0"];
};