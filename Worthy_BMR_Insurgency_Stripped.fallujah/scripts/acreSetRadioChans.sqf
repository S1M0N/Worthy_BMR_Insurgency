//ACRE RADIO LABLES FOR 148 AND 152 RADIOS

//GET CURRENT PRESET
["ACRE_PRC148", "default", "example1"] call acre_api_fnc_copyPreset;
["ACRE_PRC152", "default", "example1"] call acre_api_fnc_copyPreset;
["ACRE_PRC343", "default", "example1"] call acre_api_fnc_copyPreset;

//RENALE ALL CHANNEL NAMES FOR 152 AND 148
["ACRE_PRC152", "example1", 1, "description", "GRNDOPS - GEN"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "example1", 2, "description", "AIROPS - GEN"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "example1", 3, "description", "GRND/AIR COMMS"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "example1", 4, "description", "CMDOPS"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "example1", 5, "description", "GENNET 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "example1", 6, "description", "GENNET 2"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC148", "example1", 1, "label", "GRNDOPS - GEN"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "example1", 2, "label", "AIROPS - GEN"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "example1", 3, "label", "GRND/AIR COMMS"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "example1", 4, "label", "CMDOPS"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "example1", 5, "label", "GENNET 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "example1", 6, "label", "GENNET 2"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC343", "example1", 1, "label", "FT1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC343", "example1", 2, "label", "FT2"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC343", "example1", 3, "label", "FT3"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC343", "example1", 4, "label", "FT4"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC343", "example1", 5, "label", "FT5"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC343", "example1", 6, "label", "FT6"] call acre_api_fnc_setPresetChannelField;

//SAVE NEW PRESET
["ACRE_PRC152", "example1"] call acre_api_fnc_setPreset;
["ACRE_PRC148", "example1"] call acre_api_fnc_setPreset;
["ACRE_PRC343", "example1"] call acre_api_fnc_copyPreset;