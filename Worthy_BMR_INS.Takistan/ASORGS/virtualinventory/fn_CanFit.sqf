#include "macro.sqf"
_item = _this;
_item = _this call ASORGS_fnc_GetClass;
if(((_item call ASORGS_fnc_GetItemMass) + ASORGS_Weight) > ASORGS_MaxMass) exitWith {false;};
(_item call ASORGS_fnc_CanFitBackpack) || (_item call ASORGS_fnc_CanFitUniform) || (_item call ASORGS_fnc_CanFitVest)