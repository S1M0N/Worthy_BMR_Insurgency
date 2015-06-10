EOS_Civ_Spawn = compile preprocessfilelinenumbers "eos_civ\core\eos_civ_launch.sqf";null=[] execVM "eos_civ\core\spawn_civ_fnc.sqf";onplayerConnected {[] execVM "eos_civ\Functions\EOS_Civ_Markers.sqf";};
/* EOS 1.98 by BangaBob
GROUP SIZES
 0 = 1
 1 = 2,4
 2 = 4,8
 3 = 8,12
 4 = 12,16
 5 = 16,20

EXAMPLE CALL - EOS
 null = [["MARKERNAME","MARKERNAME2"],[2,1,70],[0,1],[1,2,30],[2,60],[2],[1,0,10],[1,0,250,WEST]] call EOS_Civ_Spawn;
 null=[["M1","M2","M3"],[HOUSE GROUPS,SIZE OF GROUPS,PROBABILITY],[PATROL GROUPS,SIZE OF GROUPS,PROBABILITY],[LIGHT VEHICLES,SIZE OF CARGO,PROBABILITY],[ARMOURED VEHICLES,PROBABILITY], [STATIC VEHICLES,PROBABILITY],[HELICOPTERS,SIZE OF HELICOPTER CARGO,PROBABILITY],[FACTION,MARKERTYPE,DISTANCE,SIDE,HEIGHTLIMIT,DEBUG]] call EOS_Civ_Spawn;

*/
CivVictoryColor="colorGreen";	// Colour of marker after completion
CivhostileColor="colorRed";	// Default colour when enemies active
EOS_CIV_KILLCOUNTER=false;		// Counts killed units

null = [["civmkr1"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr2"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr3"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr4"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr5"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr6"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr7"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr8"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr9"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr10"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr11"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr12"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr13"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr14"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr15"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr16"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr17"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr18"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr19"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr20"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr21"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr22"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr23"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr24"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr25"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr26"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr27"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr28"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr29"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr30"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr31"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr32"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr33"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;
null = [["civmkr34"],[2,1,CivProbability],[1,0,CivProbability],[0,0],[0],[0],[0,0],[7,1,550,CIVILIAN]] call EOS_Civ_Spawn;