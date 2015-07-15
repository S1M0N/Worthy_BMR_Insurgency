//Dynamic Group Marker System - By Simon Roth
//File: SR_setGrpMkr.sqf
//Based off of F3's Group Marker System - Customized for Worthy Platoon
//
//
// F3 - Folk Group Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//
//
//Called from grpMkrInit.sqf



if (!isDedicated && (isNull player)) then {
	waitUntil {sleep 0.1; !isNull player};
};



["C1_A", 1, "", "Default"] spawn SR_fnc_GrpMkr;
["C1_B", 1, "", "Default"] spawn SR_fnc_GrpMkr;
["C2_A", 1, "", "Default"] spawn SR_fnc_GrpMkr;
["C2_B", 1, "", "Default"] spawn SR_fnc_GrpMkr;

