

#include "defines.sqf"

private ["_pos","_dur","_count","_veh","_veh1","_veh2","_firePoint"];

_pos = getPosATL _this;
curTime	= time;
_dur = 10 + random 10;
{ deleteMarker _x; } forEach cacheMarkers(_this);
{
if (_this == _x) then {
	GlobalCacheArray = GlobalCacheArray - [_x];
};
} forEach GlobalCacheArray;
publicVariable "GlobalCacheArray";
deleteVehicle _this;
//_firePoint = createVehicle ["Land_HelipadEmpty_F", [(getPosATL _this select 0),(getPosATL _this select 1),0],[],1,"None"];

"Bo_GBU12_LGB_MI10" createVehicle _pos;
//[getPosATL _firePoint,"FIRE_BIG"] spawn SR_fnc_createFire;
while{ true }do{
	_veh = "Bo_Air_LGB" createVehicle _pos;
	_veh setVectorDirAndUp [[(random 1) -0.5,(random 1)-0.5,(random 1) -0.5],[0,(random -1.5),(random 1) -0.5]];
	_veh1 = "R_TBG32V_F" createVehicle _pos;
	_veh1 setVelocity [0, 0, 75];
	_veh1 setVectorDirAndUp [[(random 1) -0.5,(random 1)-0.5,(random 1) -0.5],[0,(random -1.5),(random 1) -0.5]];
	//_veh2 = "B_556x45_Ball_Tracer_Green" createVehicle _pos;
	//_veh2 setVelocity [0, 0, 20];
	//_veh2 setVectorDirAndUp [[(random 1) -0.5,(random 1)-0.5,(random 1) -0.5],[0,(random -1.5),(random 1) -0.5]];

	//if (random 100 > 70) then { "Cluster_120mm_AMOS" createVehicle _pos; };
	if ((time - curTime) > _dur) exitWith { "Bo_GBU12_LGB_MI10" createVehicle _pos; };
	sleep random 1;
};



//GlobalCacheArray - [_this];
sleep 1;
_count = count GlobalCacheArray;
hint parseText format["%1/%2 <t color='#80FF00'>ammo cache's</t> have been destroyed!", cacheCount - _count, cacheCount];
//[nil,nil,rHINT, parseText format["%1/%2 <t color='#80FF00'>ammo cache's</t> have been destroyed!", cacheCount - _count, cacheCount]] call RE;
if (_count == 0) then {
	["All ammo cache's have been destroyed!","hint",true,true,true] call BIS_fnc_MP;
	sleep 20;
	endMission "END1";
};



/*
while{ true }do{
	_veh = "Bo_Air_LGB" createVehicle _pos;
	_veh setVectorDirAndUp [[(random 1) -0.5,(random 1)-0.5,(random 1) -0.5],[0,(random -1.5),(random 1) -0.5]];//Jig adding
	//if (random 100 > 70) then { "Cluster_120mm_AMOS" createVehicle _pos; };
	if ((time - curTime) > _dur) exitWith { "Bo_Air_LGB" createVehicle _pos; };
	sleep random 1;
};

while{ true }do{
	"Bo_GBU12_LGB_MI10" createVehicle _pos;
	if (random 100 > 70) then { "Bo_GBU12_LGB_MI10" createVehicle _pos; };
	if ((time - curTime) > _dur) exitWith { "Bo_GBU12_LGB_MI10" createVehicle _pos; };
	sleep random 1;
};

R_TBG32V_F

*/
