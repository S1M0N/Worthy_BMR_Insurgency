// init_player.sqf by Jigsor

if (isNil "oamarker") then {oamarker = [];};//air patrole center marker
"oamarker" addPublicVariableEventHandler {call compile format ["%1",_this select 1]};

if (DebugEnabled > 0) then {
	waitUntil {!isNull player && player == player};

	if (isNil "spawnaire") then {spawnaire = [];};
	if (isNil "spawnairw") then {spawnairw = [];};
	if (isNil "cyclewpmrk") then {cyclewpmrk = [];};

	"spawnaire" addPublicVariableEventHandler {call compile format ["%1",_this select 1]};
	"spawnairw" addPublicVariableEventHandler {call compile format ["%1",_this select 1]};
	"cyclewpmrk" addPublicVariableEventHandler {call compile format ["%1",_this select 1]};

	[] spawn {
		waitUntil {time > 3};
		if (local player) then {
			player allowDamage false;
			//player addAction["<t color='#ff1111'>Virtual Ammobox</t>", "VAS\open.sqf"];
			player addAction[("<t color='#ff1111'>") + ("Open Virtual Arsenal") + "</t>",{["Open",true] call BIS_fnc_arsenal;}];
			[] spawn {sleep 4; setTerrainGrid 50; onMapSingleClick "vehicle player setpos [_pos select 0,_pos select 1,0]";};
		};
	};

	if (tky_perfmon > 0) then {_nul1 = [tky_perfmon] execVM "scripts\tky_evo_performance_report.sqf";};
	{_x setmarkeralphalocal 1;} foreach Op4_mkrs;
	{_x setmarkeralphalocal 1;} foreach Blu4_mkrs;
};

[] spawn {
	waitUntil {!isNull player && player == player};

	// Player Variables	//
	player setVariable ["BIS_noCoreConversations", true];
	enableSentences false;
	setTerrainGrid 25;
	gc_display_heading_script_running = false;
	status_hud_running = false;
	//enableCamShake false;
	//if (local player) then {player setVariable ["BIS_enableRandomization", false]};// Disables randomization of gear
	if (Remove_grass_opt isEqualTo 1) then {tawvd_disablenone = true;};// Disables the grass Option 'None' button in Taw View Distance UI
	if (Fatigue_ability isEqualTo 0) then {if (local Player) then {player enableFatigue false;};}else{if (Fatigue_ability isEqualTo 2) then {[] execVM 'scripts\QS_Fatigue.sqf';};};
	if (!isJIP) then {intel_objArray = [];};
	private "_playertype";
	_playertype = typeOf (vehicle player);
	if (_playertype in INS_W_PlayerUAVop) then {[player,"UGV"] call BIS_fnc_addCommMenuItem; player setVariable ["ghst_ugvsup", 0];};
	if (_playertype in INS_W_PlayerEOD) then {null = [] execVM "scripts\minedetector.sqf";};
	//if (local player) then {player execVM "scripts\acreSetRadioChans.sqf"};
	//if (local player) then {player execVM "scripts\acrecrate.sqf"};

	// Player actions //
	[] spawn JIG_p_actions_resp;

	// INS Flag Pole
	INS_flag addAction["<t color='#ff9900'>HALO jump</t>", "ATM_airdrop\atm_airdrop.sqf"];
	INS_flag addAction["<t color='#12F905'>Airfield</t>", "call JIG_transfer_fnc", ["Airfield"]];

	// ASORGS
	MHQ_1 addAction["<t color='#ff1111'>Gear Select</t>", "execvm 'ASORGS\open.sqf'"];
	MHQ_2 addAction["<t color='#ff1111'>Gear Select</t>", "execvm 'ASORGS\open.sqf'"];
	MHQ_3 addAction["<t color='#ff1111'>Gear Select</t>", "execvm 'ASORGS\open.sqf'"];

	INS_Wep_box addAction["<t color='#ff1111'>Gear Select</t>", "ASORGS\open.sqf"];

	// Op4 MHQ
	Opfor_MHQ addAction[("<t color=""#12F905"">") + ("Deploy MHQ") + "</t>","scripts\deployOpforMHQ.sqf",nil,1, false, true, "", "side _this != INS_Blu_side"];

	// AI recruitment
	if (max_ai_recruits > 1) then {INS_Wep_box addAction["<t color='#1d78ed'>Recruit Infantry</t>", "bon_recruit_units\open_dialog.sqf", [], 0];};
	Jig_m_obj addAction[("<t color='#12F905'>") + ("Maintenance vehicle") + "</t>",{[] spawn INS_maintenance_veh;},nil, 8, true, true, "", "count (nearestObjects [position player, [""LandVehicle"",""Air""], 10]) > 0"];
	Jig_m_obj addAction[("<t color='#12F905'>") + ("Repair wreck") + "</t>",{[] spawn BTC_repair_wreck;},nil, 8, true, true, "", "count (nearestObjects [position player, [""LandVehicle"",""Air""], 10]) > 0"];

	// Player event handlers //
	[] spawn {waitUntil {!isNull (findDisplay 46)}; (findDisplay 46) displayAddEventHandler ["KeyDown", "_this call DH_fnc_keyPresses"];};
	//player addEventHandler ["killed", {_nul = _this call killedInfo_fnc}];
	player addEventHandler ["Respawn", {[] spawn JIG_p_actions_resp;}];
	If (side player == east) then
	{
		player addEventHandler ["killed", {handle = [_this select 0] execVM "scripts\MoveOp4Base.sqf";}];
		player addEventHandler ["Respawn", {[player,loadout] spawn setLoadout;}];
	};
	if (!isServer) then
	{
		"PVEH_netSay3D" addPublicVariableEventHandler {private "_array"; _array = _this select 1; (_array select 0) say3D (_array select 1);};
	};

	// Routines //
	// Intro and side settings
	if (DebugEnabled isEqualTo 0) then {
		If (side player == east) then
		{
			getLoadout = compile preprocessFileLineNumbers 'scripts\get_loadout.sqf';
			setLoadout = compile preprocessFileLineNumbers 'scripts\set_loadout.sqf';
			{_x setmarkeralphalocal 1;} foreach Op4_mkrs;
			{_x setmarkeralphalocal 0;} foreach Blu4_mkrs;
			[] spawn INS_intro_op4;
			[] spawn {sleep 10; [player] call Op4_spawn_pos;};
			[] spawn {
				loadout_handler = [player] execVM "scripts\DefLoadoutOp4.sqf";
				waitUntil { scriptDone loadout_handler };
				loadout = [player] call getLoadout;
			};
		};
		If (side player == west) then
		{
			{_x setmarkeralphalocal 1;} foreach Blu4_mkrs;
			{_x setmarkeralphalocal 0;} foreach Op4_mkrs;
			//[] spawn INS_intro;
		};
	};

	// 3rd Person PoV to vehicles only
	if (limitPOV isEqualTo 1) then {
		[player] spawn PVPscene_POV;
		player addEventHandler ["Respawn", {[(_this select 0)] spawn PVPscene_POV;}];
	};

	// Ambient Radio Chatter in/near Vehicles (TPW code)
	if (ambRadioChatter isEqualTo 1) then {
		[] spawn {
		while {true} do	{
			private ["_sound","_veh"];
			if (player != vehicle player) then {
				playmusic format ["RadioAmbient%1",floor (random 31)];
				}
				else
				{
				_veh = ((position player) nearEntities [["Air", "Landvehicle"], 10]) select 0;
				if !(isnil "_veh") then	{
					_sound = format ["A3\Sounds_F\sfx\radio\ambient_radio%1.wss",floor (random 31)];
					playsound3d [_sound,_veh,true,getPosasl _veh,1,1,50];
					};
				};
			sleep (1 + random 59);
			};
		};
	};

	// Vehicle Reward incentive initialized if Mechanized Armor threat enabled.
	if (MecArmPb > 1) then {
		[] spawn {
			WaitUntil{not isNull player};
			private "_uid";
			_uid = (getPlayerUID player);
			rewardp = "";
			"rewardp" addPublicVariableEventHandler {call compile format ["%1",_this select 1]};
			While {true} do
			{
				if (rewardp isEqualTo "") then
				{
					sleep 10;
				}
				else
				{
					if ((local player) and (rewardp == _uid)) then
					{
						//[activated_cache_pos] spawn JIG_circling_cam;// optional cache cam
						player setVariable ["createEnabled", true];
						_id = player addAction[("<t color=""#12F905"">") + ("Vehicle Reward") + "</t>", {call JIG_map_click}, [], 10, false, true];// Use it or loose it when player dies.
						private "_text";
						_text = "Vehicle Airdrop Awarded";
						[_text] spawn JIG_MPsideChatWest_fnc;
						rewardp = "";
						publicVariable "rewardp";
					};
				};
			};
		};
	};

	// Ambient Combat Sound
	if (ambCombSound isEqualTo 1) then {
		[] spawn {
		private ["_allsounds","_source"];
		_allsounds = [];
		_source = objective_pos_logic;
		while {true} do	{
			private ["_sound","_sound1","_sound2","_maxtype"];
			_allsounds = _allsounds - _allsounds;
			_sound1 = format ["A3\Sounds_F\ambient\battlefield\battlefield_explosions%1.wss",ceil (random 5)];
			_sound2 = format ["A3\Sounds_F\ambient\battlefield\battlefield_firefight%1.wss",ceil (random 4)];
			_allsounds pushBack _sound1;
			_allsounds pushBack _sound2;
			_maxtype = (count _allsounds);
			_sound = _allsounds select (floor random _maxtype);
			playsound3d [_sound,_source,false,getPosasl _source,5,1,600];
			sleep (1 + random 35);
			};
		};
	};
};