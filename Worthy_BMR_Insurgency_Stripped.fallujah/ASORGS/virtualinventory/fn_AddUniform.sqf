#include "macro.sqf"
ASORGS_CurrentInventory set [GSVI_Uniform, (_this select 0) call ASORGS_fnc_GetClass];
ASORGS_WeightChanged = true;
ASORGS_UniformCapacityChanged = true;
