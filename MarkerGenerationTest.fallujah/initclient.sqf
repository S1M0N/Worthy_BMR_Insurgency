

#define WestPlrCls ["B_Soldier_F"]
#define isWest (typeOf player in WestPlrCls)



if isWest then {
	[] spawn {
		_aiTimer = time;
		while { true } do {
			//AI
			call SR_fnc_aiSpawn;
			call SR_fnc_aiDespawn;
			if (time - _aiTimer > 30) then { _aiTimer = time; call SR_fnc_aiMonitor; };
			sleep 1;
			call SR_fnc_clearHouses;
		};
	};
};