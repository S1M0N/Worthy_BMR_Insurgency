//Dynamic Group Marker System - By Simon Roth
//File: SR_setGrpID.sqf
//Based off of F3's Group Marker System - Customized for Worthy Platoon
//
//
// F3 - Folk Group Markers
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
//
//
//Called from grpMkrInit.sqf


_groups = [
["C1_A;","Cell 1 Alpha -"],
["C1_B","Cell 1 Bravo -"],
["C2_A","Cell 2 Alpha -"],
["C2_B","Cell 2 Bravo -"]
];


{_x call SR_fnc_setGrpID} forEach _groups;