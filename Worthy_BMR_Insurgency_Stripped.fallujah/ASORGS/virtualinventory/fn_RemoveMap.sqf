#include "macro.sqf"
private["_map", "_items"];
_map = call ASORGS_fnc_GetMap;
_items = (ASORGS_CurrentInventory select GSVI_Items) - [_map];
ASORGS_CurrentInventory set [GSVI_Items, _items];
ASORGS_WeightChanged = true;