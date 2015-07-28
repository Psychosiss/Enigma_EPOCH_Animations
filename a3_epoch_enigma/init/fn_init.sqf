//if !(isNil "Epoch_SStart1")exitWith{false};
Epoch_SStart1=true;

diag_log format['Enigma Epoch: fn_init %1',time];

call compile preprocessFileLineNumbers "\a3_epoch_enigma\init\server_compiles.sqf";
true