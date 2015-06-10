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
EOS_Spawn = compile preprocessfilelinenumbers "eos\core\eos_launch.sqf";Bastion_Spawn=compile preprocessfilelinenumbers "eos\core\b_launch.sqf";null=[] execVM "eos\core\spawn_fnc.sqf";onplayerConnected {[] execVM "eos\Functions\EOS_Markers.sqf";};

VictoryColor="colorGreen";	// Colour of marker after completion
hostileColor="colorRed";	// Default colour when enemies active
bastionColor="colorOrange";	// Colour for bastion marker
EOS_KILLCOUNTER=false;		// Counts killed units

null = [["mrkr1"],[2,2,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr2"],[1,1,InfPb],[2,2,InfPb],[1,3],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr3"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr4"],[2,1,InfPb],[1,1,InfPb],[1,3],[1,MecArmPb],[0],[1,2],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr5"],[2,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr6"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr7"],[1,2,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr8"],[2,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr9"],[2,2,InfPb],[2,3,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr10"],[2,1,InfPb],[2,2,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr11"],[2,2,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr12"],[2,2,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr13"],[2,2,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr14"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr15"],[2,2,InfPb],[1,3,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr16"],[2,2,InfPb],[1,1,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr17"],[2,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr18"],[0,0],[2,2,InfPb],[0,0],[0],[1],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr19"],[1,2,InfPb],[0,0],[1,3],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr20"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr21","mrkr22"],[0,0],[1,2,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr23","mrkr24"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr25"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr26"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr27"],[0,0],[1,2,InfPb],[0,0],[0],[1],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr28"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr29"],[0,0],[0,0],[1,3],[1,MecArmPb],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr30"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr31"],[0,0],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr32"],[0,0],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr33"],[2,1,InfPb],[2,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr34"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr35"],[2,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr36"],[2,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[1,5],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr37"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr38"],[2,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr39"],[2,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr40"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr41"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr42"],[0,0],[1,2,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr43"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr44"],[1,2,InfPb],[0,0],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr45"],[1,1,InfPb],[1,1,InfPb],[1,3],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr46"],[1,2,InfPb],[1,2,InfPb],[0,0],[0],[0],[1,5],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr47"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr48"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr49"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr50"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr51"],[0,0],[1,1,InfPb],[0,0],[1,MecArmPb],[1],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr52"],[1,2,InfPb],[0,0],[1,3],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr53"],[0,0],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr54"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr55"],[1,2,InfPb],[0,0],[1,3],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr56"],[0,0],[1,2,InfPb],[0,0],[0],[1],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr57"],[2,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr58"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr59"],[2,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr60"],[2,2,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr61"],[1,2,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr62"],[0,0],[1,2,InfPb],[0,0],[0],[1],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr63"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr64"],[0,0],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr65"],[0,0],[1,2,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr66"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr67"],[0,0],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr68"],[1,1,InfPb],[0,0],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr69"],[1,1,InfPb],[0,0],[1,3],[1,MecArmPb],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr70"],[0,0],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr71"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr72"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[1],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr73"],[1,2,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr74"],[0,0],[0,0],[1,3],[1,MecArmPb],[1],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr75"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr76","mrkr77"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr78"],[1,1,InfPb],[0,0],[1,3],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr79"],[1,2,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr80"],[0,0],[1,2,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr82"],[1,2,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr81","mrkr83"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr84"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[1,4],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr85","mrkr86"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr87"],[0,0],[0,0],[1,3],[1,MecArmPb],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr88"],[0,0],[1,2,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr89"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr90","mrkr92"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr91"],[1,2,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr93"],[0,0],[0,0],[0,0],[0],[2],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr94"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr95"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr96"],[0,0],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr97"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr98"],[1,1,InfPb],[0,0],[1,3],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr99"],[0,0],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr100"],[0,0],[1,2,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr101"],[0,0],[0,0],[0,0],[0],[0],[1,5],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr102"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr103"],[0,0],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr104","mrkr105"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr106"],[0,0],[0,0],[1,3],[1,MecArmPb],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr107"],[0,0],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr108"],[1,1,InfPb],[1,1,InfPb],[1,3],[1,MecArmPb],[1],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr109"],[0,0],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr110"],[0,0],[2,2,InfPb],[0,0],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr111","mrkr112","mrkr113"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr114"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr115"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr116"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr117"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr118"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr119"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr120"],[0,0],[0,0],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr121","mrkr122","mrkr123"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr124"],[0,0],[2,2,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr125","mrkr126"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr127","mrkr128"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr129"],[0,0],[1,2,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr130","mrkr131"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr132"],[2,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr133"],[0,0],[1,2,InfPb],[0,0],[1,MecArmPb],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr134","mrkr136"],[0,0],[1,1,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr135"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr137"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr138"],[0,0],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr139"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr140"],[0,0],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr141","mrkr142"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr143"],[2,1,InfPb],[0,0],[1,3],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr144"],[1,1,InfPb],[2,2,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr145"],[2,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[1,5],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr146"],[0,0],[1,2,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr147"],[2,2,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr148"],[1,2,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr149","mrkr150"],[2,2,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr151"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[1],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr152"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr153"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr154"],[0,0],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr155"],[1,1,InfPb],[0,0],[1,3],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr156"],[1,2,InfPb],[1,2,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr157"],[0,0],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr158"],[2,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr159"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr160"],[0,0],[1,1,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr161"],[1,2,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr162"],[2,1,InfPb],[2,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr163"],[0,0],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr164"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr165"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr166"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr167"],[1,1,InfPb],[0,0],[1,3],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr168","mrkr169","mrkr170"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr171"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr172"],[0,0],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr173"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr174"],[0,0],[2,2,InfPb],[1,3],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr175"],[1,2,InfPb],[0,0],[0,0],[0],[1],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr176"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr177"],[0,0],[1,2,InfPb],[0,0],[0],[1],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr178"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr179"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr180"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr181"],[1,2,InfPb],[1,1,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr182"],[0,0],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr183"],[1,2,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr184"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr185"],[2,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr186"],[0,0],[0,0],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr187"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr188"],[0,0],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr189"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr190"],[0,0],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr191"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr192"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr193"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr194"],[0,0],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr195"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr196"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr197"],[2,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr198"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr199"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr200"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr201"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr202"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr203"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr204"],[2,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr205"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr206"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr207"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr208"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr209"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr210"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr211"],[0,0],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr212"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr213"],[2,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr214"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr215"],[0,0],[1,2,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr216"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr217"],[0,0],[1,2,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr218"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr219"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr220"],[0,0],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,1,AI_SpawnDis,_side,true]] call EOS_Spawn;//invisible
null = [["mrkr221"],[0,0],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,1,AI_SpawnDis,_side,true]] call EOS_Spawn;//invisible
null = [["mrkr222"],[0,0],[0,0],[1,3],[0],[0],[0,0],[_fac2,1,AI_SpawnDis,_side,true]] call EOS_Spawn;//invisible
null = [["mrkr223"],[2,2,InfPb],[2,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr224"],[1,2,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr225"],[1,2,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr226"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr228"],[1,1,InfPb],[2,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr227","mrkr229"],[2,2,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr229"],[2,2,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr230"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr231"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr232"],[1,2,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr233"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr234"],[1,1,InfPb],[2,2,InfPb],[1,3],[1,MecArmPb],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr235"],[1,1,InfPb],[1,2,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr236"],[0,0],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr237"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr238"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr239"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr240"],[0,0],[2,2,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr241"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr242"],[1,1,InfPb],[1,2,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr243"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr244"],[1,1,InfPb],[3,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr245"],[1,1,InfPb],[1,1,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr246"],[2,1,InfPb],[2,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr247"],[2,1,InfPb],[2,3,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr248"],[0,0],[2,2,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr249"],[2,2,InfPb],[2,3,InfPb],[1,3],[0],[1],[1,5],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr250"],[1,1,InfPb],[0,0],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr251"],[2,2,InfPb],[2,3,InfPb],[1,3],[1,MecArmPb],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr252"],[2,2,InfPb],[2,3,InfPb],[1,3],[1,MecArmPb],[1],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr253"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr254"],[1,1,InfPb],[2,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr255"],[2,2,InfPb],[2,3,InfPb],[1,5],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr256"],[2,2,InfPb],[2,3,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr257"],[2,1,InfPb],[2,3,InfPb],[1,3],[1,MecArmPb],[1],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr258"],[0,0],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr259"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr260"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr261"],[1,1,InfPb],[1,1,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr262"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr263"],[2,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr264"],[2,1,InfPb],[2,3,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr265"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr266"],[1,1,InfPb],[1,2,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr267"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr268"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr269"],[2,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr270"],[1,1,InfPb],[1,2,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr271"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr272"],[2,1,InfPb],[2,3,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr273"],[2,1,InfPb],[2,3,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr274"],[2,1,InfPb],[2,3,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr275"],[2,1,InfPb],[2,3,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr276"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr277"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr278"],[1,1,InfPb],[1,2,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr279"],[2,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr280"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr281"],[1,1,InfPb],[2,2,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr282"],[1,1,InfPb],[2,3,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr283"],[1,1,InfPb],[2,2,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr284"],[1,1,InfPb],[2,2,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr285"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr286"],[1,1,InfPb],[2,2,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr287"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr288","mrkr289"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr290"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[1],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr291"],[1,1,InfPb],[2,3,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr292","mrkr293"],[1,1,InfPb],[2,3,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr294"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr295"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr296"],[1,1,InfPb],[1,1,InfPb],[0,0],[0],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr297"],[2,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr298","mrkr299"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr300"],[1,1,InfPb],[2,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr301"],[0,0],[1,1,InfPb],[0,0],[0],[1],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr302"],[2,1,InfPb],[2,3,InfPb],[1,3],[1,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr303"],[2,1,InfPb],[2,3,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr304"],[0,0],[1,1,InfPb],[0,0],[2,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr305"],[0,0],[1,1,InfPb],[0,0],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr306"],[0,0],[1,1,InfPb],[0,0],[2,MecArmPb],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr307"],[0,0],[1,1,InfPb],[0,0],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr308"],[0,0],[1,1,InfPb],[0,0],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr309"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr310"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr311"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr312"],[0,0],[1,1,InfPb],[0,0],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr313"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr314"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr315"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr316"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr317"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr318"],[0,0],[1,1,InfPb],[0,0],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr319"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr320"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr321"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr322"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr323"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr324"],[0,0],[1,1,InfPb],[0,0],[1,MecArmPb],[0],[0,0],[_fac1,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
null = [["mrkr325"],[1,1,InfPb],[1,2,InfPb],[0,0],[0],[0],[0,0],[_fac2,0,AI_SpawnDis,_side,true]] call EOS_Spawn;
