//random_objectives.sqf by Jigsor
//Randomly selects and generates objectives one at a time.

if (!isserver) exitwith {};
waitUntil{!(isNil "BIS_fnc_init")};
waitUntil {time > 60};

private ["_newZone","_mission_mkr","_mkr_position","_jig_mission_xcoor","_jig_mission_ycoor","_type","_objsel","_curtasks","_ins_debug"];

_newZone = [];
_mission_mkr = [];
_mission_mkr = side_mission_mkrs select floor (random (count side_mission_mkrs));
_mkr_position = getMarkerPos _mission_mkr;
_jig_mission_xcoor = (getMarkerPos _mission_mkr select 0);
_jig_mission_ycoor = (getMarkerPos _mission_mkr select 1);
if (DebugEnabled > 0) then {_ins_debug = true;}else{_ins_debug = false;};

if (_ins_debug) then {diag_log text format ["Mission Pos : %1", _mkr_position];};

{
	if (_mkr_position distance (getmarkerpos _x) == 0) then
	{
		side_mission_mkrs = side_mission_mkrs - [_x];
	};
} foreach side_mission_mkrs;
publicVariable "side_mission_mkrs";
sleep 2;

_newZone = _newZone + [_jig_mission_xcoor,_jig_mission_ycoor] call miss_object_pos_fnc;
if (_newZone isEqualTo []) then
{
	private ["_count"];
	_count = 0;
	while {_newZone isEqualTo []} do
	{
		_newZone = _newZone + [_jig_mission_xcoor,_jig_mission_ycoor] call miss_object_pos_fnc;
		if (!(_newZone isEqualTo [])) exitWith {_newZone;};
		_count = _count + 1;
		if (_count > 4) exitWith {};
		sleep 4;
	};
};

if ((_ins_debug) and (_newZone isEqualTo [])) exitWith {
	diag_log text format [""];
	diag_log text format ["Objective position invalid"];
	diag_log text format [""];
};

// select random objective from list
if (objective_list isEqualTo []) exitWith {finish = true; publicvariable "finish";};
_objsel = objective_list call BIS_fnc_selectRandom;

// uncomment the following lines one at a time to test individual missions
//_objsel = objective_list select 0;// test "comms_tower"
//_objsel = objective_list select 1;// test "kill_leader"
//_objsel = objective_list select 2;// test "rescue_pilot"
//_objsel = objective_list select 3;// test "cut_power"
//_objsel = objective_list select 4;// test "mine_field"
//_objsel = objective_list select 5;// test "deliver_supplies"
//_objsel = objective_list select 6;// test "destroy_convoy"
//_objsel = objective_list select 7;// test "destroy_armed_convoy"
//_objsel = objective_list select 8;// test "destroy_mortar_squad"
//_objsel = objective_list select 9;// test "c_n_h"

objective_list = objective_list - [_objsel];
publicVariable "objective_list";
sleep 3;

switch (_objsel) do
{
	case "comms_tower":
	{
	_type = objective_objs select 0; [_newZone,_type] execVM "Objectives\comms_tower.sqf";
	};
	case "kill_leader":
	{
	_type = objective_objs select 1; [_newZone,_type] execVM "Objectives\eliminate_leader.sqf";
	};
	case "rescue_pilot":
	{
	_type = objective_objs select 2; [_newZone,_type] execVM "Objectives\pilot_rescue.sqf";
	};
	case "cut_power":
	{
	_type = objective_objs select 3; [_newZone,_type] execVM "Objectives\tower_of_power.sqf";
	};
	case "mine_field":
	{
	_type = objective_objs select 4; [_newZone,_type] execVM "Objectives\mine_field.sqf";
	};
	/*
	case "deliver_supplies":
	{
	_type = objective_objs select 5; [_newZone,_type] execVM "Objectives\delivery.sqf";
	};
	*/
	case "destroy_convoy":
	{
	_type = objective_objs select 5; [_newZone,_type] execVM "Objectives\sup_convoy.sqf";
	};
	case "destroy_armed_convoy":
	{
	_type = objective_objs select 6; [_newZone,_type] execVM "Objectives\armed_convoy.sqf";
	};
	case "destroy_mortar_squad":
	{
	_type = objective_objs select 7; [_newZone,_type] execVM "Objectives\mortar_squad.sqf";
	};
	case "c_n_h":
	{
	_type = objective_objs select 8; [_newZone,_type] execVM "Objectives\capture_n_hold.sqf";
	};
};

if (true) exitWith {};