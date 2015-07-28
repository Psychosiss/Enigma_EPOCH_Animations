diag_log format['Enigma Epoch: postinit %1',time];

//if(isNil "Epoch_SStart")then{
Epoch_SStart=true;
[]spawn{call compile preprocessFileLineNumbers "\a3_epoch_enigma\init\server_init.sqf";
};
//};
true