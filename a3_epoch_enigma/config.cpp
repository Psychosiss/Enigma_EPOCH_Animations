
class CfgPatches
{
	class a3_epoch_enigma {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"A3_epoch_config","A3_server_settings"};
		author[]= {"Happydayz_EngimaTeam"};
	};
};
class CfgFunctions
{
	class EnigmaTeam
	{
		class main
		{
			file = "\a3_epoch_enigma\init";
			class init
			{
				preInit = 1;
			};
			class postinit
			{
				postInit = 1;
			};
		};
	};
};
