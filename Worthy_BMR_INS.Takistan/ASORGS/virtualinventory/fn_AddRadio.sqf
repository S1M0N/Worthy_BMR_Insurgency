#include "macro.sqf"
private ["_item", "_class", "_oldradio", "_olduniqueradio", "_items"];
_item = _this select 0;
_class = _item call ASORGS_fnc_GetClass;
_olduniqueradio = call ASORGS_fnc_GetRadio;
_oldradio = [_olduniqueradio] call ASORGS_fnc_GetRadioClass;
if(_oldradio == ([_class] call ASORGS_fnc_GetRadioClass)) exitWith { format["Radio not switched. %1 doesn't need to replace %2 (a %3).", _class, _olduniqueradio, _oldradio] spawn ASORGS_fnc_Log; };
call ASORGS_fnc_RemoveRadio;
if(_class == "") exitWith { ASORGS_WeightChanged = true;};
_items = (ASORGS_CurrentInventory select GSVI_Items) + [_class];
ASORGS_CurrentInventory set [GSVI_Items, _items];
ASORGS_WeightChanged = true;