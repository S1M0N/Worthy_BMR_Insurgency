//JIPactions.sqf by Jigsor
// adds actions for server spawned intel to Join In Progress players.

waitUntil {!isNull player && player == player};

private ["_cachepos","_ioa"];

if (isNil "current_cache_pos") then {current_cache_pos = [];};
if (isNil "intel_objArray") then {intel_objArray = [];};

"intel_objArray" addPublicVariableEventHandler {call compile format ["%1",_this select 1]};
"current_cache_pos" addPublicVariableEventHandler {call compile format ["%1",_this select 1]};

waitUntil {sleep 0.5; count intel_objArray > 0};

_ioa = intel_objArray;

if (ObjNull in _ioa) then {{_ioa = _ioa - [objNull]} foreach _ioa;};

_cachepos = current_cache_pos;

{
	_id = _x addAction ["<t color='#ffff00'>Grab Intel</t>", "call JIG_intel_found", _cachepos, 6, true, true, "",""];
} foreach _ioa;

//if (local player) then {player execVM "scripts\acreSetRadioChans.sqf"};
//if (local player) then {player execVM "scripts\acrecrate.sqf"};

//if (true) exitWith {};