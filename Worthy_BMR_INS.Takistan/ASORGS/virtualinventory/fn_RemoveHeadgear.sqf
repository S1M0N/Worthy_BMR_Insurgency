#include "macro.sqf"
private ["_headgear", "_items"];
_headgear = call ASORGS_fnc_GetHeadgear;
_items = (ASORGS_CurrentInventory select GSVI_Items) - [_headgear];
ASORGS_CurrentInventory set [GSVI_Items, _items];
ASORGS_WeightChanged = true;