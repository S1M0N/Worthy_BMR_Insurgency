#include "macro.sqf"
_input = _this;
if(isNil '_this') exitWith { "" };
_ret = "";
if((typeName _this) == "STRING") exitWith { _this };
if((typeName _this) == "ARRAY") exitWith { [_this, DBF_Class, "", [""]] call BIS_fnc_Param; };
_ret

