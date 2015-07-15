//Dynamic Group Marker System - By Simon Roth
//File: grpMkrInit.sqf
//Based off of F3's Group Marker System - Customized for Worthy Platoon
//
//
// F3 - Folk Group Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//
//
//called by player from init.sqf using following:
//[] spawn { player execVM "grpMkrs\grpMkrInit.sqf"; };
//
//



SR_fnc_GrpMkr = compileFinal preprocessFile "grpMkrs\functions\SR_fnc_GrpMkr.sqf";
SR_fnc_setGrpID = compileFinal preprocessFile "grpMkrs\functions\SR_fnc_setGrpID.sqf";


setGrpID = [] execVM "grpMkrs\SR_setGrpID.sqf";
setGrpMkrs = [] execVM "grpMkrs\SR_setGrpMkrs.sqf";