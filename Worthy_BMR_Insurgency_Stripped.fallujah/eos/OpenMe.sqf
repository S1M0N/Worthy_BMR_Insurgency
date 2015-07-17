/* EOS 1.98 by BangaBob
GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20

EXAMPLE CALL - EOS
 null = [["MARKERNAME","MARKERNAME2"],[2,1,70],[0,1],[1,2,30],[2,60],[2],[1,0,10],[1,0,250,WEST]] call EOS_Spawn;
 null=[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Spawn;

EXAMPLE CALL - BASTION
 null = [["BAS_zone_1"],[3,1],[2,1],[2],[0,0],[0,0,EAST,false,false],[10,2,120,TRUE,TRUE]] call Bastion_Spawn;
 null=[["M1","M2","M3"],[PATROL GROUPS,SIZE OF GROUPS],[LIGHT VEHICLES,SIZE OF CARGO],[ARMOURED VEHICLES],[HELICOPTERS,SIZE OF HELICOPTER CARGO],[FACTION,MARKERTYPE,SIDE,HEIGHTLIMIT,DEBUG],[INITIAL PAUSE, NUMBER OF WAVES, DELAY BETWEEN WAVES, INTEGRATE EOS, SHOW HINTS]] call Bastion_Spawn;
*/
private ["_side","_fac1","_fac2"];
_side = _this select 0;
_fac1 = _this select 1;
_fac2 = _this select 2;
EOS_Spawn = compile preprocessfilelinenumbers "eos\core\eos_launch.sqf";
Bastion_Spawn=compile preprocessfilelinenumbers "eos\core\b_launch.sqf";
null=[] execVM "eos\core\spawn_fnc.sqf";
onplayerConnected {[] execVM "eos\Functions\EOS_Markers.sqf";};

VictoryColor="colorGreen";	// Colour of marker after completion
hostileColor="colorRed";	// Default colour when enemies active
bastionColor="colorOrange";	// Colour for bastion marker
EOS_KILLCOUNTER=false;		// Counts killed units

execVM "Scripts\MarkerGenerator\MarkerGenerator.sqf";
waitUntil {missionNameSpace getVariable "MarkerGenComplete";};


{
	null = [[_x],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
} forEach (missionNamespace getVariable "MarkerArray");


null = [["zmkr1"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr2"],[1,1,InfPb],[1,1,InfPb],[1,3],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr3"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr4"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr5"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr6"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr7"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr8"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr9"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr10"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr11"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr12"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr13"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr14"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr15"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr16"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr17"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr18"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr19"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr20"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr21"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr22"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr23"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr24"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr25"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["zmkr26"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;


null = [["mzmkr1"],[0,0],[0,0],[1,1],[1,MecArmPb],[1,MecArmPb],[1,1],[_fac2,1,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mzmkr2"],[0,0],[0,0],[1,1],[1,MecArmPb],[1,MecArmPb],[1,1],[_fac2,1,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mzmkr3"],[0,0],[0,0],[1,1],[1,MecArmPb],[1,MecArmPb],[1,1],[_fac2,1,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mzmkr4"],[0,0],[0,0],[1,1],[1,MecArmPb],[1,MecArmPb],[1,1],[_fac2,1,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mzmkr5"],[0,0],[0,0],[1,1],[1,MecArmPb],[1,MecArmPb],[1,1],[_fac2,1,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mzmkr6"],[0,0],[0,0],[1,1],[1,MecArmPb],[1,MecArmPb],[1,1],[_fac2,1,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mzmkr7"],[0,0],[0,0],[1,1],[1,MecArmPb],[1,MecArmPb],[1,1],[_fac2,1,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mzmkr8"],[0,0],[0,0],[1,1],[1,MecArmPb],[1,MecArmPb],[1,1],[_fac2,1,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mzmkr9"],[0,0],[0,0],[1,1],[1,MecArmPb],[1,MecArmPb],[1,1],[_fac2,1,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mzmkr10"],[0,0],[0,0],[1,1],[1,MecArmPb],[1,MecArmPb],[1,1],[_fac2,1,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mzmkr11"],[0,0],[0,0],[1,1],[1,MecArmPb],[1,MecArmPb],[1,1],[_fac2,1,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mzmkr12"],[0,0],[0,0],[1,1],[1,MecArmPb],[1,MecArmPb],[1,1],[_fac2,1,AI_SpawnDis,_side,true]] call EOS_Spawn;
