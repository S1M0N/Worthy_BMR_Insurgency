#include "macro.sqf"
ASORGS_CurrentInventory set [GSVI_Vest, (_this select 0) call ASORGS_fnc_GetClass];
ASORGS_VestCapacityChanged = true;
ASORGS_WeightChanged = true;