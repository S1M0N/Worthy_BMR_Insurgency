// INS_definitions.sqf by Jigsor

// Params //////////////////////////////////////////////////////////
BTC_p_time      =		(paramsArray select 1);
JIPweather		=		(paramsArray select 2);
ambRadioChatter =		(paramsArray select 3);
ambCombSound	=		(paramsArray select 4);
Remove_grass_opt=		(paramsArray select 5);
INS_environment	=		(paramsArray select 6);
INS_p_rev       =		(paramsArray select 8);
INS_p_rev_time  =		(paramsArray select 9);
INS_op_faction	=		(paramsArray select 11);
InfPb			=		(paramsArray select 13);
MecArmPb		=		(paramsArray select 14);
AI_SpawnDis		=		(paramsArray select 15);
EnableEnemyAir	=		(paramsArray select 16);
AirRespawnDelay =		(paramsArray select 17);
PatroleWPmode	=		(paramsArray select 18);
BTC_p_skill     =		(paramsArray select 20);
BTC_AI_skill    =		(paramsArray select 21)/10;
CiviMobiles		=		(paramsArray select 23);
CiviFoot		=		(paramsArray select 24);
CivProbability	= 		(paramsArray select 25);
SuicideBombers	=		(paramsArray select 26);
INS_logistics	=		(paramsArray select 28);
Fatigue_ability =		(paramsArray select 29);
EOS_DAMAGE_MULTIPLIER =	(paramsArray select 30);
JigHeliExtraction =		(paramsArray select 31);
limitPOV		=		(paramsArray select 32);
max_ai_recruits	=		(paramsArray select 33);
EnemyAmmoCache	=		(paramsArray select 35);
Intel_Loc_Alpha =		(paramsArray select 36);
Intel_Count		=		(paramsArray select 37);
DebugEnabled	=		paramsArray select 39;if (!isMultiplayer) then {DebugEnabled = 1;};
tky_perfmon		=		(paramsArray select 40);

if (JIPweather isEqualTo 1) then {[] execVM "scripts\real_weather.sqf"; skiptime ((BTC_p_time - (daytime) +24) % 24);};
if (JIPweather isEqualTo 2) then {[] execVM "scripts\randomWeather2.sqf"; skipTime (BTC_p_time -0.84);};

// Global Variables /////////////////////////////////////////////////
WestScore = 0;
EastScore = 0;
jig_tvt_globalsleep = 0.1;// Global sleep used after spawning a unit.
if (isNil "lck_markercnt") then {lck_markercnt=0;};// bardosy's HuntIR
if (isNil "timesup") then {timesup = false;};
Op4_mkrs = ["Respawn_East"];
Blu4_mkrs = ["Respawn_West","Helicopters","Mechanized","VehicleMaintenance","HelicopterRepair","HelicopterRepair2","AircraftMaintenance","Halo","Dock"];
INS_Op4_wepCrates = [INS_weps_Cbox,INS_ammo_Cbox,INS_nade_Cbox,INS_launchers_Cbox,INS_demo_Cbox,INS_sup_Cbox,INS_E_tent];
ghst_Build_objs = [];// all ammo cache objects array

// Client Variables /////////////////////////////////////////////////
if (!isServer) then
{
	if (isNil "PVEH_netSay3D") then {PVEH_NetSay3D = [objNull,0];};
	ebox = ObjNull;
	epad = ObjNull;
};

// Server Variables /////////////////////////////////////////////////
if (isServer) then {
	//server GetVariable "eosMarkers";
	//server GetVariable "eosMarkersCiv";
	switch (true) do {
		case (toLower (worldName) isEqualTo "altis"):
		{
			Airfield_opt = true;publicVariable "Airfield_opt";
			Rand_AirCntr_OFstMax = 3500;publicVariable "Rand_AirCntr_OfstMax";
			Del_box_Pos = [4867.45,6245.6,0.00129318];publicVariable "Del_box_Pos";
			all_eos_mkrs = ["mrkr66","mrkr1","mrkr2","mrkr3","mrkr4","mrkr5","mrkr6","mrkr7","mrkr8","mrkr9","mrkr10","mrkr11","mrkr12","mrkr13","mrkr14","mrkr15","mrkr16","mrkr17","mrkr18","mrkr19","mrkr20","mrkr21","mrkr22","mrkr23","mrkr24","mrkr25","mrkr26","mrkr27","mrkr28","mrkr29","mrkr30","mrkr31","mrkr32","mrkr33","mrkr34","mrkr35","mrkr36","mrkr37","mrkr38","mrkr39","mrkr40","mrkr41","mrkr42","mrkr43","mrkr44","mrkr45","mrkr46","mrkr47","mrkr48","mrkr49","mrkr50","mrkr51","mrkr52","mrkr53","mrkr54","mrkr55","mrkr56","mrkr57","mrkr58","mrkr59","mrkr60","mrkr61","mrkr62","mrkr63","mrkr64","mrkr65","mrkr67","mrkr68","mrkr71","mrkr72","mrkr73","mrkr74","mrkr75","mrkr76","mrkr77","mrkr78","mrkr79","mrkr80","mrkr81","mrkr82","mrkr83","mrkr84","mrkr85","mrkr88","mrkr89","mrkr90","mrkr91","mrkr92","mrkr93","mrkr94","mrkr95","mrkr96","mrkr97","mrkr98","mrkr99","mrkr198","mrkr199","mrkr200","mrkr201","mrkr202","mrkr203","mrkr204","mrkr205","mrkr100","mrkr101","mrkr102","mrkr103","mrkr106","mrkr107","mrkr108","mrkr109","mrkr110","mrkr111","mrkr112","mrkr113","mrkr114","mrkr115","mrkr116","mrkr117","mrkr118","mrkr119","mrkr86","mrkr87","mrkr120","mrkr121","mrkr122","mrkr123","mrkr124","mrkr125","mrkr126","mrkr127","mrkr128","mrkr129","mrkr130","mrkr131","mrkr132","mrkr133","mrkr134","mrkr135","mrkr136","mrkr137","mrkr138","mrkr139","mrkr140","mrkr141","mrkr142","mrkr143","mrkr144","mrkr145","mrkr146","mrkr147","mrkr148","mrkr149","mrkr150","mrkr151","mrkr152","mrkr153","mrkr154","mrkr155","mrkr156","mrkr157","mrkr158","mrkr159","mrkr160","mrkr161","mrkr162","mrkr163","mrkr164","mrkr165","mrkr166","mrkr167","mrkr168","mrkr169","mrkr170","mrkr171","mrkr172","mrkr173","mrkr174","mrkr175","mrkr176","mrkr177","mrkr178","mrkr179","mrkr180","mrkr181","mrkr182","mrkr183","mrkr184","mrkr185","mrkr186","mrkr187","mrkr188","mrkr189","mrkr190","mrkr191","mrkr192","mrkr193","mrkr194","mrkr195","mrkr196","mrkr70","mrkr104","mrkr105","mrkr226","mrkr69","mrkr254","mrkr255","mrkr256","mrkr197","mrkr206","mrkr207","mrkr208","mrkr209","mrkr210","mrkr211","mrkr212","mrkr213","mrkr214","mrkr215","mrkr216","mrkr217","mrkr218","mrkr219","mrkr220","mrkr221","mrkr222","mrkr223","mrkr224","mrkr225","mrkr228","mrkr227","mrkr229","mrkr229","mrkr230","mrkr231","mrkr232","mrkr233","mrkr234","mrkr235","mrkr236","mrkr237","mrkr238","mrkr239","mrkr240","mrkr241","mrkr242","mrkr244","mrkr246","mrkr243","mrkr245","mrkr247","mrkr248","mrkr249","mrkr250","mrkr251","mrkr252","mrkr253","mrkr257","mrkr258","mrkr259","mrkr260","mrkr261","mrkr262","mrkr263","mrkr264","mrkr265","mrkr266","mrkr267","mrkr268","mrkr269","mrkr270","mrkr271","mrkr272","mrkr273","mrkr274","mrkr275","mrkr276","mrkr277","mrkr278","mrkr279","mrkr280","mrkr281","mrkr282","mrkr283","mrkr284","mrkr285","mrkr286","mrkr287","mrkr288","mrkr289","mrkr290","mrkr291","mrkr292","mrkr293","mrkr294","mrkr295","mrkr296","mrkr297","mrkr298","mrkr299","mrkr300","mrkr301","mrkr302","mrkr303","mrkr304","mrkr398","mrkr399","mrkr400","mrkr401","mrkr402","mrkr403","mrkr404","mrkr405","mrkr406","mrkr407","mrkr408","mrkr409","mrkr410","mrkr411","mrkr412","mrkr413","mrkr414","mrkr415","mrkr416","mrkr417","mrkr418","mrkr419","mrkr333","mrkr334","mrkr335","mrkr305","mrkr306","mrkr307","mrkr308","mrkr309","mrkr310","mrkr311","mrkr312","mrkr313","mrkr314","mrkr315","mrkr316","mrkr317","mrkr318","mrkr319","mrkr320","mrkr321","mrkr322","mrkr323","mrkr324","mrkr325","mrkr326","mrkr327","mrkr328","mrkr329","mrkr330","mrkr331","mrkr332","mrkr336","mrkr337","mrkr338","mrkr339","mrkr340","mrkr341","mrkr342","mrkr344","mrkr343","mrkr345","mrkr346","mrkr347","mrkr348","mrkr349","mrkr350","mrkr351","mrkr352","mrkr353","mrkr354","mrkr355","mrkr356","mrkr357","mrkr358","mrkr359","mrkr360","mrkr361","mrkr362","mrkr363","mrkr364","mrkr365","mrkr366","mrkr367","mrkr368","mrkr369","mrkr370","mrkr371","mrkr372","mrkr373","mrkr374","mrkr375","mrkr378","mrkr379","mrkr380","mrkr376","mrkr377","mrkr381","mrkr382","mrkr383","mrkr384","mrkr385","mrkr386","mrkr387","mrkr388","mrkr389","mrkr390","mrkr391","mrkr392","mrkr393","mrkr394","mrkr395","mrkr396","mrkr397","mrkr420","mrkr421","mrkr422","mrkr423","mrkr424","mrkr425","mrkr426","mrkr427","mrkr428","mrkr429","mrkr430","mrkr431","mrkr432","mrkr433","mrkr434","mrkr435","mrkr436","mrkr437","mrkr438","mrkr439","mrkr440","mrkr441","mrkr442","mrkr443","mrkr444","mrkr445","mrkr446","mrkr447","mrkr448","mrkr449","mrkr450","mrkr451","mrkr452","mrkr453","mrkr454","mrkr455","mrkr456","mrkr457","mrkr458","mrkr459","mrkr460","mrkr461","mrkr462","mrkr463","mrkr464","mrkr465","mrkr466","mrkr466","mrkr467","mrkr468","mrkr469","mrkr470","mrkr471","mrkr472","mrkr473","mrkr474","mrkr475","mrkr476","mrkr477","mrkr478","mrkr479","mrkr480","mrkr481","mrkr482","mrkr483","mrkr484","mrkr485","mrkr486","mrkr487","mrkr488","mrkr489","mrkr490","mrkr491","mrkr492","mrkr493","mrkr494","mrkr495","mrkr496","mrkr497","mrkr498","mrkr499","mrkr500","mrkr501","mrkr502","mrkr503","mrkr504","mrkr505","mrkr506","mrkr507","mrkr508","mrkr509","mrkr510","mrkr511","mrkr512","mrkr513","mrkr514","mrkr515","mrkr516","mrkr517","mrkr518","mrkr519","mrkr520","mrkr521","mrkr522","mrkr523","mrkr524","mrkr525","mrkr526","mrkr527","mrkr528","mrkr529","mrkr530","mrkr531","mrkr531","mrkr532","mrkr533","mrkr534","mrkr535","mrkr536","mrkr537","mrkr538","mrkr539","mrkr540","mrkr541","mrkr542","mrkr543","mrkr544","mrkr545","mrkr546","mrkr547","mrkr548","mrkr549","mrkr550","mrkr551","mrkr552","mrkr553","mrkr554","mrkr555","mrkr556","mrkr557","mrkr558","mrkr559","mrkr560","mrkr561","mrkr562","mrkr563","mrkr564","mrkr565","mrkr566","mrkr567","mrkr568","mrkr569","mrkr570","mrkr571","mrkr572","mrkr573","mrkr574","mrkr575","mrkr576","mrkr577","mrkr578","mrkr579","mrkr580","mrkr581","mrkr582","mrkr583","mrkr584","mrkr585","mrkr586","mrkr587","mrkr588","mrkr589","mrkr590","mrkr591","mrkr592","mrkr593","mrkr594","mrkr595","mrkr596","mrkr597","mrkr598","mrkr599","mrkr600","mrkr601","mrkr602","mrkr603","mrkr604","mrkr605","mrkr606","mrkr607","mrkr608","mrkr609","mrkr610","mrkr611","mrkr612","mrkr613","mrkr614","mrkr615","mrkr616","mrkr617","mrkr618","mrkr619","mrkr620","mrkr621","mrkr622","mrkr623","mrkr624","mrkr625","mrkr626","mrkr627","mrkr628","mrkr629","mrkr630","mrkr631","mrkr632","mrkr633","mrkr634","mrkr635","mrkr636","mrkr637","mrkr638","mrkr639","mrkr640","mrkr641","mrkr642","mrkr643","mrkr644","mrkr645","mrkr646","mrkr647","mrkr648","mrkr649","mrkr650","mrkr651","mrkr652","mrkr653","mrkr654","mrkr655","mrkr655","mrkr656","mrkr657","mrkr658","mrkr659","mrkr660","mrkr661","mrkr662","mrkr663","mrkr664","mrkr665","mrkr666","mrkr667","mrkr668","mrkr669","mrkr670","mrkr671","mrkr672","mrkr673","mrkr674","mrkr675","mrkr675","mrkr676","mrkr677","mrkr678","mrkr679","mrkr680","mrkr681","mrkr682","mrkr683","mrkr684","mrkr685","mrkr686","mrkr687","mrkr688","mrkr689","mrkr690","mrkr691","mrkr692","mrkr693","mrkr694","mrkr695","mrkr696","mrkr697","mrkr698","mrkr699","mrkr700","mrkr701","mrkr702","mrkr703","mrkr704","mrkr705","mrkr706","mrkr707","mrkr708","mrkr709","mrkr710","mrkr711","mrkr712","mrkr713","mrkr714","mrkr715","mrkr716","mrkr717","mrkr718","mrkr719","mrkr720","mrkr721","mrkr722","mrkr723","mrkr724","mrkr725","mrkr726","mrkr727","mrkr728","mrkr729","mrkr730","mrkr731","mrkr732","mrkr733","mrkr734","mrkr735","mrkr736","mrkr737","mrkr738","mrkr739","mrkr740","mrkr741","mrkr742","mrkr743","mrkr744","mrkr745","mrkr746","mrkr747","mrkr748","mrkr749","mrkr750","mrkr751","mrkr752","mrkr753","mrkr754","mrkr755","mrkr756","mrkr757","mrkr758","mrkr759","mrkr760","mrkr761","mrkr762","mrkr763","mrkr764","mrkr765","mrkr766","mrkr767","mrkr768","mrkr769","mrkr770","mrkr771","mrkr772","mrkr773","mrkr774","mrkr775","mrkr776","mrkr777","mrkr778","mrkr779","mrkr780","mrkr781","mrkr782","mrkr783","mrkr784","mrkr785","mrkr786","mrkr787","mrkr788","mrkr789","mrkr790","mrkr791","mrkr792","mrkr793","mrkr794","mrkr795","mrkr796","mrkr797","mrkr798","mrkr799","mrkr800","mrkr801","mrkr802","mrkr803","mrkr804","mrkr805","mrkr806","mrkr807","mrkr808","mrkr809","mrkr810","mrkr811","mrkr812","mrkr813","mrkr814","mrkr815","mrkr816","mrkr817","mrkr818","mrkr819","mrkr820","mrkr821","mrkr822","mrkr823","mrkr824","mrkr825","mrkr826","mrkr827","mrkr828","mrkr829","mrkr830","mrkr831","mrkr832","mrkr833","mrkr834","mrkr835","mrkr836","mrkr837","mrkr838","mrkr839","mrkr840","mrkr841","mrkr842","mrkr843","mrkr844","mrkr845","mrkr846","mrkr847","mrkr848","mrkr849","mrkr850","mrkr851","mrkr852","mrkr853","mrkr854","mrkr855","mrkr856","mrkr857","mrkr858","mrkr859","mrkr860","mrkr862","mrkr863","mrkr864","mrkr865","mrkr866","mrkr867","mrkr868","mrkr869","mrkr870","mrkr871","mrkr872","mrkr873","mrkr874","mrkr875","mrkr876","mrkr877","mrkr878","mrkr879","mrkr880","mrkr881","mrkr882","mrkr883","mrkr884","mrkr885","mrkr886","mrkr887","mrkr888","mrkr889","mrkr890","mrkr891","mrkr892","mrkr893","mrkr894","mrkr895","mrkr896","mrkr897","mrkr898","mrkr899","mrkr900","mrkr901","mrkr902","mrkr903","mrkr904","mrkr905","mrkr906","mrkr907","mrkr908","mrkr909","mrkr910","mrkr911","mrkr912","mrkr913","mrkr914","mrkr915","mrkr916","mrkr917","mrkr918","mrkr919","mrkr920","mrkr921","mrkr922","mrkr923","mrkr924","mrkr925","mrkr926","mrkr927","mrkr928","mrkr929","mrkr930","mrkr931","mrkr932","mrkr933","mrkr934","mrkr935","mrkr936","mrkr937","mrkr938","mrkr939","mrkr940","mrkr941","mrkr942","mrkr943","mrkr944","mrkr945","mrkr946","mrkr947"];publicVariable "all_eos_mkrs";//invisible eos markers excluded
			//all_civ_eos_mkrs = ["civmkr1","civmkr2","civmkr3","civmkr4","civmkr5","civmkr6","civmkr7","civmkr8","civmkr9","civmkr10","civmkr11","civmkr12","civmkr13","civmkr14","civmkr15","civmkr16"];publicVariable "all_civ_eos_mkrs";
		};
		case (toLower (worldName) isEqualTo "zargabad"):
		{
			Airfield_opt = false;publicVariable "Airfield_opt";
			Rand_AirCntr_OFstMax = 1800;publicVariable "Rand_AirCntr_OfstMax";
			Del_box_Pos = [4867.45,6245.6,0.00129318];publicVariable "Del_box_Pos";
			all_eos_mkrs = ["mrkr1","mrkr2","mrkr3","mrkr4","mrkr5","mrkr6","mrkr7","mrkr8","mrkr9","mrkr10","mrkr11","mrkr12","mrkr15","mrkr14","mrkr16","mrkr17","mrkr18","mrkr19","mrkr20","mrkr21","mrkr22","mrkr23","mrkr24","mrkr25","mrkr26","mrkr27","mrkr28","mrkr31","mrkr30","mrkr29","mrkr32","mrkr33","mrkr35","mrkr34","mrkr36","mrkr37","mrkr39","mrkr38","mrkr40","mrkr41","mrkr42","mrkr43","mrkr44","mrkr45","mrkr60","mrkr47","mrkr48","mrkr49","mrkr50","mrkr51","mrkr52","mrkr53","mrkr54","mrkr55","mrkr56","mrkr57","mrkr64","mrkr63","mrkr65","mrkr66","mrkr58","mrkr62","mrkr61","mrkr59","mrkr67","mrkr68","mrkr69","mrkr70","mrkr72","mrkr71","mrkr73","mrkr75","mrkr74","mrkr76","mrkr77","mrkr78","mrkr79","mrkr80","mrkr81","mrkr82","mrkr83","mrkr84","mrkr85","mrkr86","mrkr87","mrkr88","mrkr90","mrkr92","mrkr93","mrkr91","mrkr89","mrkr94","mrkr95","mrkr96","mrkr97","mrkr98","mrkr99","mrkr100","mrkr101","mrkr102","mrkr103","mrkr104","mrkr105","mrkr106","mrkr107","mrkr108","mrkr109","mrkr110","mrkr112","mrkr113","mrkr114","mrkr115","mrkr119","mrkr117","mrkr116","mrkr118","mrkr120","mrkr121","mrkr124","mrkr123","mrkr122","mrkr125","mrkr126","mrkr127","mrkr128","mrkr129","mrkr130","mrkr131","mrkr132","mrkr133","mrkr134","mrkr135","mrkr136","mrkr137","mrkr138","mrkr139","mrkr140","mrkr141","mrkr142","mrkr143","mrkr144","mrkr145","mrkr146","mrkr147","mrkr148","mrkr149","mrkr155","mrkr150","mrkr154","mrkr156","mrkr151","mrkr152","mrkr153","mrkr157","mrkr159","mrkr158","mrkr160","mrkr161","mrkr162","mrkr163","mrkr164","mrkr165","mrkr166","mrkr167","mrkr168","mrkr169","mrkr170","mrkr171","mrkr172","mrkr173","mrkr174","mrkr175","mrkr176","mrkr177","mrkr178","mrkr179","mrkr180","mrkr181","mrkr182","mrkr183","mrkr185","mrkr184","mrkr186","mrkr187","mrkr189","mrkr188","mrkr190"]; publicVariable "all_eos_mkrs";//excludes hidden markers ["mrkr13",]
			//all_civ_eos_mkrs = ["civmkr1","civmkr2","civmkr3","civmkr4","civmkr5","civmkr6","civmkr7","civmkr8","civmkr9","civmkr10","civmkr11","civmkr12","civmkr13","civmkr14","civmkr15","civmkr16"]; publicVariable "all_civ_eos_mkrs";
		};
		case (toLower (worldName) isEqualTo "pja305"):
		{
			Airfield_opt = true;publicVariable "Airfield_opt";
			Rand_AirCntr_OFstMax = 2500;publicVariable "Rand_AirCntr_OfstMax";
			Del_box_Pos = [13795,728.291,0.00143909];publicVariable "Del_box_Pos";
			all_eos_mkrs = ["mrkr1","mrkr2","mrkr3","mrkr4","mrkr5","mrkr6","mrkr7","mrkr8","mrkr9","mrkr10","mrkr11","mrkr12","mrkr14","mrkr15","mrkr16","mrkr17","mrkr18","mrkr19","mrkr20","mrkr21","mrkr22","mrkr23","mrkr24","mrkr25","mrkr26","mrkr31","mrkr27","mrkr28","mrkr29","mrkr30","mrkr32","mrkr33","mrkr34","mrkr35","mrkr36","mrkr37","mrkr38","mrkr39","mrkr40","mrkr41","mrkr44","mrkr42","mrkr43","mrkr45","mrkr46","mrkr47","mrkr48","mrkr49","mrkr50","mrkr51","mrkr52","mrkr53","mrkr54","mrkr55","mrkr56","mrkr57","mrkr59","mrkr58","mrkr60","mrkr61","mrkr62","mrkr63","mrkr65","mrkr64","mrkr66","mrkr67","mrkr70","mrkr68","mrkr69","mrkr71","mrkr72","mrkr74","mrkr73","mrkr76","mrkr77","mrkr75","mrkr78","mrkr79","mrkr80","mrkr81","mrkr82","mrkr83","mrkr84","mrkr85","mrkr86","mrkr87","mrkr88","mrkr89","mrkr91","mrkr92","mrkr93","mrkr90","mrkr149","mrkr94","mrkr95","mrkr96","mrkr97","mrkr98","mrkr99","mrkr100","mrkr106","mrkr108","mrkr101","mrkr102","mrkr103","mrkr104","mrkr105","mrkr107","mrkr112","mrkr118","mrkr109","mrkr110","mrkr113","mrkr114","mrkr116","mrkr115","mrkr117","mrkr119","mrkr160","mrkr120","mrkr121","mrkr122","mrkr123","mrkr124","mrkr125","mrkr126","mrkr127","mrkr128","mrkr129","mrkr130","mrkr131","mrkr133","mrkr135","mrkr136","mrkr134","mrkr137","mrkr138","mrkr139","mrkr140","mrkr141","mrkr142","mrkr143","mrkr144","mrkr145","mrkr146","mrkr147","mrkr148","mrkr151","mrkr152","mrkr150","mrkr153","mrkr154","mrkr156","mrkr155","mrkr161","mrkr162","mrkr163","mrkr159","mrkr158","mrkr164","mrkr165","mrkr132","mrkr157","mrkr166","mrkr168","mrkr169","mrkr167","mrkr170","mrkr171","mrkr172","mrkr173","mrkr174","mrkr175","mrkr176","mrkr177","mrkr178","mrkr179","mrkr180","mrkr181","mrkr182","mrkr183","mrkr184","mrkr185","mrkr186","mrkr187","mrkr188","mrkr189","mrkr190","mrkr191","mrkr192","mrkr193","mrkr194","mrkr195","mrkr196","mrkr197","mrkr198","mrkr199","mrkr200","mrkr201","mrkr202","mrkr203","mrkr204","mrkr205","mrkr206","mrkr207","mrkr208","mrkr209","mrkr210","mrkr211","mrkr212","mrkr213","mrkr214","mrkr215","mrkr216","mrkr217","mrkr218","mrkr219","mrkr220","mrkr221","mrkr222","mrkr223","mrkr224","mrkr225","mrkr226","mrkr227","mrkr228","mrkr229","mrkr230","mrkr231","mrkr232","mrkr233","mrkr234","mrkr235","mrkr236","mrkr237","mrkr238","mrkr238","mrkr239","mrkr240","mrkr241","mrkr242","mrkr243","mrkr244","mrkr245","mrkr246","mrkr247","mrkr248","mrkr249","mrkr250","mrkr251","mrkr252","mrkr251","mrkr252","mrkr253","mrkr254","mrkr255","mrkr256","mrkr257","mrkr258","mrkr259","mrkr260","mrkr262","mrkr261","mrkr262","mrkr263","mrkr264","mrkr265","mrkr266","mrkr267","mrkr265","mrkr266","mrkr267","mrkr268","mrkr269","mrkr270","mrkr271","mrkr272","mrkr273","mrkr274","mrkr275","mrkr276","mrkr277","mrkr278","mrkr279","mrkr280","mrkr281","mrkr282","mrkr283","mrkr284"];publicVariable "all_eos_mkrs";// hidden markers ["mrkr13"]
			//all_civ_eos_mkrs = ["civmkr1","civmkr2","civmkr3","civmkr4","civmkr5","civmkr6","civmkr7","civmkr8","civmkr9","civmkr10","civmkr11","civmkr12","civmkr13","civmkr14","civmkr15","civmkr16","civmkr17","civmkr18","civmkr19","civmkr20"];publicVariable "all_civ_eos_mkrs";
		};
		case (toLower (worldName) isEqualTo "takistan"):
		{
			Airfield_opt = true;publicVariable "Airfield_opt";
			Rand_AirCntr_OFstMax = 3200;publicVariable "Rand_AirCntr_OfstMax";
			Del_box_Pos = [8031.23,1967,0.00143433];publicVariable "Del_box_Pos";
			all_eos_mkrs = ["mrkr1","mrkr2","mrkr3","mrkr4","mrkr5","mrkr6","mrkr7","mrkr8","mrkr9","mrkr10","mrkr11","mrkr12","mrkr13","mrkr14","mrkr15","mrkr16","mrkr17","mrkr18","mrkr19","mrkr20","mrkr21","mrkr22","mrkr23","mrkr24","mrkr25","mrkr26","mrkr27","mrkr28","mrkr29","mrkr30","mrkr31","mrkr32","mrkr33","mrkr34","mrkr35","mrkr36","mrkr37","mrkr38","mrkr39","mrkr40","mrkr41","mrkr42","mrkr43","mrkr44","mrkr45","mrkr46","mrkr47","mrkr48","mrkr49","mrkr50","mrkr51","mrkr52","mrkr53","mrkr54","mrkr55","mrkr56","mrkr57","mrkr58","mrkr59","mrkr60","mrkr61","mrkr62","mrkr63","mrkr64","mrkr65","mrkr66","mrkr67","mrkr68","mrkr69","mrkr70","mrkr71","mrkr72","mrkr73","mrkr74","mrkr75","mrkr76","mrkr77","mrkr78","mrkr79","mrkr80","mrkr82","mrkr81","mrkr83","mrkr84","mrkr85","mrkr86","mrkr87","mrkr88","mrkr89","mrkr90","mrkr92","mrkr91","mrkr93","mrkr94","mrkr95","mrkr96","mrkr97","mrkr98","mrkr99","mrkr100","mrkr101","mrkr102","mrkr103","mrkr104","mrkr105","mrkr106","mrkr107","mrkr108","mrkr109","mrkr110","mrkr111","mrkr112","mrkr113","mrkr114","mrkr115","mrkr116","mrkr117","mrkr118","mrkr119","mrkr120","mrkr121","mrkr122","mrkr123","mrkr124","mrkr125","mrkr126","mrkr127","mrkr128","mrkr129","mrkr130","mrkr131","mrkr132","mrkr133","mrkr134","mrkr136","mrkr135","mrkr137","mrkr138","mrkr139","mrkr140","mrkr141","mrkr142","mrkr143","mrkr144","mrkr145","mrkr146","mrkr147","mrkr148","mrkr149","mrkr150","mrkr151","mrkr152","mrkr153","mrkr154","mrkr155","mrkr156","mrkr157","mrkr158","mrkr159","mrkr160","mrkr161","mrkr162","mrkr163","mrkr164","mrkr165","mrkr166","mrkr167","mrkr168","mrkr169","mrkr170","mrkr171","mrkr172","mrkr173","mrkr174","mrkr175","mrkr176","mrkr177","mrkr178","mrkr179","mrkr180","mrkr181","mrkr182","mrkr183","mrkr184","mrkr185","mrkr186","mrkr187","mrkr188","mrkr189","mrkr190","mrkr191","mrkr192","mrkr193","mrkr194","mrkr195","mrkr196","mrkr197","mrkr198","mrkr199","mrkr200","mrkr201","mrkr202","mrkr203","mrkr204","mrkr205","mrkr206","mrkr207","mrkr208","mrkr209","mrkr210","mrkr211","mrkr212","mrkr213","mrkr214","mrkr215","mrkr216","mrkr217","mrkr218","mrkr219","mrkr223","mrkr224","mrkr225","mrkr226","mrkr228","mrkr227","mrkr229","mrkr229","mrkr230","mrkr231","mrkr232","mrkr233","mrkr234","mrkr235","mrkr236","mrkr237","mrkr238","mrkr239","mrkr240","mrkr241","mrkr242","mrkr243","mrkr244","mrkr245","mrkr246","mrkr247","mrkr248","mrkr249","mrkr250","mrkr251","mrkr252","mrkr253","mrkr254","mrkr255","mrkr256","mrkr257","mrkr258","mrkr259","mrkr260","mrkr261","mrkr262","mrkr263","mrkr264","mrkr265","mrkr266","mrkr267","mrkr268","mrkr269","mrkr270","mrkr271","mrkr272","mrkr273","mrkr274","mrkr275","mrkr276","mrkr277","mrkr278","mrkr279","mrkr280","mrkr281","mrkr282","mrkr283","mrkr284","mrkr285","mrkr286","mrkr287","mrkr288","mrkr289","mrkr290","mrkr291","mrkr292","mrkr293","mrkr294","mrkr295","mrkr296","mrkr297","mrkr298","mrkr299","mrkr300","mrkr301","mrkr302","mrkr303","mrkr304","mrkr305","mrkr306","mrkr307","mrkr308","mrkr309","mrkr310","mrkr311","mrkr312","mrkr313","mrkr314","mrkr315","mrkr316","mrkr317","mrkr318","mrkr319","mrkr320","mrkr321","mrkr322","mrkr323","mrkr324","mrkr325","mrkr326","mrkr327","mrkr328","mrkr329","mrkr330","mrkr331","mrkr333","mrkr334","mrkr335","mrkr336","mrkr337","mrkr338","mrkr339"];publicVariable "all_eos_mkrs";//excludes hidden markers ["mrkr220","mrkr221","mrkr222","mrkr332","mrkr340"]
			//all_civ_eos_mkrs = ["civmkr1","civmkr2","civmkr3","civmkr4","civmkr5","civmkr6","civmkr7","civmkr8","civmkr9","civmkr10","civmkr11","civmkr12","civmkr13","civmkr14","civmkr15","civmkr16","civmkr17","civmkr18","civmkr19","civmkr20","civmkr21","civmkr22","civmkr23","civmkr24","civmkr25","civmkr26","civmkr27","civmkr28","civmkr29","civmkr30","civmkr31","civmkr32","civmkr33","civmkr34","civmkr35"];publicVariable "all_civ_eos_mkrs";
		};
		case (toLower (worldName) isEqualTo "fallujah"):
		{
			Airfield_opt = true;publicVariable "Airfield_opt";
			Rand_AirCntr_OFstMax = 2000;publicVariable "Rand_AirCntr_OfstMax";
			Del_box_Pos = [5705.8,9883.6,0.00143862];publicVariable "Del_box_Pos";
			all_eos_mkrs = ["mrkr66","mrkr1","mrkr2","mrkr3","mrkr4","mrkr5","mrkr6","mrkr7","mrkr8","mrkr9","mrkr10","mrkr11","mrkr12","mrkr13","mrkr14","mrkr15","mrkr16","mrkr17","mrkr18","mrkr19","mrkr20","mrkr21","mrkr22","mrkr23","mrkr24","mrkr25","mrkr26","mrkr27","mrkr28","mrkr29","mrkr30","mrkr31","mrkr32","mrkr33","mrkr34","mrkr35","mrkr36","mrkr37","mrkr38","mrkr39","mrkr40","mrkr41","mrkr42","mrkr43","mrkr44","mrkr45","mrkr46","mrkr47","mrkr48","mrkr49","mrkr50","mrkr51","mrkr52","mrkr53","mrkr54","mrkr55","mrkr56","mrkr57","mrkr58","mrkr59","mrkr60","mrkr61","mrkr62","mrkr63","mrkr64","mrkr65","mrkr67","mrkr68","mrkr71","mrkr72","mrkr73","mrkr74","mrkr75","mrkr76","mrkr77","mrkr78","mrkr79","mrkr80","mrkr81","mrkr82","mrkr83","mrkr84","mrkr85","mrkr88","mrkr89","mrkr90","mrkr91","mrkr92","mrkr93","mrkr94","mrkr95","mrkr96","mrkr97","mrkr98","mrkr99","mrkr198","mrkr199","mrkr200","mrkr201","mrkr202","mrkr203","mrkr204","mrkr205","mrkr100","mrkr101","mrkr102","mrkr103","mrkr106","mrkr107","mrkr108","mrkr109","mrkr110","mrkr111","mrkr112","mrkr113","mrkr114","mrkr115","mrkr116","mrkr117","mrkr118","mrkr119","mrkr86","mrkr87","mrkr120","mrkr121","mrkr122","mrkr123","mrkr124","mrkr125","mrkr126","mrkr127","mrkr128","mrkr129","mrkr130","mrkr131","mrkr132","mrkr133","mrkr134","mrkr135","mrkr136","mrkr137","mrkr138","mrkr139","mrkr140","mrkr141","mrkr142","mrkr143","mrkr144","mrkr145","mrkr146","mrkr147","mrkr148","mrkr149","mrkr150","mrkr151","mrkr152","mrkr153","mrkr154","mrkr155","mrkr156","mrkr157","mrkr158","mrkr159","mrkr160","mrkr161","mrkr162","mrkr163","mrkr164","mrkr165","mrkr166","mrkr167","mrkr168","mrkr169","mrkr170","mrkr171","mrkr172","mrkr173","mrkr174","mrkr175","mrkr176","mrkr177","mrkr178","mrkr179","mrkr180","mrkr181","mrkr182","mrkr183","mrkr184","mrkr185","mrkr186","mrkr187","mrkr188","mrkr189","mrkr190","mrkr191","mrkr192","mrkr193","mrkr194","mrkr195","mrkr196","mrkr70","mrkr104","mrkr105","mrkr226","mrkr69","mrkr254","mrkr255","mrkr256","mrkr197","mrkr206","mrkr207","mrkr208","mrkr209","mrkr210","mrkr211","mrkr212","mrkr213","mrkr214","mrkr215","mrkr216","mrkr217","mrkr218","mrkr219","mrkr220","mrkr221","mrkr222","mrkr223","mrkr224","mrkr225","mrkr228","mrkr227","mrkr229","mrkr229","mrkr230","mrkr231","mrkr232","mrkr233","mrkr234","mrkr235","mrkr236","mrkr237","mrkr238","mrkr239","mrkr240","mrkr241","mrkr242","mrkr244","mrkr246","mrkr243","mrkr245","mrkr247","mrkr248","mrkr249","mrkr250","mrkr251","mrkr252","mrkr253","mrkr257","mrkr258","mrkr259","mrkr260","mrkr261","mrkr262","mrkr263","mrkr264","mrkr265","mrkr266","mrkr267","mrkr268","mrkr269","mrkr270","mrkr271","mrkr272","mrkr273","mrkr274","mrkr275","mrkr276","mrkr277","mrkr278","mrkr279","mrkr280","mrkr281","mrkr282","mrkr283","mrkr284","mrkr285","mrkr286","mrkr287","mrkr288","mrkr289","mrkr290","mrkr291","mrkr292","mrkr293","mrkr294","mrkr295","mrkr296","mrkr297","mrkr298","mrkr299","mrkr300","mrkr301","mrkr302","mrkr303","mrkr304","mrkr398","mrkr399","mrkr400","mrkr401","mrkr402","mrkr403","mrkr404","mrkr405","mrkr406","mrkr407","mrkr408","mrkr409","mrkr410","mrkr411","mrkr412","mrkr413","mrkr414","mrkr415","mrkr416","mrkr417","mrkr418","mrkr419","mrkr333","mrkr334","mrkr335","mrkr305","mrkr306","mrkr307","mrkr308","mrkr309","mrkr310","mrkr311","mrkr312","mrkr313","mrkr314","mrkr315","mrkr316","mrkr317","mrkr318","mrkr319","mrkr320","mrkr321","mrkr322","mrkr323","mrkr324","mrkr325","mrkr326","mrkr327","mrkr328","mrkr329","mrkr330","mrkr331","mrkr332","mrkr336","mrkr337","mrkr338","mrkr339","mrkr340","mrkr341","mrkr342","mrkr344","mrkr343","mrkr345","mrkr346","mrkr347","mrkr348","mrkr349","mrkr350","mrkr351","mrkr352","mrkr353","mrkr354","mrkr355","mrkr356","mrkr357","mrkr358","mrkr359","mrkr360","mrkr361","mrkr362","mrkr363","mrkr364","mrkr365","mrkr366","mrkr367","mrkr368","mrkr369","mrkr370","mrkr371","mrkr372","mrkr373","mrkr374","mrkr375","mrkr378","mrkr379","mrkr380","mrkr376","mrkr377","mrkr381","mrkr382","mrkr383","mrkr384","mrkr385","mrkr386","mrkr387","mrkr388","mrkr389","mrkr390","mrkr391","mrkr392","mrkr393","mrkr394","mrkr395","mrkr396","mrkr397","mrkr420","mrkr421","mrkr422","mrkr423","mrkr424","mrkr425","mrkr426","mrkr427","mrkr428","mrkr429","mrkr430","mrkr431","mrkr432","mrkr433","mrkr434","mrkr435","mrkr436","mrkr437","mrkr438","mrkr439","mrkr440","mrkr441","mrkr442","mrkr443","mrkr444","mrkr445","mrkr446","mrkr447","mrkr448","mrkr449","mrkr450","mrkr451","mrkr452","mrkr453","mrkr454","mrkr455","mrkr456","mrkr457","mrkr458","mrkr459","mrkr460","mrkr461","mrkr462","mrkr463","mrkr464","mrkr465","mrkr466","mrkr466","mrkr467","mrkr468","mrkr469","mrkr470","mrkr471","mrkr472","mrkr473","mrkr474","mrkr475","mrkr476","mrkr477","mrkr478","mrkr479","mrkr480","mrkr481","mrkr482","mrkr483","mrkr484","mrkr485","mrkr486","mrkr487","mrkr488","mrkr489","mrkr490","mrkr491","mrkr492","mrkr493","mrkr494","mrkr495","mrkr496","mrkr497","mrkr498","mrkr499","mrkr500","mrkr501","mrkr502","mrkr503","mrkr504","mrkr505","mrkr506","mrkr507","mrkr508","mrkr509","mrkr510","mrkr511","mrkr512","mrkr513","mrkr514","mrkr515","mrkr516","mrkr517","mrkr518","mrkr519","mrkr520","mrkr521","mrkr522","mrkr523","mrkr524","mrkr525","mrkr526","mrkr527","mrkr528","mrkr529","mrkr530","mrkr531","mrkr531","mrkr532","mrkr533","mrkr534","mrkr535","mrkr536","mrkr537","mrkr538","mrkr539","mrkr540","mrkr541","mrkr542","mrkr543","mrkr544","mrkr545","mrkr546","mrkr547","mrkr548","mrkr549","mrkr550","mrkr551","mrkr552","mrkr553","mrkr554","mrkr555","mrkr556","mrkr557","mrkr558","mrkr559","mrkr560","mrkr561","mrkr562","mrkr563","mrkr564","mrkr565","mrkr566","mrkr567","mrkr568","mrkr569","mrkr570","mrkr571","mrkr572","mrkr573","mrkr574","mrkr575","mrkr576","mrkr577","mrkr578","mrkr579","mrkr580","mrkr581","mrkr582","mrkr583","mrkr584","mrkr585","mrkr586","mrkr587","mrkr588","mrkr589","mrkr590","mrkr591","mrkr592","mrkr593","mrkr594","mrkr595","mrkr596","mrkr597","mrkr598","mrkr599","mrkr600","mrkr601","mrkr602","mrkr603","mrkr604","mrkr605","mrkr606","mrkr607","mrkr608","mrkr609","mrkr610","mrkr611","mrkr612","mrkr613","mrkr614","mrkr615","mrkr616","mrkr617","mrkr618","mrkr619","mrkr620","mrkr621","mrkr622","mrkr623","mrkr624","mrkr625","mrkr626","mrkr627","mrkr628","mrkr629","mrkr630","mrkr631","mrkr632","mrkr633","mrkr634","mrkr635","mrkr636","mrkr637","mrkr638","mrkr639","mrkr640","mrkr641","mrkr642","mrkr643","mrkr644","mrkr645","mrkr646","mrkr647","mrkr648","mrkr649","mrkr650","mrkr651","mrkr652","mrkr653","mrkr654","mrkr655","mrkr655","mrkr656","mrkr657","mrkr658","mrkr659","mrkr660","mrkr661","mrkr662","mrkr663","mrkr664","mrkr665","mrkr666","mrkr667","mrkr668","mrkr669","mrkr670","mrkr671","mrkr672","mrkr673","mrkr674","mrkr675","mrkr675","mrkr676","mrkr677","mrkr678","mrkr679","mrkr680","mrkr681","mrkr682","mrkr683","mrkr684","mrkr685","mrkr686","mrkr687","mrkr688","mrkr689","mrkr690","mrkr691","mrkr692","mrkr693","mrkr694","mrkr695","mrkr696","mrkr697","mrkr698","mrkr699","mrkr700","mrkr701","mrkr702","mrkr703","mrkr704","mrkr705","mrkr706","mrkr707","mrkr708","mrkr709","mrkr710","mrkr711","mrkr712","mrkr713","mrkr714","mrkr715","mrkr716","mrkr717","mrkr718","mrkr719","mrkr720","mrkr721","mrkr722","mrkr723","mrkr724","mrkr725","mrkr726","mrkr727","mrkr728","mrkr729","mrkr730","mrkr731","mrkr732","mrkr733","mrkr734","mrkr735","mrkr736","mrkr737","mrkr738","mrkr739","mrkr740","mrkr741","mrkr742","mrkr743","mrkr744","mrkr745","mrkr746","mrkr747","mrkr748","mrkr749","mrkr750","mrkr751","mrkr752","mrkr753","mrkr754","mrkr755","mrkr756","mrkr757","mrkr758","mrkr759","mrkr760","mrkr761","mrkr762","mrkr763","mrkr764","mrkr765","mrkr766","mrkr767","mrkr768","mrkr769","mrkr770","mrkr771","mrkr772","mrkr773","mrkr774","mrkr775","mrkr776","mrkr777","mrkr778","mrkr779","mrkr780","mrkr781","mrkr782","mrkr783","mrkr784","mrkr785","mrkr786","mrkr787","mrkr788","mrkr789","mrkr790","mrkr791","mrkr792","mrkr793","mrkr794","mrkr795","mrkr796","mrkr797","mrkr798","mrkr799","mrkr800","mrkr801","mrkr802","mrkr803","mrkr804","mrkr805","mrkr806","mrkr807","mrkr808","mrkr809","mrkr810","mrkr811","mrkr812","mrkr813","mrkr814","mrkr815","mrkr816","mrkr817","mrkr818","mrkr819","mrkr820","mrkr821","mrkr822","mrkr823","mrkr824","mrkr825","mrkr826","mrkr827","mrkr828","mrkr829","mrkr830","mrkr831","mrkr832","mrkr833","mrkr834","mrkr835","mrkr836","mrkr837","mrkr838","mrkr839","mrkr840","mrkr841","mrkr842","mrkr843","mrkr844","mrkr845","mrkr846","mrkr847","mrkr848","mrkr849","mrkr850","mrkr851","mrkr852","mrkr853","mrkr854","mrkr855","mrkr856","mrkr857","mrkr858","mrkr859","mrkr860","mrkr862","mrkr863","mrkr864","mrkr865","mrkr866","mrkr867","mrkr868","mrkr869","mrkr870","mrkr871","mrkr872","mrkr873","mrkr874","mrkr875","mrkr876","mrkr877","mrkr878","mrkr879","mrkr880","mrkr881","mrkr882","mrkr883","mrkr884","mrkr885","mrkr886","mrkr887","mrkr888","mrkr889","mrkr890","mrkr891","mrkr892","mrkr893","mrkr894","mrkr895","mrkr896","mrkr897","mrkr898","mrkr899","mrkr900","mrkr901","mrkr902","mrkr903","mrkr904","mrkr905","mrkr906","mrkr907","mrkr908","mrkr909","mrkr910","mrkr911","mrkr912","mrkr913","mrkr914","mrkr915","mrkr916","mrkr917","mrkr918","mrkr919","mrkr920","mrkr921","mrkr922","mrkr923","mrkr924","mrkr925","mrkr926","mrkr927","mrkr928","mrkr929","mrkr930","mrkr931","mrkr932","mrkr933","mrkr934","mrkr935","mrkr936","mrkr937","mrkr938","mrkr939","mrkr940","mrkr941","mrkr942","mrkr943","mrkr944","mrkr945","mrkr946","mrkr947"];publicVariable "all_eos_mkrs";//invisible eos markers excluded
			//all_civ_eos_mkrs = ["civmkr1","civmkr2","civmkr3","civmkr4","civmkr5","civmkr6","civmkr7","civmkr8","civmkr9","civmkr10","civmkr11","civmkr12","civmkr13","civmkr14","civmkr15","civmkr16"];publicVariable "all_civ_eos_mkrs";
		};
		case (toLower (worldName) isEqualTo "stratis"):
		{
			Airfield_opt = false;publicVariable "Airfield_opt";
			Rand_AirCntr_OFstMax = 3000;publicVariable "Rand_AirCntr_OfstMax";
			Del_box_Pos = [2649.7,664.077,0.00126648];publicVariable "Del_box_Pos";
			all_eos_mkrs = ["m1","m2","m3","m4","m5","m6","m7","m8","m9","m10","m11","m12","m13","m14","m15","m16","m17","m18","m19","m20","m21","m22","m23","m24","m25","m26","m27","m28","m29","m30","m31","m32","m33","m34","m35","m36","m37","m38","m39","m40","m41","m42","m43","m44","m45","m46","m47","m48","m49","m50","m51","m52","m53","m54","m55","m56","m57","m58","m59","m60","m61","m62","m63","m64","m65","m66","m67","m68","m69","m70","m71","m72","m73","m74","m75","m76","m77","m78","m79","m80","m81","m82","m83","m84","m85","m86","m87","m88","m89","m90","m91","m92","m93","m94","m95","m96","m97","m98","m99","m100","m102","m103"];publicVariable "all_eos_mkrs";//invisible eos markers excluded
			//all_civ_eos_mkrs = ["civmkr1","civmkr2","civmkr3","civmkr4","civmkr5","civmkr6","civmkr7","civmkr8","civmkr9","civmkr10","civmkr11","civmkr12","civmkr13","civmkr14","civmkr15","civmkr16","civmkr17"];publicVariable "all_civ_eos_mkrs";
		};
	};
	//intel_objCount = (round((count all_eos_mkrs)/Intel_Count));publicVariable "intel_objCount";//total max suitcases per ammo cache
	side_mission_mkrs = ["sidemiss1","sidemiss2","sidemiss3","sidemiss4","sidemiss5","sidemiss6","sidemiss7","sidemiss8","sidemiss9","sidemiss10","sidemiss11","sidemiss12","sidemiss13","sidemiss14","sidemiss15"];publicVariable "side_mission_mkrs";// all objective markers
	objective_objs = ["Land_TTowerBig_1_F","Land_BagBunker_Tower_F","Land_UWreck_MV22_F","Land_HighVoltageTower_F","APERSBoundingMine","O_APC_Tracked_02_AA_F","RoadCone_F","RoadCone_F","Land_Sign_WarningUnexplodedAmmo_F","Land_Cargo_HQ_V3_F"];publicVariable "objective_objs";// objective/mission objects (do not change array index order!)
	objective_list = ["comms_tower","kill_leader","rescue_pilot","cut_power","mine_field","destroy_convoy","destroy_armed_convoy","destroy_mortar_squad","c_n_h"];publicVariable "objective_list";// all objectives (do not change array index order!)
	objective_ruins = ["Land_TTowerBig_1_ruins_F","Land_TTowerBig_2_ruins_F","Land_Cargo40_color_V3_ruins_F","Land_HighVoltageTower_dam_F","Land_Cargo_HQ_V3_ruins_F"];publicVariable "objective_ruins";// Objective/mission ruins models
	all_intel_mkrs = [];publicVariable "all_intel_mkrs";
	intel_objArray = [];publicVariable "intel_objArray";
	PVEH_NetSay3D = [objNull,0];publicVariable "PVEH_NetSay3D";
	BTC_to_server = [];publicVariable "BTC_to_server";
	suicide_bmbr_weps = ["ModuleExplosive_SatchelCharge_F"];
	cache_types = ["Box_East_Ammo_F","Box_IND_Ammo_F","Box_FIA_Ammo_F","Land_Pallet_MilBoxes_F"];
	INS_log_blacklist = [INS_Wep_box,INS_flag,INS_nade_Nbox,INS_ammo_Nbox,INS_weps_Nbox,INS_launchers_Nbox,INS_sup_Nbox,INS_weps_Cbox,INS_ammo_Cbox,INS_nade_Cbox,INS_launchers_Cbox,INS_demo_Cbox,INS_sup_Cbox];//Logistics object names blacklist //Delivery_Box,
};

// Class Arrays /////////////////////////////////////////////////////
// Csat
if (INS_op_faction isEqualTo 1) then
{
	INS_Op4_side = EAST;
	INS_men_list = ["O_SoldierU_SL_F","O_soldierU_repair_F","O_soldierU_medic_F","O_sniper_F","O_Soldier_A_F","O_Soldier_AA_F","O_Soldier_AAA_F","O_Soldier_AAR_F","O_Soldier_AAT_F","O_Soldier_AR_F","O_Soldier_AT_F","O_soldier_exp_F","O_Soldier_F","O_engineer_F","O_engineer_U_F","O_medic_F","O_recon_exp_F","O_recon_F","O_recon_JTAC_F","O_recon_LAT_F","O_recon_M_F","O_recon_medic_F","O_recon_TL_F"];
	INS_Op4_medic = "O_soldierU_medic_F";
	INS_Op4_Eng = "O_soldierU_repair_F";
	INS_Op4_pilot = ["O_helipilot_F"];
	INS_Op4_Veh_Light = ["O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_G_Offroad_01_armed_F","O_APC_Wheeled_02_rcws_F"];
	INS_Op4_Veh_Tracked = ["O_APC_Tracked_02_cannon_F","O_APC_Tracked_02_AA_F","O_MBT_02_cannon_F"];
	INS_Op4_Veh_Support = ["O_Truck_02_Ammo_F","O_Truck_02_fuel_F","O_Truck_02_box_F","O_Truck_02_medical_F"];
	INS_Op4_Veh_AA = ["O_APC_Tracked_02_AA_F"];
	INS_Op4_stat_weps = ["O_GMG_01_high_F","O_HMG_01_high_F","O_static_AT_F","O_static_AA_F","O_HMG_01_A_F","O_GMG_01_F","O_G_Mortar_01_F"];//A3 East static weapons
	INS_civlist = ["C_man_p_beggar_F","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_hunter_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F"];// A3 Civilians
	//INS_civClothes = ["U_Competitor","U_C_HunterBody_grn","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poor_1","U_C_Poor_2","U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_IG_Guerilla3_2","U_NikosBody","U_Rangemaster"];// A3 Civilian Clothes
};

// AAF
if (INS_op_faction isEqualTo 2) then
{
	INS_Op4_side = RESISTANCE;
	INS_men_list = ["I_soldier_F","I_Soldier_lite_F","I_soldier_AT_F","I_soldier_GL_F","I_soldier_LAT_F","I_soldier_exp_F","I_soldier_F","I_soldier_AR_F","I_soldier_repair_F","I_soldier_LAT_F","I_soldier_AR_F","I_soldier_M_F","I_soldier_AT_F","I_soldier_AA_F","I_soldier_F","I_soldier_TL_F","I_medic_F","I_soldier_GL_F","I_soldier_F"];
	INS_Op4_medic = "I_medic_F";
	INS_Op4_Eng = "I_soldier_repair_F";
	INS_Op4_pilot = ["I_pilot_F"];
	INS_Op4_Veh_Light = ["I_G_Offroad_01_armed_F","I_MRAP_03_gmg_F","I_MRAP_03_hmg_F","I_APC_Wheeled_03_cannon_F"];
	INS_Op4_Veh_Tracked = ["I_APC_tracked_03_cannon_F","I_MBT_03_cannon_F"];
	INS_Op4_Veh_Support = ["I_Truck_02_ammo_F","I_Truck_02_fuel_F","I_Truck_02_box_F","I_Truck_02_medical_F"];
	INS_Op4_Veh_AA = ["O_APC_Tracked_02_AA_F"];
	INS_Op4_stat_weps = ["O_GMG_01_high_F","O_HMG_01_high_F","O_static_AT_F","O_static_AA_F","O_HMG_01_A_F","O_GMG_01_F","O_G_Mortar_01_F"];//A3 East static weapons
	INS_civlist = ["C_man_p_beggar_F","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_hunter_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F"];// A3 Civilians
	//INS_civClothes = ["U_Competitor","U_C_HunterBody_grn","U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_redwhite","U_C_Poloshirt_salmon","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poor_1","U_C_Poor_2","U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_IG_Guerilla3_1","U_IG_Guerilla3_2","U_NikosBody","U_Rangemaster"];// A3 Civilian Clothes
};

// REBEL ARMY UNITS and RUSSIAN SPETSNAZ ADVISORS (masi EAST)
if (INS_op_faction isEqualTo 3) then
{
	INS_Op4_side = EAST;
	INS_men_list = ["O_mas_afr_Soldier_F","O_mas_afr_Soldier_GL_F","O_mas_afr_soldier_AR_F","O_mas_afr_soldier_MG_F","O_mas_afr_Soldier_lite_F","O_mas_afr_Soldier_off_F","O_mas_afr_Soldier_SL_F","O_mas_afr_soldier_M_F","O_mas_afr_soldier_LAT_F","O_mas_afr_soldier_LAA_F","O_mas_afr_medic_F","O_mas_afr_soldier_repair_F","O_mas_afr_soldier_exp_F","O_mas_afr_rusadv1_F","O_mas_afr_rusadv2_F","O_mas_afr_rusadv3_F"];
	INS_Op4_medic = "O_mas_afr_medic_F";
	INS_Op4_Eng = "O_mas_afr_soldier_repair_F";
	INS_Op4_pilot = ["O_helipilot_F"];
	INS_Op4_Veh_Light = ["O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_G_Offroad_01_armed_F","O_APC_Wheeled_02_rcws_F"];
	INS_Op4_Veh_Tracked = ["O_APC_Tracked_02_cannon_F","O_APC_Tracked_02_AA_F","O_MBT_02_cannon_F"];
	INS_Op4_Veh_AA = ["O_APC_Tracked_02_AA_F"];
	INS_Op4_Veh_Support = ["O_Truck_02_Ammo_F","O_Truck_02_fuel_F","O_Truck_02_box_F","O_Truck_02_medical_F"];
	INS_Op4_stat_weps = ["O_GMG_01_high_F","O_HMG_01_high_F","O_static_AT_F","O_static_AA_F","O_HMG_01_A_F","O_GMG_01_F","O_G_Mortar_01_F"];//A3 East static weapons
	INS_civlist = ["C_mas_afr_1","C_mas_afr_2","C_mas_afr_3","C_mas_afr_4","C_mas_afr_5","C_mas_afr_6","C_mas_afr_7","C_mas_afr_8","C_mas_afr_9","C_mas_afr_10"];// Masi African Civilians
	//INS_civClothes = ["U_mas_afr_C_Civil1","U_mas_afr_C_Civil2","U_mas_afr_C_Civil3","U_mas_afr_C_Civil4","U_mas_afr_C_Civil5","U_mas_afr_C_Civil6","U_mas_afr_C_Civil7","U_mas_afr_C_Civil8","U_mas_afr_C_Civil9", "U_mas_afr_C_Civil10"];// Masi African Civilian Clothes
};

// CAF Aggressors Middle Eastern
if (INS_op_faction isEqualTo 4) then
{
	INS_Op4_side = EAST;
	INS_men_list = ["CAF_AG_ME_T_AK47","CAF_AG_ME_T_AK74","CAF_AG_ME_T_GL","CAF_AG_ME_T_PKM","CAF_AG_ME_T_RPG","CAF_AG_ME_T_RPK74","CAF_AG_ME_T_SVD"];
	INS_Op4_medic = "CAF_AG_ME_T_AK47";//placeholder
	INS_Op4_Eng = "CAF_AG_ME_T_AK47";//placeholder
	INS_Op4_pilot = ["O_helipilot_F"];
	INS_Op4_Veh_Light = ["O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_G_Offroad_01_armed_F","O_APC_Wheeled_02_rcws_F"];
	INS_Op4_Veh_Tracked = ["O_APC_Tracked_02_cannon_F","O_APC_Tracked_02_AA_F","O_MBT_02_cannon_F"];
	INS_Op4_Veh_Support = ["O_Truck_02_Ammo_F","O_Truck_02_fuel_F","O_Truck_02_box_F","O_Truck_02_medical_F"];
	INS_Op4_Veh_AA = ["O_APC_Tracked_02_AA_F"];
	INS_Op4_stat_weps = ["O_GMG_01_high_F","O_HMG_01_high_F","O_static_AT_F","O_static_AA_F","O_HMG_01_A_F","O_GMG_01_F","O_G_Mortar_01_F"];//A3 East static weapons
	INS_civlist = ["CAF_AG_ME_CIV","CAF_AG_ME_CIV_02","CAF_AG_ME_CIV_03","CAF_AG_ME_CIV_04"];// CAF ME Civilians
	INS_civClothes = ["U_CAF_AG_ME_ROBES_01","U_CAF_AG_ME_ROBES_01a","U_CAF_AG_ME_ROBES_01b","U_CAF_AG_ME_ROBES_01c","U_CAF_AG_ME_ROBES_01d","U_CAF_AG_ME_ROBES_02","U_CAF_AG_ME_ROBES_02a","U_CAF_AG_ME_ROBES_02b","U_CAF_AG_ME_ROBES_02c","U_CAF_AG_ME_ROBES_02d","U_CAF_AG_ME_ROBES_03","U_CAF_AG_ME_ROBES_03a","U_CAF_AG_ME_ROBES_03b","U_CAF_AG_ME_ROBES_03c","U_CAF_AG_ME_ROBES_03d","U_CAF_AG_ME_ROBES_04","U_CAF_AG_ME_ROBES_04a","U_CAF_AG_ME_ROBES_04b","U_CAF_AG_ME_ROBES_04c","U_CAF_AG_ME_ROBES_04d","U_CAF_AG_ME_ROBES_mil_01","U_CAF_AG_ME_ROBES_mil_01a"];// CAF ME Civilian Clothes
	INS_civHeadgear = ["H_CAF_AG_TURBAN","H_CAF_AG_PAKTOL","H_CAF_AG_PAKTOL_01","H_CAF_AG_PAKTOL_02","H_CAF_AG_PAKTOL_03","H_CAF_AG_WRAP"];// CAF ME Civilian HeadGear
};

// Middle Eastern Conflict - SYRIAN ARAB ARMY
if ((INS_op_faction isEqualTo 5) || (INS_op_faction isEqualTo 6)) then
{
	INS_Op4_side = EAST;
	INS_men_list = ["MEC_SAA_Rifleman","MEC_SAA_SquadLeader","MEC_SAA_MachineGunner","MEC_SAA_AutomaticRifleman","MEC_SAA_Grenadier","MEC_SAA_ATSoldier","MEC_SAA_RPG7Soldier","MEC_SAA_AASoldier","MEC_SAA_Medic","MEC_SAA_Marksman","MEC_SAA_Crewman","MEC_SAA_RPG7Grenadier","MEC_SAA_Repair","MEC_SAA_Engineer","MEC_SAA_Explosives","MEC_SAA_Officer"];
	INS_Op4_medic = "MEC_SAA_Medic";
	INS_Op4_Eng = "MEC_SAA_Engineer";
	INS_Op4_pilot = ["MEC_SAA_Crewman"];
	INS_Op4_Veh_Light = ["MEC_SAA_Offroad_01","MEC_SAA_Offroad_01_armed","MEC_IRR_Offroad_01_armed_FO","MEC_IRR_Offroad_01s_armed_FO"];
	INS_Op4_Veh_Tracked = ["MEC_SAA_T72","MEC_SAA_BMP1","MEC_SAA_BMP2","MEC_SAA_T55"];
	INS_Op4_Veh_Support = ["O_Truck_02_Ammo_F","O_Truck_02_fuel_F","O_Truck_02_box_F","O_Truck_02_medical_F"];
	INS_Op4_Veh_AA = ["MEC_SAA_ZSU23"];
	INS_Op4_stat_weps = ["MEC_SAA_ZU23","MEC_SAA_AGS","MEC_SAA_SPG9","MEC_SAA_DSHKM","MEC_SAA_DSHkM_Mini_TriPod","MEC_SAA_KORD","MEC_SAA_KORD_high","MEC_SAA_Metis","MEC_SAA_Igla_AA_pod","MEC_SAA_2b14_82mm","MEC_SAA_D30","MEC_SAA_D30_AT"];
	INS_civlist = ["MEC_CIV_Man"];
	//INS_civClothes = [];
};

// Middle Eastern Conflict - Taliban
if (INS_op_faction isEqualTo 7) then
{
	INS_Op4_side = RESISTANCE;
	INS_men_list = ["MEC_TAL_AASoldier","MEC_TAL_ATSoldier","MEC_TAL_AutomaticRifleman","MEC_TAL_Crewman","MEC_TAL_Engineer","MEC_TAL_Explosives","MEC_TAL_Grenadier","MEC_TAL_MachineGunner","MEC_TAL_Marksman","MEC_TAL_Medic","MEC_TAL_Repair","MEC_TAL_Rifleman","MEC_TAL_RPG7Grenadier","MEC_TAL_RPG7Soldier","MEC_TAL_SquadLeader"];
	INS_Op4_medic = "MEC_TAL_Medic";
	INS_Op4_Eng = "MEC_TAL_Engineer";
	INS_Op4_pilot = ["MEC_SAA_Pilot"];
	INS_Op4_Veh_Light = ["MEC_TAL_Offroad_01_armed_F","MEC_TAL_Offroad_01_F","MEC_TAL_Offroad_01s_armed_F","MEC_TAL_Offroad_01s_F"];
	INS_Op4_Veh_Tracked = ["MEC_SAA_T72","MEC_SAA_BMP1","MEC_SAA_BMP2","MEC_SAA_T55"];
	INS_Op4_Veh_Support = ["O_Truck_02_Ammo_F","O_Truck_02_fuel_F","O_Truck_02_box_F","O_Truck_02_medical_F"];
	INS_Op4_Veh_AA = ["MEC_SAA_ZSU23"];
	INS_Op4_stat_weps = ["MEC_SAA_ZU23","MEC_SAA_AGS","MEC_SAA_SPG9","MEC_SAA_DSHKM","MEC_SAA_DSHkM_Mini_TriPod","MEC_SAA_KORD","MEC_SAA_KORD_high","MEC_SAA_Metis","MEC_SAA_Igla_AA_pod","MEC_SAA_2b14_82mm","MEC_SAA_D30","MEC_SAA_D30_AT"];
	INS_civlist = ["C_man_p_beggar_F","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_hunter_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F"];// A3 Civilians
	//INS_civClothes = [];
};

// East vs West mod - SUD Russians
if (INS_op_faction isEqualTo 8) then
{
	INS_Op4_side = EAST;
	INS_men_list = ["SUD_USSR_Soldier_TL","SUD_USSR_Soldier_AR","SUD_USSR_Soldier_GL","SUD_USSR_Soldier_AT","SUD_USSR_Soldier_HAT","SUD_USSR_Soldier","SUD_USSR_Soldier_Medic","SUD_USSR_Soldier_Crew","SUD_USSR_Soldier_Specop","SUD_USSR_Soldier_AA","SUD_USSR_Soldier_Repair","SUD_USSR_Soldier_Sapper"];
	INS_Op4_medic = "SUD_USSR_Soldier_Medic";
	INS_Op4_Eng = "SUD_USSR_Soldier_Repair";
	INS_Op4_pilot = ["SUD_USSR_Soldier_Pilot"];
	INS_Op4_Veh_Light = ["SUD_UAZ","SUD_BRDM2","SUD_URAL","SUD_BTR60"];
	INS_Op4_Veh_Tracked = ["SUD_BMP2","SUD_T72B","SUD_ZSU"];
	INS_Op4_Veh_Support = ["O_Truck_02_Ammo_F","O_Truck_02_fuel_F","O_Truck_02_box_F","O_Truck_02_medical_F"];
	INS_Op4_Veh_AA = ["SUD_ZSU"];
	INS_Op4_stat_weps = ["RDS_ZU23_CSAT","RDS_AGS_CSAT","RDS_SPG9_CSAT","RDS_DSHKM_CSAT","RDS_DSHkM_Mini_TriPod_CSAT","RDS_KORD_CSAT","RDS_KORD_high_CSAT","RDS_Metis_CSAT","RDS_Igla_AA_pod_CSAT","RDS_2b14_82mm_CSAT","RDS_D30_CSAT","RDS_D30_AT_CSAT"];
	INS_civlist = ["C_man_p_beggar_F","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_hunter_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F"];// A3 Civilians
	//INS_civClothes = [];
};

// RHS - Armed Forces of the Russian Federation MSV
if (INS_op_faction isEqualTo 9) then
{
	INS_Op4_side = EAST;
	INS_men_list = ["rhs_msv_crew","rhs_msv_crew_commander","rhs_msv_armoredcrew","rhs_msv_combatcrew","rhs_msv_rifleman","rhs_msv_efreitor","rhs_msv_grenadier","rhs_msv_machinegunner","rhs_msv_machinegunner_assistant","rhs_msv_at","rhs_msv_strelok_rpg_assist","rhs_msv_marksman","rhs_msv_officer_armored","rhs_msv_officer","rhs_msv_junior_sergeant","rhs_msv_sergeant","rhs_msv_engineer","rhs_msv_driver_armored","rhs_msv_driver","rhs_msv_aa","rhs_msv_medic","rhs_msv_LAT"];
	INS_Op4_medic = "rhs_msv_medic";
	INS_Op4_Eng = "rhs_msv_engineer";
	INS_Op4_pilot = ["rhs_pilot"];
	INS_Op4_Veh_Light = ["rhs_btr60_msv","rhs_btr70_msv","rhs_btr80_msv","rhs_btr80a_msv"];
	INS_Op4_Veh_Tracked = ["rhs_sprut_vdv","rhs_bmp1p_msv","rhs_brm1k_msv","rhs_bmp2_msv","rhs_bmp2e_msv","rhs_bmp2d_msv","rhs_bmp2k_msv","rhs_prp3_msv","rhs_bmd4_vdv","rhs_bmd4ma_vdv","rhs_t80u","rhs_t80bv","rhs_t80a","rhs_t72bc_tv","rhs_t72bb_tv","rhs_zsu234_aa"];
	INS_Op4_Veh_Support = ["RHS_Ural_MSV_01","RHS_Ural_Fuel_MSV_01","RHS_Ural_VDV_01","rhs_typhoon_vdv","rhs_gaz66_repair_vdv","RHS_Ural_Open_MSV_01"];
	INS_Op4_Veh_AA = ["rhs_zsu234_aa"];
	INS_Op4_stat_weps = ["O_GMG_01_high_F","O_HMG_01_high_F","O_static_AT_F","O_static_AA_F","O_HMG_01_A_F","O_GMG_01_F","O_G_Mortar_01_F"];//A3 East static weapons
	INS_civlist = ["C_man_p_beggar_F","C_man_1","C_man_polo_1_F","C_man_polo_2_F","C_man_polo_3_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_6_F","C_man_shorts_1_F","C_man_1_1_F","C_man_1_2_F","C_man_1_3_F","C_man_p_fugitive_F","C_man_p_shorts_1_F","C_man_hunter_1_F","C_man_shorts_2_F","C_man_shorts_3_F","C_man_shorts_4_F"];// A3 Civilians
	//INS_civClothes = [];
};

// Air classes used by AirPatrolEast.sqf
INS_Op4_A3_fixedWing = ["RHS_Su25SM_KH29_vvsc"];
INS_Op4_A3_helis = 	["RHS_Mi24V_vvsc","RHS_Mi8AMTSh_UPK23_vvsc"];
INS_OP4_mod_fixedWing = ["JS_JC_SU35","IVORY_MIG29K_1","RHS_Su25SM_vvsc"];
INS_OP4_mod_helis = ["RHS_Mi24P_vvsc","RHS_Mi24V_vvsc"];

INS_lights = ["Lamps_Base_F","PowerLines_base_F","Land_PowerPoleWooden_F","Land_LampHarbour_F","Land_LampShabby_F","Land_PowerPoleWooden_L_F","Land_PowerPoleWooden_small_F","Land_LampDecor_F","Land_LampHalogen_F","Land_LampSolar_F","Land_LampStreet_small_F","Land_LampStreet_F","Land_LampAirport_F","Land_PowerPoleWooden_L_F"];

// Civilian Vehicles
MAD_civCarList = ["C_Hatchback_01_F","C_Offroad_01_F","C_Quadbike_01_F","C_SUV_01_F"];
MAD_comCarList = ["C_Van_01_box_F","C_Van_01_transport_F","C_Van_01_fuel_F"];

// Blufor Side
INS_Blu_side = WEST;

// Player class types
INS_W_PlayerEng = ["B_engineer_F","B_soldier_repair_F","B_mas_mar_soldier_repair_F_v","B_mas_mar_soldier_repair_F_d","B_recon_exp_F"];// can build FARP
INS_W_PlayerJTAC = ["B_recon_TL_F","B_recon_JTAC_F","B_Soldier_SL_F","B_Soldier_TL_F","B_support_Mort_F","B_mas_mar_Soldier_JTAC_F_d","B_mas_mar_Soldier_JTAC_F_v","B_mas_mar_Soldier_TL_F_rec_d","B_mas_mar_Soldier_TL_F_rec_v","B_mas_mar_Soldier_F_rec_v","B_officer_F"];// can call in CAS
INS_W_PlayerMedic = ["B_medic_F","B_recon_medic_F","B_mas_mar_medic_F_v","B_mas_mar_medic_F_d","B_mas_mar_medic_F_rec_d","B_mas_mar_medic_F_rec_v","B_mas_mar_medic_F_rec_vn"];// can build sandbag
INS_W_PlayerEOD = ["B_engineer_F","B_soldier_repair_F","B_soldier_exp_F","B_mas_mar_soldier_exp_F_rec_d","B_mas_mar_soldier_exp_F_rec_dn","B_mas_mar_soldier_exp_F_d","B_mas_mar_soldier_repair_F_d","B_mas_mar_soldier_exp_F_rec_v","B_mas_mar_soldier_exp_F_v","B_recon_exp_F"];//can deactivate mines/IEDs and use mine detector script
INS_W_PlayerUAVop = ["B_soldier_UAV_F","B_mas_mar_Soldier_UAV_F_v","B_mas_mar_Soldier_UAV_F_d"];// can call in UGV air drop and use huntIR
INS_W_PlayerSniper = ["B_recon_M_F","B_spotter_F","B_sniper_F","B_soldier_M_F","B_mas_mar_soldier_Sg_F_v","B_mas_mar_soldier_Mhg_F_v","B_mas_mar_soldier_M_F_v","B_mas_mar_soldier_M_F_d","B_mas_mar_soldier_Mhg_F_d","B_mas_mar_soldier_Sg_F_d","B_mas_mar_soldier_M_F_rec_d","B_mas_mar_soldier_M_F_rec_v","B_Recon_Sharpshooter_F"];// can use bullet cam
INS_op4_players = "O_medic_F";// Opfor players "O_Soldier_F","O_medic_F","o_soldier_universal_f"
INS_all_medics = ["O_medic_F","B_medic_F","B_recon_medic_F","B_mas_mar_medic_F_v","B_mas_mar_medic_F_d","B_mas_mar_medic_F_rec_d","B_mas_mar_medic_F_rec_v","B_mas_mar_medic_F_rec_vn"];

// Blufor Repair Trucks/Tanks
INS_W_repairTruck = ["B_Truck_01_Repair_F","B_APC_Tracked_01_CRV_F"];

// Liftable object
BTC_fob_materials = ["Land_Cargo20_military_green_F"];// "Box_NATO_AmmoVeh_F" "Land_CargoBox_V1_F"