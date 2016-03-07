class CfgPatches {
	class A3_exile_zcp {
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"exile_client","exile_server_config"};
	};
};
class CfgFunctions {
	class zcp {
		class main {
			file = "x\addons\ZCP";
			class startZCP
			{
				postInit = 1;
			};
			class config {};
			class missionLooper {};

		};
		class compileFunctions {
			file = "x\addons\ZCP\functions";
			class inDebug {};
			class nearWater {};
			class paraDrop {};
			class start {};
			class findPosition {};
			class cleanupBase {};
			class initCPData {};
			class giveReward {};
			class keepMarker {};
			class createBase {};
			class airbomb {};
			class airstrike {};
			class fly {};
			class spawnAI {};
			class spawnCrate {};
			class fillCrate {};
			class selectMagazine {};
		};
	};
};
