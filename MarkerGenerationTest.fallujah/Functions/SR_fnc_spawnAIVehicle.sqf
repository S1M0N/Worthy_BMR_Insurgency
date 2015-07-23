
#define eastVehiclesFreq	["rhs_sprut_vdv","rhs_bmp1p_msv","rhs_brm1k_msv","rhs_bmp2_msv","rhs_bmp2e_msv","rhs_bmp2d_msv","rhs_bmp2k_msv","rhs_prp3_msv","rhs_bmd4_vdv","rhs_bmd4ma_vdv","rhs_t80u","rhs_t80bv","rhs_t80a","rhs_t72bc_tv","rhs_t72bb_tv","rhs_zsu234_aa"]
#define eastLightVehicles	["O_MRAP_02_gmg_F","O_MRAP_02_hmg_F"]
#define vclCrewClass		["rhs_msv_crew"]
#define eastRanks			["CAPTAIN","LIEUTENANT","SERGEANT","CORPORAL","PRIVATE"]

SR_fnc_spawnAIVehicle = {
	DEBUG = true;
	private ["_num","_track","_speed","_grp","_type","_obj","_mkr","_pos","_vcl","_ai","_unum"];
	_unum = 1;

	_num	= _unum % 3;
	if (_num == 0) then { _num = 3; };
	_grp	= ["","vclGrp",_unum+1,"east"] call getGroup;
	_type = eastVehiclesFreq select round(random (count eastVehiclesFreq - 1));
	_obj 	= call compile ("vclSpawn" + str(_num));
	_mkr 	= str _unum;
	_pos 	= getPosATL _obj;
	_vcl 	= createVehicle [_type, _pos, [], 0, "None"];
	if (DEBUG) then { server globalChat format["AI VEHICLE %1 of TYPE %2 CREATED! POSITION: %3", _unum, str _vcl, str _pos]; };
	_vcl setDir getDir _obj;
	_ai	  = _grp createUnit [vclCrewClass, _pos, [], 0, "None"];
	_ai setRank (eastRanks select 2);
	_ai moveInDriver _vcl;
	_ai	  = _grp createUnit [vclCrewClass, _pos, [], 0, "None"];
	_ai setRank (eastRanks select 3);
	_ai moveInGunner _vcl;
	if !(typeOf _vcl in eastLightVehicles) then {
		_vcl lockDriver true;
		_vcl lockTurret [[0], true];
	};
	_speed = "slow";
	_track = "";
	if (DEBUG) then { _track = "track"; };
	if (typeOf _vcl in eastLightVehicles) then { _speed = "noslow"; };
	[leader _grp, _mkr, _speed, "nowait", _track, "delete:", 200] execVM "AI\UPS.sqf";
};
