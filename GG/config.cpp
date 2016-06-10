/**
 * config
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

class CfgRemoteExec
{
	class Functions
	{
		mode = 1;
		jip = 0;
		class fnc_AdminReq											{ allowedTargets=2; };
		class ExileServer_system_network_dispatchIncomingMessage 	{ allowedTargets=2; };
		class SA_Simulate_Towing 									{ allowedTargets=0; }; 
		class SA_Attach_Tow_Ropes 									{ allowedTargets=0; }; 
		class SA_Take_Tow_Ropes 									{ allowedTargets=0; }; 
		class SA_Put_Away_Tow_Ropes 								{ allowedTargets=0; }; 
		class SA_Pickup_Tow_Ropes 									{ allowedTargets=0; }; 
		class SA_Drop_Tow_Ropes  									{ allowedTargets=0; }; 
		class SA_Set_Owner 											{ allowedTargets=2; }; 
		class SA_Hint_Success  										{ allowedTargets=1; }; 
		class SA_Hint_Whoops  										{ allowedTargets=1; };
		class SA_Hide_Object_Global  								{ allowedTargets=2; };
		class ExAd_fnc_incomingRequest 								{ allowedTargets=2; };
		class ExAd_fnc_loadVGDetailView 							{ allowedTargets=2; };
		class ExAdServer_fnc_clientRequest 							{ allowedTargets=2; };
	};
	class Commands
	{
		mode=0;
		jip=0;
	};
};

class CfgNotifications
{
  class Success
  {
      description = "%1";
      title = "Success";
      iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
      iconText = "";
      color[] = {0.01,0.61,0.94,1};
      duration = 5;
      priority = 0;
      difficulty[] = {};
  };
  class Whoops
  {
      description = "%1";
      title = "Error";
      iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
      iconText = "";
      color[] = {0.01,0.61,0.94,1};
      duration = 5;
      priority = 0;
      difficulty[] = {};
  };
	class ZCP_Init
	{
		description = "%1";
		title = "Battle Zone Spawned";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		iconText = "";
		color[] = {0.01,0.61,0.94,1};
		duration = 5;
		priority = 0;
		difficulty[] = {};
	};
	class ZCP_Capped
	{
		description = "%1";
		title = "Battle Zone Capped";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		iconText = "";
		color[] = {0.01,0.61,0.94,1};
		duration = 5;
		priority = 0;
		difficulty[] = {};
	};
	class ZCP_Capping
	{
		description = "%1";
		title = "Battle Zone alert";
		iconPicture = "\A3\ui_f\data\map\mapcontrol\taskIcon_ca.paa";
		iconText = "";
		color[] = {0.01,0.61,0.94,1};
		duration = 5;
		priority = 0;
		difficulty[] = {};
	};
};

class CfgClans
{
	/*
		Defines the amount of pop tabs needed to register a new clan

		Default: 20,000
	*/
	registrationFee = 20000;

	/*
		A list of all characters allowed in a clan *name*
	*/
	clanNameAlphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 -!";
};
class Exile_AbstractCraftingRecipe
{
	name = "";
	pictureItem = ""; 
	returnedItems[] = {};
	components[] = {}; // Required components
	tools[] = {}; // Required tools (matches, gas cooker etc.)
	requiredInteractionModelGroup = ""; // See CfgInteractionModels
	requiresOcean = 0; // isSurfaceWater test
	requiresFire = 0; // inflamed object nearby
};

class CfgCraftingRecipes
{
	
class CookBBQSandwich: Exile_AbstractCraftingRecipe
{
	name = "Cook BBQ Sandwich";
	pictureItem = "Exile_Item_BBQSandwich_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
    	{1, "Exile_Item_BBQSandwich_Cooked"}
    };
	tools[] =
	{
         "Exile_Item_CookingPot"
    };
     components[] = 
	{
    	{1, "Exile_Item_BBQSandwich"}
    };
		category = "Food/Drinks";
}; 

class CookCatFood: Exile_AbstractCraftingRecipe
{
	name = "Cook Cat Food";
	pictureItem = "Exile_Item_CatFood_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
    	{1, "Exile_Item_CatFood_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
     components[] = 
	{
		{1, "Exile_Item_CatFood"}
	};
		category = "Food/Drinks";
}; 

class CookChristmasTinner: Exile_AbstractCraftingRecipe
{
	name = "Cook Christmas Tinner";
	pictureItem = "Exile_Item_ChristmasTinner_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
    	{1, "Exile_Item_ChristmasTinner_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
	components[] = 
	{
    	{1, "Exile_Item_ChristmasTinner"}
	};
	category = "Food/Drinks";
};
class CookCoffee: Exile_AbstractCraftingRecipe
{
	name = "Brew Coffee";
	pictureItem = "Exile_Item_PlasticBottleCoffee";
	requiresFire = 1;
	returnedItems[] =
	{
    	{1, "Exile_Item_PlasticBottleCoffee"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
     components[] = 
	{
    	{1, "Exile_Item_PlasticBottleFreshWater"},
    	{1, "Exile_Item_InstantCoffee"}
	};
		category = "Food/Drinks";
};
class CookDogFood: Exile_AbstractCraftingRecipe
{
	name = "Cook Dog Food";
	pictureItem = "Exile_Item_DogFood_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
    	{1, "Exile_Item_DogFood_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
     components[] = 
	{
    	{1, "Exile_Item_DogFood"}
	};
		category = "Food/Drinks";
}; 

class CookGloriousKnakworst: Exile_AbstractCraftingRecipe
{
	name = "Cook Glorious Knakworst";
	pictureItem = "Exile_Item_GloriousKnakworst_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
    	{1, "Exile_Item_GloriousKnakworst_Cooked"}
	};
	tools[] =
	{
         "Exile_Item_CookingPot"
	};
     components[] = 
	{
    	{1, "Exile_Item_GloriousKnakworst"}
	};
		category = "Food/Drinks";
}; 

class CookPlasticBottleDirtyWater: Exile_AbstractCraftingRecipe
{
	name = "Cook Dirty Water";
	pictureItem = "Exile_Item_PlasticBottleFreshWater";
	requiresFire = 1;
	returnedItems[] =
	{
    	{1, "Exile_Item_PlasticBottleFreshWater"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
     components[] = 
	{
    	{1, "Exile_Item_PlasticBottleDirtyWater"}
	};
		category = "Food/Drinks";
};
class CookPlasticBottleSaltWater: Exile_AbstractCraftingRecipe
{
	name = "Cook Salt Water";
	pictureItem = "Exile_Item_PlasticBottleFreshWater";
	requiresFire = 1;
	returnedItems[] =
	{
    	{1, "Exile_Item_PlasticBottleFreshWater"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
     components[] = 
	{
    	{1, "Exile_Item_PlasticBottleSaltWater"}
	};
		category = "Food/Drinks";
}; 
class CookSausageGravy: Exile_AbstractCraftingRecipe
{
	name = "Cook Sausage Gravy";
	pictureItem = "Exile_Item_SausageGravy_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
    	{1, "Exile_Item_SausageGravy_Cooked"}
	};
	tools[] =
	{
		"Exile_Item_CookingPot"
	};
     components[] = 
	{
    	{1, "Exile_Item_SausageGravy"}
	};
		category = "Food/Drinks";
}; 
class CookSurstromming: Exile_AbstractCraftingRecipe
{
	name = "Cook Surströmming";
	pictureItem = "Exile_Item_Surstromming_Cooked";
	requiresFire = 1;
	returnedItems[] =
	{
    	{1, "Exile_Item_Surstromming_Cooked"}
    };
	tools[] =
	{
		"Exile_Item_CookingPot"
    };
     components[] = 
	{
    	{1, "Exile_Item_Surstromming"}
    };
		category = "Food/Drinks";
}; 

class CraftBushKitGreen: Exile_AbstractCraftingRecipe
{
	name = "Craft a Bush Kit (Green)";
	pictureItem = "Exile_Item_BushKit_Green";
     requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
    	{1, "Exile_Item_BushKit_Green"}
    };
	components[] = 
	{
    	{10, "Exile_Item_Leaves"},
    	{5, "Exile_Item_WoodSticks"},
    	{1, "Exile_Item_Rope"}
    };
		category = "Craftables";
};
class CraftWoodPlank: Exile_AbstractCraftingRecipe
{
	name = "Craft Wood Plank";
	pictureItem = "Exile_Item_WoodPlank";
	requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
		{1, "Exile_Item_WoodPlank"}
	};
	components[] = 
	{
		{2, "Exile_Item_WoodLog"}
	};
	tools[] ={"Exile_Item_Handsaw"};
    category = "Building";
}; 
class CraftFirePlace: Exile_AbstractCraftingRecipe
{
	name = "Craft Fire Place";
	pictureItem = "Exile_Item_CampFireKit";
	returnedItems[] = 
	{
    	{1, "Exile_Item_CampFireKit"}
    };
	components[] = 
	{
    	{2, "Exile_Item_WoodLog"}
    };
		category = "Building";
};
class CraftFloodLight: Exile_AbstractCraftingRecipe
{
	name = "Craft Flood Light";
	pictureItem = "Exile_Item_FloodLightKit";
	requiresFire = 1;
	returnedItems[] = 
	{
    	{1, "Exile_Item_FloodLightKit"}
    };
     components[] = 
	{
    	{1, "Exile_Item_MetalPole"},
    	{1, "Exile_Item_LightBulb"},
    	{1, "Exile_Item_ExtensionCord"}
    };
		category = "Building";
};
class CraftFortificationUpgrade: Exile_AbstractCraftingRecipe
{
	name = "Craft Fortification Upgrade";
	pictureItem = "Exile_Item_MetalBoard"; //<< CHANGE IT
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
    	{1, "Exile_Item_FortificationUpgrade"}
    };
     components[] = 
	{
    	{2, "Exile_Item_MetalPole"},
    	{4, "Exile_Item_MetalBoard"}
    };
	tools[] = {"Exile_Item_Grinder"};
		category = "Building";
};
class CraftMetalBoard: Exile_AbstractCraftingRecipe
{
	name = "Craft Metal Board";
	pictureItem = "Exile_Item_MetalBoard";
	requiresFire = 1;
	returnedItems[] = 
	{
    	{1, "Exile_Item_MetalBoard"}
    };
     components[] = 
	{
    	{2, "Exile_Item_JunkMetal"}
    };
	tools[] = {"Exile_Item_Grinder"};
		category = "Craftables";
};
class CraftMetalHedgehog: Exile_AbstractCraftingRecipe
{
	name = "Craft Metal Hedgehog";
	pictureItem = "Exile_Item_MetalHedgehogKit";
	requiresFire = 1;
	returnedItems[] = 
	{
    	{1, "Exile_Item_MetalHedgehogKit"}
    };
     components[] = 
	{
    	{4, "Exile_Item_MetalPole"}
    };
	tools[] = {"Exile_Item_Grinder"};
		category = "Building";
};
 class CraftMetalPole: Exile_AbstractCraftingRecipe
 {
	name = "Craft Metal Pole";
	pictureItem = "Exile_Item_MetalPole";
	requiresFire = 1;
	returnedItems[] = 
	{
    	{1, "Exile_Item_MetalPole"}
    };
     components[] = 
	{
    	{4, "Exile_Item_JunkMetal"}
    };
	tools[] = {"Exile_Item_Grinder"};
		category = "Craftables";
};
 class CraftPortableGenerator: Exile_AbstractCraftingRecipe
 {
	name = "Craft Portable Generator";
	pictureItem = "Exile_Item_PortableGeneratorKit";
	requiresFire = 1;
	returnedItems[] = 
	{
    	{1, "Exile_Item_PortableGeneratorKit"}
    };
     components[] = 
	{
    	{4, "Exile_Item_MetalBoard"},
    	{1, "Exile_Item_FuelCanisterFull"},
    	{1, "Exile_Item_ExtensionCord"}
    };
		category = "Building";
};
 class CraftStorageCrate: Exile_AbstractCraftingRecipe
 {
	name = "Craft Storage Crate";
	pictureItem = "Exile_Item_StorageCrateKit";
     requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
    	{1, "Exile_Item_StorageCrateKit"}
    };
     components[] = 
	{
    	{5, "Exile_Item_WoodPlank"}
    };
		category = "Building";
};
 class CraftWaterBarrel: Exile_AbstractCraftingRecipe
 {
	name = "Craft Water Barrel";
	pictureItem = "Exile_Item_WaterBarrelKit";
     requiredInteractionModelGroup = "WorkBench";
	requiresFire = 1;
	returnedItems[] = 
	{
    	{1, "Exile_Item_WaterBarrelKit"}
    };
     components[] = 
	{
    	{20, "Exile_Item_PlasticBottleEmpty"}
    };
		category = "Building";
};
 class CraftWoodDoorWay: Exile_AbstractCraftingRecipe
 {
	name = "Craft Wood Doorway";
	pictureItem = "Exile_Item_WoodDoorwayKit";
     requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
    	{1, "Exile_Item_WoodDoorwayKit"}
    };
     components[] = 
	{
    	{6, "Exile_Item_WoodPlank"}
    };
		category = "Building";
};
 class CraftWoodFloor: Exile_AbstractCraftingRecipe
 {
	name = "Craft Wood Floor";
	pictureItem = "Exile_Item_WoodFloorKit";
     requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
    	{1, "Exile_Item_WoodFloorKit"}
    };
     components[] = 
	{
    	{4, "Exile_Item_WoodPlank"}
    };
		category = "Building";
};
 class CraftWoodFloorPort: Exile_AbstractCraftingRecipe
 {
	name = "Craft Wood Floor Port";
	pictureItem = "Exile_Item_WoodFloorPortKit";
     requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
    	{1, "Exile_Item_WoodFloorPortKit"}
    };
     components[] = 
	{
    	{6, "Exile_Item_WoodPlank"}
    };
		category = "Building";
};
 class CraftWoodGate: Exile_AbstractCraftingRecipe
 {
	name = "Craft Wood Gate";
	pictureItem = "Exile_Item_WoodGateKit";
     requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
    	{1, "Exile_Item_WoodGateKit"}
    };
     components[] = 
	{
    	{8, "Exile_Item_WoodPlank"}
    };
		category = "Building";
};
class CraftWoodStairs: Exile_AbstractCraftingRecipe
{
	name = "Craft Wood Stairs";
	pictureItem = "Exile_Item_WoodStairsKit";
	requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
		{1, "Exile_Item_WoodStairsKit"}
	};
	components[] = 
	{
		{6, "Exile_Item_WoodPlank"}
	};
		category = "Building";
};
class CraftWoodSupport: Exile_AbstractCraftingRecipe
{
	name = "Craft Wood Support";
	pictureItem = "Exile_Item_WoodSupportKit";
	requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
		{1, "Exile_Item_WoodSupportKit"}
	};
	components[] = 
	{
		{6, "Exile_Item_WoodPlank"}
	};
		category = "Building";
};
class CraftWoodWall: Exile_AbstractCraftingRecipe
{
	name = "Craft Wood Wall";
	pictureItem = "Exile_Item_WoodWallKit";
	requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
		{1, "Exile_Item_WoodWallKit"}
	};
	components[] = 
	{
		{4, "Exile_Item_WoodPlank"}
	};
		category = "Building";
};
class CraftWoodWallHalf: Exile_AbstractCraftingRecipe
{
	name = "Craft 1/2 Wood Wall";
	pictureItem = "Exile_Item_WoodWallHalfKit";
	requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
		{1, "Exile_Item_WoodWallHalfKit"}
	};
	components[] = 
	{
		{2, "Exile_Item_WoodPlank"}
	};
		category = "Building";
};
class CraftWoodWindow: Exile_AbstractCraftingRecipe
{
	name = "Craft Wood Window";
	pictureItem = "Exile_Item_WoodWindowKit";
	requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
		{1, "Exile_Item_WoodWindowKit"}
	};
	components[] = 
	{
		{6, "Exile_Item_WoodPlank"}
	};
		category = "Building";
};
class CraftWorkBench: Exile_AbstractCraftingRecipe
{
	name = "Craft Work Bench";
	pictureItem = "Exile_Item_WorkBenchKit";
	returnedItems[] = 
	{
		{1, "Exile_Item_WorkBenchKit"}
	};
	components[] = 
	{
		{4, "Exile_Item_WoodLog"}
	};
		category = "Building";
};
 class EmptyFuelCanister: Exile_AbstractCraftingRecipe
 {
	name = "Empty Fuel Canister";
	pictureItem = "Exile_Item_FuelCanisterEmpty";
	returnedItems[] = 
	{
    	{1, "Exile_Item_FuelCanisterEmpty"}
    };
     components[] = 
	{
    	{1, "Exile_Item_FuelCanisterFull"}
    };
		category = "Food/Drinks";
};
 class EmptyPlasticBottleDirtyWater: Exile_AbstractCraftingRecipe
 {
	name = "Empty Dirty Water";
	pictureItem = "Exile_Item_PlasticBottleEmpty";
	returnedItems[] =
	{
    	{1, "Exile_Item_PlasticBottleEmpty"}
    };
     components[] =
	{
    	{1, "Exile_Item_PlasticBottleDirtyWater"}
    };
		category = "Food/Drinks";
};
 class EmptyPlasticBottleSaltWater: Exile_AbstractCraftingRecipe
 {
	name = "Empty Salt Water";
	pictureItem = "Exile_Item_PlasticBottleEmpty";
	returnedItems[] =
	{
    	{1, "Exile_Item_PlasticBottleEmpty"}
    };
     components[] =
	{
    	{1, "Exile_Item_PlasticBottleSaltWater"}
    };
		category = "Food/Drinks";
};
 class FillEmptyPlasticBottleWithDirtyWater: Exile_AbstractCraftingRecipe
 {
	name = "Fill Dirty Water";
	pictureItem = "Exile_Item_PlasticBottleDirtyWater";
     requiredInteractionModelGroup = "WaterSource";
	returnedItems[] =
	{
    	{1, "Exile_Item_PlasticBottleDirtyWater"}
    };
     components[] = 
	{
    	{1, "Exile_Item_PlasticBottleEmpty"}
    };
		category = "Food/Drinks";
};
 class FillEmptyPlasticBottleWithFreshWater: Exile_AbstractCraftingRecipe
 {
	name = "Fill Fresh Water";
	pictureItem = "Exile_Item_PlasticBottleFreshWater";
     requiredInteractionModelGroup = "CleanWaterSource";
	returnedItems[] =
	{
    	{1, "Exile_Item_PlasticBottleFreshWater"}
    };
     components[] = 
	{
    	{1, "Exile_Item_PlasticBottleEmpty"}
    };
		category = "Food/Drinks";
};
 class FillEmptyPlasticBottleWithSaltWater: Exile_AbstractCraftingRecipe
 {
	name = "Fill Salt Water";
	pictureItem = "Exile_Item_PlasticBottleSaltWater";
     requiresOcean = 1;
	returnedItems[] = 
	{
    	{1, "Exile_Item_PlasticBottleSaltWater"}
    };
     components[] = 
	{
    	{1, "Exile_Item_PlasticBottleEmpty"}
    };
		category = "Food/Drinks";
};
 class FillFuelCanister: Exile_AbstractCraftingRecipe
 {
	name = "Fill Fuel Canister";
	pictureItem = "Exile_Item_FuelCanisterFull";
     requiredInteractionModelGroup = "FuelSource";
	returnedItems[] = 
	{
    	{1, "Exile_Item_FuelCanisterFull"}
    };
     components[] = 
	{
    	{1, "Exile_Item_FuelCanisterEmpty"}
    };
		category = "Food/Drinks";
};
class UpgradeToWoodDoor: Exile_AbstractCraftingRecipe
{
	name = "Upgrade to Wood Door";
	pictureItem = "Exile_Item_WoodDoorKit";
	requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
		{1, "Exile_Item_WoodDoorKit"}
	};
	components[] = 
	{
		{1, "Exile_Item_WoodDoorwayKit"},
		{2, "Exile_Item_WoodPlank"}
	};
		category = "Building";
};
class UpgradeToWoodFloorPort: Exile_AbstractCraftingRecipe
{
	name = "Upgrade to Wood Floor Port";
	pictureItem = "Exile_Item_WoodFloorPortKit";
	requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
		{1, "Exile_Item_WoodFloorPortKit"}
	};
	components[] = 
	{
		{1, "Exile_Item_WoodFloorKit"},
		{2, "Exile_Item_WoodPlank"}
	};
		category = "Building";
};
class UpgradeToWoodGate: Exile_AbstractCraftingRecipe
{
	name = "Upgrade to Wood Gate";
	pictureItem = "Exile_Item_WoodGateKit";
	requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
		{1, "Exile_Item_WoodGateKit"}
	};
	components[] = 
	{
		{1, "Exile_Item_WoodWallKit"},
		{4, "Exile_Item_WoodPlank"}
	};
		category = "Building";
};
class UpgradeToWoodWall: Exile_AbstractCraftingRecipe
{
	name = "Upgrade to Wood Wall";
	pictureItem = "Exile_Item_WoodWallHalfKit";
	requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
		{1, "Exile_Item_WoodWallKit"}
	};
	components[] = 
	{
		{2, "Exile_Item_WoodWallHalfKit"}
	};
		category = "Building";
};
class UpgradeToWoodWindow: Exile_AbstractCraftingRecipe
{
	name = "Upgrade to Wood Window";
	pictureItem = "Exile_Item_WoodWindowKit";
	requiredInteractionModelGroup = "WorkBench";
	returnedItems[] = 
	{
		{1, "Exile_Item_WoodWindowKit"}
	};
	components[] = 
	{
		{1, "Exile_Item_WoodWallKit"},
		{2, "Exile_Item_WoodPlank"}
	};
		category = "Building";
};
//NEW CRAFTING RECIPIES
class IEDLandSmall_Remote_Mag: Exile_AbstractCraftingRecipe
{
    name = "Small Crafted IED";
    pictureItem = "IEDLandSmall_Remote_Mag";
    requiresFire = 1;
    requiredInteractionModelGroup = "WorkBench";
    returnedItems[] =
    {
        {1, "IEDLandSmall_Remote_Mag"}
    };
    components[] =
    {
        {2, "Exile_Item_MetalPole"},
        {4, "Exile_Item_JunkMetal"},
        {3, "Exile_Item_FuelCanisterFull"},
        {1, "Exile_Item_ExtensionCord"},
        {1, "Exile_Item_DuctTape"}
    };
    category = "Craftables";
};
class IEDLandbig_Remote_Mag: Exile_AbstractCraftingRecipe
{
    name = "Large Crafted IED";
    pictureItem = "IEDLandBig_Remote_Mag";
    requiresFire = 1;
    requiredInteractionModelGroup = "WorkBench";
    returnedItems[] =
    {
        {1, "IEDLandBig_Remote_Mag"}
    };
    components[] =
    {
        {1, "Exile_Item_FuelCanisterEmpty"},
        {10, "Exile_Item_JunkMetal"},
        {5, "Exile_Item_FuelCanisterFull"},
        {2, "Exile_Item_ExtensionCord"},
        {2, "Exile_Item_DuctTape"}
    };
    category = "Craftables";
};

class Exile_Item_CookingPot: Exile_AbstractCraftingRecipe
{
    name = "Craft Cookingpot";
    pictureItem = "Exile_Item_CookingPot";
    requiresFire = 1;
    requiredInteractionModelGroup = "WorkBench";
    returnedItems[] =
    {
        {1, "Exile_Item_CookingPot"}
    };
    components[] =
    {
        {1, "Exile_Item_JunkMetal"}
    };
    category = "Food/Drinks";
};

class Exile_melee_Axe: Exile_AbstractCraftingRecipe
{
    name = "Craft Axe";
    pictureItem = "Exile_melee_Axe";
    requiresFire = 1;
    requiredInteractionModelGroup = "WorkBench";
    returnedItems[] =
    {
        {1, "Exile_melee_Axe"}
    };
    components[] =
    {
        {2, "Exile_Item_JunkMetal"},
        {1, "Exile_Item_WoodLog"}
    };
    category = "Craftables";
};

class Exile_Item_SafeKit: Exile_AbstractCraftingRecipe
{
    name = "Craft Safe";
    pictureItem = "Exile_Item_SafeKit";
    requiresFire = 1;
    requiredInteractionModelGroup = "WorkBench";
    returnedItems[] =
    {
        {1, "Exile_Item_SafeKit"}
    };
    components[] =
    {
        {2, "Exile_Item_MetalPole"},
        {4, "Exile_Item_MetalBoard"},
        {1, "Exile_Item_Codelock"}
    };
    category = "Building";
};

class Exile_Item_Camo_TentKit: Exile_AbstractCraftingRecipe
{
    name = "Craft Camo Tent";
    pictureItem = "Exile_Item_Camo_TentKit";
    requiresFire = 1;
    requiredInteractionModelGroup = "WorkBench";
    returnedItems[] =
    {
        {1, "Exile_Item_Camo_TentKit"}
    };
    components[] =
    {
        {2, "Exile_Item_DuctTape"},
        {4, "Exile_Item_WoodPlank"},
        {2, "Exile_Item_Rope"}
    };
    category = "Craftables";
};

class Laserdesignator: Exile_AbstractCraftingRecipe
{
    name = "Craft Laserdesignator";
    pictureItem = "Laserdesignator";
    requiresFire = 1;
    returnedItems[] =
    {
        {1, "Laserdesignator"}
    };
    components[] =
    {
        {2, "Exile_Item_LightBulb"},
        {1, "Exile_Item_JunkMetal"},
        {1, "Exile_Item_ThermalScannerPro"}
    };
    category = "Craftables";
};
//NEW CRAFTING RECIPIES END
//NEW WEAPON MAGAZINE CRAFTING
class SpillDirtyWater: Exile_AbstractCraftingRecipe
{
	name = "Spill Dirty Water";
	pictureItem = "Exile_Item_PlasticBottleEmpty";
	returnedItems[] =
	{
		{1, "Exile_Item_PlasticBottleEmpty"}
	};
	components[] =
	{
		{1, "Exile_Item_PlasticBottleDirtyWater"}
	};
	category = "Food/Drinks";
};
class SpillSaltWater: Exile_AbstractCraftingRecipe
{
	name = "Spill Salt Water";
	pictureItem = "Exile_Item_PlasticBottleEmpty";
	returnedItems[] =
	{
		{1, "Exile_Item_PlasticBottleEmpty"}
	};
	components[] =
	{
		{1, "Exile_Item_PlasticBottleSaltWater"}
	};
	category = "Food/Drinks";
};
class CraftBandage: Exile_AbstractCraftingRecipe
{
	name = "Craft Bandage";
	pictureItem = "Exile_Item_Bandage";
	returnedItems[] =
	{
		{1, "Exile_Item_Bandage"}
	};
	components[] = 
	{
		{1, "Exile_Item_ToiletPaper"}
	};
	category = "Craftables";
};
class CraftPopTabs: Exile_AbstractCraftingRecipe
{
	name = "Make Money";
	pictureItem = "CUP_item_Money";
	returnedItems[] =
	{
		{1, "CUP_item_Money"}
	};
	components[] = 
	{
		{1, "Exile_Item_Magazine01"},
		{1, "Exile_Item_Magazine02"},
		{1, "Exile_Item_Magazine03"}
	};
	category = "Craftables";
};

/////////////////////////////////////////
// Entended Recipies 
/////////////////////////////////////////

class Shabbylamp: Exile_AbstractCraftingRecipe
{
	name = "Shabby Lamp";
	pictureItem = "Land_LampShabby_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_LampShabby_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{8, "Exile_Item_Woodlog"},
		{2, "Exile_Item_ExtensionCord"},
		{1, "Exile_Item_LightBulb"},
	};
	category = "Extended Base Items";
};

class Sunshade: Exile_AbstractCraftingRecipe
{
	name = "Sunshade";
	pictureItem = "Land_Sunshade_04_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Sunshade_04_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_Woodlog"},
		{1, "Exile_Item_Rope"},
	};
	category = "Extended Base Items";
};

class Sunchair: Exile_AbstractCraftingRecipe
{
	name = "Sunchair";
	pictureItem = "Land_Sun_chair_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Sun_chair_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_Woodlog"},
		{2, "Exile_Item_Rope"},
	};
	category = "Extended Base Items";
};

class MetalShed: Exile_AbstractCraftingRecipe
{
	name = "Metal Shed";
	pictureItem = "Land_Metal_Shed_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Metal_Shed_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_JunkMetal"},
		{2, "Exile_Item_Woodlog"},
		{1, "Exile_Item_Rope"},
	};
	category = "Extended Base Items";
};

class StreetLamp: Exile_AbstractCraftingRecipe
{
	name = "Street Lamp";
	pictureItem = "Land_LampStreet_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_LampStreet_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_MetalPole"},
		{4, "Exile_Item_ExtensionCord"},
		{1, "Exile_Item_LightBulb"},
	};
	category = "Extended Base Items";
};

class Industryfence3pts: Exile_AbstractCraftingRecipe
{
	name = "Industryfence 3pts";
	pictureItem = "Land_IndFnc_9_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_IndFnc_9_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{3, "Exile_Item_Cement"},
	};
	category = "Extended Base Items";
};

class Industryfence: Exile_AbstractCraftingRecipe
{
	name = "Industryfence";
	pictureItem = "Land_IndFnc_3_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_IndFnc_3_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_Cement"},
	};
	category = "Extended Base Items";
};	

class CargoContainerSmall: Exile_AbstractCraftingRecipe
{
	name = "Cargo Container Small";
	pictureItem = "Land_CargoBox_V1_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_CargoBox_V1_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_MetalBoard"},
		{2, "Exile_Item_JunkMetal"},
	};
	category = "Extended Base Items";
};	

class BlockConcrete: Exile_AbstractCraftingRecipe
{
	name = "Concrete Block";
	pictureItem = "BlockConcrete_F_Kit";
	returnedItems[] = 
	{
		{1, "BlockConcrete_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{4, "Exile_Item_Cement"},
	};
	category = "Extended Base Items";
};	

class Chair: Exile_AbstractCraftingRecipe
{
	name = "Chair";
	pictureItem = "Land_ChairWood_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_ChairWood_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{5, "Exile_Item_WoodPlank"},
	};
	category = "Extended Base Items";
};	

class Pierbox: Exile_AbstractCraftingRecipe
{
	name = "Pierbox";
	pictureItem = "Land_Pier_Box_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Pier_Box_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Land_CncWall4_F_Kit"},
		{5, "Exile_Item_WoodPlank"},
	};
	category = "Extended Base Items";
};	

class Toiletbox: Exile_AbstractCraftingRecipe
{
	name = "Toiletbox";
	pictureItem = "Land_ToiletBox_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_ToiletBox_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{4, "Exile_Item_WoodPlank"},
		{1, "Exile_Item_JunkMetal"},
	};
	category = "Extended Base Items";
};	
		
class Table: Exile_AbstractCraftingRecipe
{
	name = "Table";
	pictureItem = "Land_TableDesk_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_TableDesk_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{10, "Exile_Item_WoodPlank"},
		{1, "Exile_Item_MetalBoard"},
	};
	category = "Extended Base Items";
};			

class Slumplane: Exile_AbstractCraftingRecipe
{
	name = "Slumplane";
	pictureItem = "Land_Cargo_addon02_V2_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Cargo_addon02_V2_F_Kit"}
	};
	requiresFire = 0;
	components[] = 
	{
		{4, "Exile_Item_Woodlog"},
		{2, "Exile_Item_Rope"},
	};
	category = "Extended Base Items";
};		

class Radarsmall: Exile_AbstractCraftingRecipe
{
	name = "Small Radar";
	pictureItem = "Land_Radar_Small_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Radar_Small_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{4, "Exile_Item_MetalBoard"},
		{2, "Exile_Item_JunkMetal"},
		{5, "Exile_Item_ExtensionCord"},
	};
	category = "Extended Base Items";
};
		
class Floodlightdouble: Exile_AbstractCraftingRecipe
{
	name = "Floodlight double";
	pictureItem = "Land_PortableLight_double_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_PortableLight_double_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{6, "Exile_Item_LightBulb"},
		{2, "Exile_Item_JunkMetal"},
		{2, "Exile_Item_ExtensionCord"},
	};
	category = "Extended Base Items";
};

class CncWallSmall8m: Exile_AbstractCraftingRecipe
{
	name = "Small concrete wall 8m";
	pictureItem = "Land_Concrete_SmallWall_8m_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Concrete_SmallWall_8m_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_Cement"},
		{2, "Exile_Item_Sand"},
	};
	category = "Extended Base Items";
};

class CncWallSmall4m: Exile_AbstractCraftingRecipe
{
	name = "Small concrete wall 4m";
	pictureItem = "Land_Concrete_SmallWall_4m_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Concrete_SmallWall_4m_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_Cement"},
		{1, "Exile_Item_Sand"},
	};
	category = "Extended Base Items";
};

class MilitaryVehicle: Exile_AbstractCraftingRecipe
{
	name = "Military Vehicle Sign";
	pictureItem = "Land_Sign_WarningMilitaryVehicles_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Sign_WarningMilitaryVehicles_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_MetalPole"},
		{1, "Exile_Item_WoodPlank"},
	};
	category = "Extended Base Items";
};

class MilSignSmall: Exile_AbstractCraftingRecipe
{
	name = "Military Sign Small";
	pictureItem = "Land_Sign_WarningMilAreaSmall_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Sign_WarningMilAreaSmall_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_MetalPole"},
		{1, "Exile_Item_WoodPlank"},
	};
	category = "Extended Base Items";
};

class Watersource: Exile_AbstractCraftingRecipe
{
	name = "Watersource";
	pictureItem = "Land_Water_source_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Water_source_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_MetalPole"},
		{3, "Exile_Item_Cement"},
	};
	category = "Extended Base Items";
};

class TouristShelter: Exile_AbstractCraftingRecipe
{
	name = "Tourist Shelter";
	pictureItem = "Land_TouristShelter_01_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_TouristShelter_01_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_Sand"},
		{2, "Exile_Item_Cement"},
		{5, "Exile_Item_WoodPlank"},
	};
	category = "Extended Base Items";
};

class crashbarrier: Exile_AbstractCraftingRecipe
{
	name = "Crashbarrier";
	pictureItem = "Land_Crash_barrier_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Crash_barrier_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_JunkMetal"},
	};
	category = "Extended Base Items";
};

class HugeContainer: Exile_AbstractCraftingRecipe
{
	name = "Huge Container";
	pictureItem = "Land_Cargo40_light_green_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Cargo40_light_green_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{6, "Exile_Item_JunkMetal"},
		{6, "Exile_Item_MetalBoard"},
	};
};

class cncbarriermedium: Exile_AbstractCraftingRecipe
{
	name = "CNC Barrier Medium";
	pictureItem = "Land_CncBarrierMedium_F_Kit";
	returnedItems[] = 
	{
		{2, "Land_CncBarrierMedium_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_Cement"},
	};
	category = "Extended Base Items";
};

class cncbarrier1: Exile_AbstractCraftingRecipe
{
	name = "CNC Barrier 1";
	pictureItem = "Land_CncWall1_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_CncWall1_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_Cement"},
	};category = "Extended Base Items";
};

class Airportlamp: Exile_AbstractCraftingRecipe
{
	name = "Airportlamp";
	pictureItem = "Land_LampAirport_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_LampAirport_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{4, "Exile_Item_ExtensionCord"},
		{4, "Exile_Item_LightBulb"},
		{3, "Exile_Item_MetalPole"},
	};
	tools[] = {"Exile_Item_Screwdriver", "Exile_Item_Pliers"}; // Change
	category = "Extended Base Items";
};

class LampHalogen: Exile_AbstractCraftingRecipe
{
	name = "Halogen Base Lamp";
	pictureItem = "Land_LampHalogen_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_LampHalogen_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{10, "Exile_Item_LightBulb"},
		{5, "Exile_Item_ExtensionCord"}, // Change
		{3, "Exile_Item_MetalPole"},
	};
	category = "Extended Base Items";
	tools[] = {"Exile_Item_Screwdriver", "Exile_Item_Pliers"}; // Change
};

class TentDome: Exile_AbstractCraftingRecipe
{
	name = "Tent Dome";
	pictureItem = "Land_TentDome_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_TentDome_F_Kit"}
	};
	requiresFire = 0;
	components[] = 
	{
		{2, "Exile_Item_Woodlog"},
		{2, "Exile_Item_Rope"},
	};
	category = "Extended Base Items";
};

class Platform: Exile_AbstractCraftingRecipe
{
	name = "Platform";
	pictureItem = "Land_GH_Platform_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_GH_Platform_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_Cement"},
	};
	category = "Extended Base Items";
};

class Garage: Exile_AbstractCraftingRecipe
{
	name = "Garage";
	pictureItem = "Land_i_Garage_V2_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_i_Garage_V2_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_Sand"},
		{1, "Exile_Item_Cement"},
		{2, "Exile_Item_WoodPlank"},
	};
	category = "Extended Base Items";
};

class CNCStairs: Exile_AbstractCraftingRecipe
{
	name = "CNC Stairs";
	pictureItem = "Land_GH_Stairs_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_GH_Stairs_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_Cement"},
	};
	category = "Extended Base Items";
};

class CargoContainerSandSmall: Exile_AbstractCraftingRecipe
{
	name = "Cargo container Sand Small";
	pictureItem = "Land_Cargo20_sand_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Cargo20_sand_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_MetalBoard"},
		{2, "Exile_Item_JunkMetal"},
	};
	category = "Extended Base Items";
};

class Brokenshed: Exile_AbstractCraftingRecipe
{
	name = "Broken Shed";
	pictureItem = "Land_u_Addon_01_V1_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_u_Addon_01_V1_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_Sand"},
		{2, "Exile_Item_Cement"},
		{2, "Exile_Item_WoodPlank"},
	};
	category = "Extended Base Items";
};

class Razorwire: Exile_AbstractCraftingRecipe
{
	name = "Razorwire";
	pictureItem = "Land_Razorwire_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Razorwire_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{3, "Exile_Item_JunkMetal"},
		{6, "Exile_Item_ExtensionCord"},
	};
	category = "Extended Base Items";
};

class SmallShed: Exile_AbstractCraftingRecipe
{
	name = "Small Shed";
	pictureItem = "Land_Shed_Small_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Shed_Small_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_MetalBoard"}, // Change
		{1, "Exile_Item_MetalPole"},
		{1, "Exile_Item_JunkMetal"},
		{2, "Exile_Item_Cement"},
		{2, "Exile_Item_MetalScrews"}, // Change
	};
	category = "Extended Base Items";
	tools[] = {"Exile_Item_Wrench"}; // Change
};

class CNCWallType2: Exile_AbstractCraftingRecipe
{
	name = "CNC Wall Type 2";
	pictureItem = "Land_CncWall4_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_CncWall4_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_Cement"},
	};
	category = "Extended Base Items";
};

class CNCWall: Exile_AbstractCraftingRecipe
{
	name = "CNC Wall";
	pictureItem = "Land_Wall_IndCnc_2deco_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Wall_IndCnc_2deco_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_Cement"},
	};
	category = "Extended Base Items";
};


class CNCShelter: Exile_AbstractCraftingRecipe
{
	name = "CNC Shelter";
	pictureItem = "Land_CncShelter_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_CncShelter_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_Cement"},
	};
	category = "Extended Base Items";
};


class SlumContainer: Exile_AbstractCraftingRecipe
{
	name = "Slum Container";
	pictureItem = "Land_cargo_house_slum_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_cargo_house_slum_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_JunkMetal"},
		{1, "Exile_Item_MetalBoard"},
	};
	category = "Extended Base Items";
};
class ShootingPos: Exile_AbstractCraftingRecipe
{
	name = "Shooting Pos";
	pictureItem = "ShootingPos_F_Kit";
	returnedItems[] = 
	{
		{1, "ShootingPos_F_Kit"}
	};
	requiresFire = 0;
	components[] = 
	{
		{4, "Exile_Item_Woodlog"},
	};
	category = "Extended Base Items";
};

class BagBunkerBig: Exile_AbstractCraftingRecipe
{
	name = "Bag Bunker Big";
	pictureItem = "Land_BagBunker_Large_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_BagBunker_Large_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Land_BagBunker_Small_F_Kit"}, // Change
		{1, "Exile_Item_Sand"},  // Change
		{1, "Exile_Item_Cement"},  // Change
		{2, "Exile_Item_WoodPlank"},  // Change
	};
	category = "Extended Base Items";
};


class Pumpstation: Exile_AbstractCraftingRecipe
{
	name = "Pumpstation";
	pictureItem = "Land_FuelStation_Feed_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_FuelStation_Feed_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_MetalBoard"},
		{3, "Exile_Item_JunkMetal"}, // Change
		{1, "Exile_Item_WaterBarrelKit"},
		{1, "Exile_Item_MetalScrews"}, // Change
	};
	tools[] = {"Exile_Item_CordlessScrewdriver"}; // Change
	category = "Extended Base Items";
};

class MetalShelf: Exile_AbstractCraftingRecipe
{
	name = "Metal Shelf";
	pictureItem = "Land_ShelvesMetal_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_ShelvesMetal_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{3, "Exile_Item_MetalBoard"},
		{5, "Exile_Item_WoodPlank"},
	};
	category = "Extended Base Items";
};

class RustyTank: Exile_AbstractCraftingRecipe
{
	name = "RustyTank";
	pictureItem = "Land_Tank_rust_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Tank_rust_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_MetalBoard"}, // Change
		{2, "Exile_Item_WaterBarrelKit"},
		{1, "Exile_Item_MetalScrews"}, // Change
	};
	tools[] = {"Exile_Item_CordlessScrewdriver"}; // Change
	category = "Extended Base Items";
};

class Steelfence: Exile_AbstractCraftingRecipe
{
	name = "Steelfence";
	pictureItem = "Land_Wall_Tin_4_Kit";
	returnedItems[] = 
	{
		{1, "Land_Wall_Tin_4_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_MetalBoard"},
	};
	category = "Extended Base Items";
};

class Pier: Exile_AbstractCraftingRecipe
{
	name = "Pier";
	pictureItem = "Land_Pier_small_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Pier_small_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{10, "Exile_Item_Woodlog"},
	};
	category = "Extended Base Items";
};

class CncWallMil4M: Exile_AbstractCraftingRecipe
{
	name = "Concrete Wall Military 4m";
	pictureItem = "Land_Mil_WallBig_4m_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Mil_WallBig_4m_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_JunkMetal"},
		{2, "Exile_Item_WoodPlank"},
	};
	category = "Extended Base Items";
};

class MilitaryArea: Exile_AbstractCraftingRecipe
{
	name = "Military Area";
	pictureItem = "Land_Sign_WarningMilitaryArea_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Sign_WarningMilitaryArea_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_JunkMetal"},
		{2, "Exile_Item_WoodPlank"},
	};
	category = "Extended Base Items";
};


class Icebox: Exile_AbstractCraftingRecipe
{
	name = "Icebox";
	pictureItem = "Land_Icebox_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Icebox_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_MetalBoard"},
		{4, "Exile_Item_PlasticBottleEmpty"},
		{1, "Exile_Item_MetalScrews"}, // Change
		{1, "Exile_Item_ExtensionCord"}, // Change
	};
	tools[] = {"Exile_Item_CordlessScrewdriver"}; // Change
	category = "Extended Base Items";
};

class Bargate: Exile_AbstractCraftingRecipe
{
	name = "Bar Gate";
	pictureItem = "Land_BarGate_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_BarGate_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_MetalBoard"},
		{3, "Exile_Item_MetalPole"},
	};
	category = "Extended Base Items";
};

class Citygate: Exile_AbstractCraftingRecipe
{
	name = "City Gate";
	pictureItem = "Land_City_Gate_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_City_Gate_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_MetalBoard"},
		{1, "Exile_Item_MetalPole"},
		{1, "Exile_Item_Cement"}
	};
	category = "Extended Base Items";
};

class Rack: Exile_AbstractCraftingRecipe
{
	name = "A Shelf";
	pictureItem = "Land_Rack_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Rack_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{4, "Exile_Item_WoodPlank"},
		{2, "Exile_Item_JunkMetal"},
	};
	category = "Extended Base Items";
};

class HeliPad: Exile_AbstractCraftingRecipe
{
	name = "Helipad";
	pictureItem = "Land_HelipadCivil_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_HelipadCivil_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_Cement"},
		{2, "Exile_Item_Sand"},
		{2, "Exile_Item_MetalBoard"},
	};
	category = "Extended Base Items";
};

class ConcreteWall8m: Exile_AbstractCraftingRecipe
{
	name = "Concrete Wall 8m";
	pictureItem = "Land_City2_8m_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_City2_8m_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{4, "Exile_Item_Cement"},
	};
	category = "Extended Base Items";
};

class ConcreteWall4m: Exile_AbstractCraftingRecipe
{
	name = "Concrete Wall 4m";
	pictureItem = "Land_City2_4m_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_City2_4m_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_Cement"},
	};
	category = "Extended Base Items";
};

class ConcreteWall1: Exile_AbstractCraftingRecipe
{
	name = "Concrete Wall";
	pictureItem = "Land_Wall_IndCnc_4_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Wall_IndCnc_4_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{3, "Exile_Item_Cement"},
	};
	category = "Extended Base Items";
};

class ConcreteRamp: Exile_AbstractCraftingRecipe
{
	name = "Concrete Ramp";
	pictureItem = "Land_RampConcrete_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_RampConcrete_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{3, "Exile_Item_Cement"},
	};
	category = "Extended Base Items";
};

class SandbagBarrierBigCorner: Exile_AbstractCraftingRecipe
{
	name = "Sandbag Barrier Big Corner";
	pictureItem = "Land_HBarrierWall_corner_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_HBarrierWall_corner_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{3, "Exile_Item_Sand"},
	};
	category = "Extended Base Items";
};

class BagBunkerSmall: Exile_AbstractCraftingRecipe
{
	name = "Bag Bunker Small";
	pictureItem = "Land_BagBunker_Small_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_BagBunker_Small_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_Sand"},
		{1, "Exile_Item_Cement"},
		{4, "Exile_Item_WoodPlank"},
	};
	category = "Extended Base Items";
};

class MetalWoodenRack: Exile_AbstractCraftingRecipe
{
	name = "Metal Wooden Shelf";
	pictureItem = "Land_Metal_wooden_rack_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Metal_wooden_rack_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_MetalBoard"},
		{1, "Exile_Item_MetalPole"},
		{3, "Exile_Item_WoodPlank"},
	};
	category = "Extended Base Items";
};

class SandbagTower: Exile_AbstractCraftingRecipe
{
	name = "Sandbag Tower";
	pictureItem = "Land_HBarrierTower_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_HBarrierTower_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_Sand"},
		{1, "Exile_Item_Cement"},
		{1, "Exile_Item_MetalBoard"},
		{1, "Exile_Item_MetalPole"},
	};
	category = "Extended Base Items";
};

class SandbagsLong: Exile_AbstractCraftingRecipe
{
	name = "Sandbags Long";
	pictureItem = "Land_BagFence_Long_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_BagFence_Long_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_Sand"},
	};
	category = "Extended Base Items";
};

class SandbagCorner: Exile_AbstractCraftingRecipe
{
	name = "Sandbag Corner";
	pictureItem = "Land_BagFence_Corner_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_BagFence_Corner_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_Sand"},
	};
	category = "Extended Base Items";
};

class LandContainer: Exile_AbstractCraftingRecipe
{
	name = "LandContainer";
	pictureItem = "Land_Cargo20_military_green_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Cargo20_military_green_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{6, "Exile_Item_MetalBoard"},
	};
	category = "Extended Base Items";
};

class Ammobox: Exile_AbstractCraftingRecipe
{
	name = "Ammobox";
	pictureItem = "Land_Pallet_MilBoxes_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Pallet_MilBoxes_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_MetalBoard"},
		{1, "Exile_Item_StorageCrateKit"},
		{2, "Exile_Item_JunkMetal"},
	};
	category = "Extended Base Items";
};

class Watercooler: Exile_AbstractCraftingRecipe
{
	name = "Water Cooler";
	pictureItem = "Land_WaterCooler_01_new_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_WaterCooler_01_new_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{4, "Exile_Item_MetalBoard"},
		{1, "Exile_Item_WaterBarrelKit"},
	};
	category = "Extended Base Items";
};

class CncBarrier: Exile_AbstractCraftingRecipe
{
	name = "Concrete Barrier";
	pictureItem = "Land_CncBarrier_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_CncBarrier_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_Cement"},
		{1, "Exile_Item_Sand"},
	};
	category = "Extended Base Items";
};

class Stonewall: Exile_AbstractCraftingRecipe
{
	name = "Stone Wall";
	pictureItem = "Land_Stone_4m_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Stone_4m_F_Kit"}
	};
	requiresFire = 0;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_Cement"},
		{1, "Exile_Item_Sand"},
	};
	category = "Extended Base Items";
};

class Stonegate: Exile_AbstractCraftingRecipe
{
	name = "Stone Gate";
	pictureItem = "Land_Stone_Gate_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_Stone_Gate_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{1, "Exile_Item_MetalPole"},
		{1, "Exile_Item_MetalBoard"},
		{1, "Exile_Item_Cement"},
		{1, "Exile_Item_Sand"},
	};
	category = "Extended Base Items";
};

class PierLadder: Exile_AbstractCraftingRecipe
{
	name = "Ladder";
	pictureItem = "PierLadder_F_Kit";
	returnedItems[] = 
	{
		{1, "PierLadder_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{3, "Exile_Item_MetalPole"},
		{2, "Exile_Item_JunkMetal"},
	};
	category = "Extended Base Items";
};

class CamoNetOPFORopen: Exile_AbstractCraftingRecipe
{
	name = "CamoNet OPFOR open";
	pictureItem = "CamoNet_OPFOR_open_F_Kit";
	returnedItems[] = 
	{
		{1, "CamoNet_OPFOR_open_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_MetalPole"},
	};
	category = "Extended Base Items";
};

class CamoNetINDPopen: Exile_AbstractCraftingRecipe
{
	name = "CamoNet INDP open";
	pictureItem = "CamoNet_INDP_open_F_Kit";
	returnedItems[] = 
	{
		{1, "CamoNet_INDP_open_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_MetalPole"},
	};
	category = "Extended Base Items";
};

class CamoNetBLUFORopen: Exile_AbstractCraftingRecipe
{
	name = "CamoNet BLUFOR open";
	pictureItem = "CamoNet_BLUFOR_open_F_Kit";
	returnedItems[] = 
	{
		{1, "CamoNet_BLUFOR_open_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{2, "Exile_Item_MetalPole"},
	};
	category = "Extended Base Items";
};

class Barrier1: Exile_AbstractCraftingRecipe  //thank you MrDynamite for sharing better Receipideas :)
{
    name = "Barrier";
    pictureItem = "Land_HBarrier_1_F_Kit";
    returnedItems[] =
    {
        {1, "Land_HBarrier_1_F_Kit"}
    };
    requiresFire = 0;
    requiredInteractionModelGroup = "WorkBench";
    components[] =
    {
        {2, "Exile_Item_Sand"}, // Change
    };
    category = "Extended Base Items";
};

class Barrier3: Exile_AbstractCraftingRecipe
{
    name = "Barrier3";
    pictureItem = "Land_HBarrier_3_F_Kit";
    returnedItems[] =
    {
        {1, "Land_HBarrier_3_F_Kit"}
    };
    requiresFire = 0;
    requiredInteractionModelGroup = "WorkBench";
    components[] =
    {
        {1, "Land_HBarrier_1_F_Kit"}, {1, "Exile_Item_Sand"}, // Change
    };
    category = "Extended Base Items";
};

class Barrier5: Exile_AbstractCraftingRecipe
{
    name = "Barrier5";
    pictureItem = "Land_HBarrier_5_F_Kit";
    returnedItems[] =
    {    
        {1, "Land_HBarrier_5_F_Kit"}
    };
    requiresFire = 0;
    requiredInteractionModelGroup = "WorkBench";
    components[] =
    {
        {1, "Land_HBarrier_3_F_Kit"}, {1, "Exile_Item_Sand"}, // Change
    };
    category = "Extended Base Items";
};

class SandbagBarrierBig4m: Exile_AbstractCraftingRecipe
{
    name = "Sandbag Barrier Big 4m";
    pictureItem = "Land_HBarrierWall4_F_Kit";
    returnedItems[] =
    {
        {1, "Land_HBarrierWall4_F_Kit"}
    };
    requiresFire = 0;
    requiredInteractionModelGroup = "WorkBench";
    components[] =
    {
        {1, "Land_HBarrier_3_F_Kit"}, {2, "Exile_Item_Sand"}, // Change
    };
    category = "Extended Base Items";
};

class SandbagBarrierBig6m: Exile_AbstractCraftingRecipe
{
    name = "Sandbag Barrier Big 6m";
    pictureItem = "Land_HBarrierWall6_F_Kit";
    returnedItems[] =
    {
        {1, "Land_HBarrierWall6_F_Kit"}
    };
    requiresFire = 0;
    requiredInteractionModelGroup = "WorkBench";
    components[] =
    {
        {1, "Land_HBarrierWall4_F_Kit"},{2, "Exile_Item_Sand"}, // Change
    };
    category = "Extended Base Items";
};


class BagBunker: Exile_AbstractCraftingRecipe
{
	name = "BagBunker";
	pictureItem = "Land_BagBunker_Tower_F_Kit";
	returnedItems[] = 
	{
		{1, "Land_BagBunker_Tower_F_Kit"}
	};
	requiresFire = 1;
	requiredInteractionModelGroup = "WorkBench";
	components[] = 
	{
		{3, "Exile_Item_Sand"},
		{1, "Exile_Item_MetalBoard"},
		{2, "Exile_Item_MetalPole"},
		{2, "Exile_Item_WoodPlank"}
	};
	category = "Extended Base Items";
};

};
class CfgExileArsenal
{
	class Exile_Uniform_BambiOverall				{ quality = 1; price = 1; sellPrice = 1; };

	#include "cfg\RHS\ItemListRHS.hpp"
	#include "cfg\CUP\ItemListCUP.hpp"
	#include "cfg\TRYK\ItemListTRYK.hpp"
	
	
	///////////////////////////////////////////////////////////////////////////////
	// Civillian Clothing
	///////////////////////////////////////////////////////////////////////////////
	class U_C_Journalist 							{ quality = 1; price = 25; };
	class U_C_Poloshirt_blue 						{ quality = 1; price = 25; };
	class U_C_Poloshirt_burgundy 					{ quality = 1; price = 25; };
	class U_C_Poloshirt_salmon 						{ quality = 1; price = 25; };
	class U_C_Poloshirt_stripped 					{ quality = 1; price = 25; };
	class U_C_Poloshirt_tricolour 					{ quality = 1; price = 25; };
	class U_C_Poor_1 								{ quality = 1; price = 25; };
	class U_C_Poor_2 								{ quality = 1; price = 25; };
	class U_C_Poor_shorts_1 						{ quality = 1; price = 25; };
	class U_C_Scientist 							{ quality = 1; price = 25; };
	class U_OrestesBody 							{ quality = 3; price = 45; };
	class U_Rangemaster 							{ quality = 1; price = 45; };
	class U_NikosAgedBody 							{ quality = 3; price = 45; };
	class U_NikosBody 								{ quality = 3; price = 45; };
	class U_Competitor 								{ quality = 1; price = 45; };

	///////////////////////////////////////////////////////////////////////////////
	// Soldier Uniforms
	///////////////////////////////////////////////////////////////////////////////
	class U_B_CombatUniform_mcam 					{ quality = 2; price = 55; };
	class U_B_CombatUniform_mcam_tshirt 			{ quality = 1; price = 55; };
	class U_B_CombatUniform_mcam_vest 				{ quality = 1; price = 55; };
	class U_B_CombatUniform_mcam_worn 				{ quality = 1; price = 55; };
	class U_B_CTRG_1 								{ quality = 2; price = 55; };
	class U_B_CTRG_2 								{ quality = 2; price = 55; };
	class U_B_CTRG_3								{ quality = 2; price = 55; };
	class U_I_CombatUniform 						{ quality = 1; price = 55; };
	class U_I_CombatUniform_shortsleeve				{ quality = 1; price = 55; };
	class U_I_CombatUniform_tshirt					{ quality = 1; price = 55; };
	class U_I_OfficerUniform						{ quality = 1; price = 55; };
	class U_O_CombatUniform_ocamo 					{ quality = 1; price = 55; };
	class U_O_CombatUniform_oucamo 					{ quality = 1; price = 55; };
	class U_O_OfficerUniform_ocamo 					{ quality = 3; price = 100; };
	class U_B_SpecopsUniform_sgg 					{ quality = 3; price = 100; };
	class U_O_SpecopsUniform_blk 					{ quality = 3; price = 100; };
	class U_O_SpecopsUniform_ocamo 					{ quality = 3; price = 100; };
	class U_I_G_Story_Protagonist_F 				{ quality = 3; price = 125; };
	class Exile_Uniform_Woodland 					{ quality = 3; price = 200; };

	///////////////////////////////////////////////////////////////////////////////
	// Guerilla Uniforms
	///////////////////////////////////////////////////////////////////////////////
	class U_C_HunterBody_grn						{ quality = 1; price = 45; };
	class U_IG_Guerilla1_1							{ quality = 1; price = 45; };
	class U_IG_Guerilla2_1							{ quality = 2; price = 65; };
	class U_IG_Guerilla2_2							{ quality = 1; price = 45; };
	class U_IG_Guerilla2_3							{ quality = 1; price = 45; };
	class U_IG_Guerilla3_1							{ quality = 1; price = 45; };
	class U_BG_Guerilla2_1							{ quality = 1; price = 45; };
	class U_IG_Guerilla3_2							{ quality = 1; price = 45; };
	class U_BG_Guerrilla_6_1						{ quality = 2; price = 60; };
	class U_BG_Guerilla1_1							{ quality = 1; price = 45; };
	class U_BG_Guerilla2_2							{ quality = 1; price = 45; };
	class U_BG_Guerilla2_3							{ quality = 1; price = 45; };
	class U_BG_Guerilla3_1							{ quality = 1; price = 40; };
	class U_BG_leader								{ quality = 1; price = 40; };
	class U_IG_leader								{ quality = 1; price = 40; };
	class U_I_G_resistanceLeader_F					{ quality = 3; price = 100; };

	///////////////////////////////////////////////////////////////////////////////
	// Ghillie Suits
	///////////////////////////////////////////////////////////////////////////////
	class U_B_FullGhillie_ard						{ quality = 3; price = 500; };
	class U_B_FullGhillie_lsh						{ quality = 3; price = 500; };
	class U_B_FullGhillie_sard						{ quality = 3; price = 500; };
	class U_B_GhillieSuit							{ quality = 2; price = 500; };
	class U_I_FullGhillie_ard						{ quality = 3; price = 500; };
	class U_I_FullGhillie_lsh						{ quality = 3; price = 500; };
	class U_I_FullGhillie_sard						{ quality = 3; price = 500; };
	class U_I_GhillieSuit							{ quality = 2; price = 500; };
	class U_O_FullGhillie_ard						{ quality = 3; price = 500; };
	class U_O_FullGhillie_lsh						{ quality = 3; price = 500; };
	class U_O_FullGhillie_sard						{ quality = 3; price = 500; };
	class U_O_GhillieSuit							{ quality = 2; price = 500; };

	///////////////////////////////////////////////////////////////////////////////
	// Wet Suits
	///////////////////////////////////////////////////////////////////////////////
	class U_I_Wetsuit								{ quality = 3; price = 300; };
	class U_O_Wetsuit								{ quality = 3; price = 300; };
	class U_B_Wetsuit								{ quality = 3; price = 300; };
	class U_B_survival_uniform						{ quality = 3; price = 300; };

	///////////////////////////////////////////////////////////////////////////////
	// Bandolliers
	///////////////////////////////////////////////////////////////////////////////
	class V_BandollierB_blk							{ quality = 1; price = 100; };
	class V_BandollierB_cbr							{ quality = 1; price = 100; };
	class V_BandollierB_khk							{ quality = 1; price = 100; };
	class V_BandollierB_oli							{ quality = 1; price = 100; };
	class V_BandollierB_rgr							{ quality = 1; price = 100; };

	///////////////////////////////////////////////////////////////////////////////
	// Chestrigs
	///////////////////////////////////////////////////////////////////////////////
	class V_Chestrig_blk 							{ quality = 1; price = 50; };
	class V_Chestrig_khk 							{ quality = 1; price = 50; };
	class V_Chestrig_oli 							{ quality = 1; price = 50; };
	class V_Chestrig_rgr 							{ quality = 1; price = 50; };

	///////////////////////////////////////////////////////////////////////////////
	// Vests
	///////////////////////////////////////////////////////////////////////////////
	class V_Press_F									{ quality = 1; price = 20; };
	class V_Rangemaster_belt						{ quality = 1; price = 20; };
	class V_TacVest_blk								{ quality = 2; price = 100; };
	class V_TacVest_blk_POLICE						{ quality = 3; price = 500; };
	class V_TacVest_brn								{ quality = 2; price = 50; };
	class V_TacVest_camo							{ quality = 2; price = 50; };
	class V_TacVest_khk								{ quality = 2; price = 50; };
	class V_TacVest_oli								{ quality = 2; price = 50; };
	class V_TacVestCamo_khk							{ quality = 2; price = 50; };
	class V_TacVestIR_blk							{ quality = 2; price = 50; };
	class V_I_G_resistanceLeader_F					{ quality = 2; price = 50; };

	///////////////////////////////////////////////////////////////////////////////
	// Harnesses
	///////////////////////////////////////////////////////////////////////////////
	class V_HarnessO_brn							{ quality = 1; price = 100; };
	class V_HarnessO_gry							{ quality = 1; price = 100; };
	class V_HarnessOGL_brn							{ quality = 1; price = 100; };
	class V_HarnessOGL_gry							{ quality = 1; price = 100; };
	class V_HarnessOSpec_brn						{ quality = 1; price = 100; };
	class V_HarnessOSpec_gry						{ quality = 1; price = 100; };

	///////////////////////////////////////////////////////////////////////////////
	// Plate Carriers
	///////////////////////////////////////////////////////////////////////////////
	class V_PlateCarrier1_blk 						{ quality = 1; price = 300; };
	class V_PlateCarrier1_rgr 						{ quality = 1; price = 300; };
	class V_PlateCarrier2_rgr 						{ quality = 2; price = 300; };
	class V_PlateCarrier3_rgr 						{ quality = 2; price = 300; };
	class V_PlateCarrierGL_blk 						{ quality = 3; price = 500; };
	class V_PlateCarrierGL_mtp 						{ quality = 3; price = 500; };
	class V_PlateCarrierGL_rgr 						{ quality = 3; price = 500; };
	class V_PlateCarrierH_CTRG 						{ quality = 2; price = 300; };
	class V_PlateCarrierIA1_dgtl 					{ quality = 2; price = 300; };
	class V_PlateCarrierIA2_dgtl 					{ quality = 2; price = 300; };
	class V_PlateCarrierIAGL_dgtl 					{ quality = 3; price = 300; };
	class V_PlateCarrierIAGL_oli 					{ quality = 3; price = 400; };
	class V_PlateCarrierL_CTRG 						{ quality = 2; price = 400; };
	class V_PlateCarrierSpec_blk 					{ quality = 3; price = 400; };
	class V_PlateCarrierSpec_mtp 					{ quality = 3; price = 400; };
	class V_PlateCarrierSpec_rgr 					{ quality = 3; price = 400; };

	///////////////////////////////////////////////////////////////////////////////
	// Caps
	///////////////////////////////////////////////////////////////////////////////
	class H_Cap_blk 								{ quality = 1; price = 6; };
	class H_Cap_blk_Raven 							{ quality = 1; price = 6; };
	class H_Cap_blu 								{ quality = 1; price = 6; };
	class H_Cap_brn_SPECOPS 						{ quality = 1; price = 6; };
	class H_Cap_grn 								{ quality = 1; price = 6; };
	class H_Cap_headphones 							{ quality = 1; price = 6; };
	class H_Cap_khaki_specops_UK 					{ quality = 1; price = 6; };
	class H_Cap_oli 								{ quality = 1; price = 6; };
	class H_Cap_press 								{ quality = 1; price = 6; };
	class H_Cap_red 								{ quality = 1; price = 6; };
	class H_Cap_tan 								{ quality = 1; price = 6; };
	class H_Cap_tan_specops_US 						{ quality = 1; price = 6; };

	///////////////////////////////////////////////////////////////////////////////
	// Military Caps
	///////////////////////////////////////////////////////////////////////////////
	class H_MilCap_blue 							{ quality = 1; price = 8; };
	class H_MilCap_dgtl 							{ quality = 1; price = 8; };
	class H_MilCap_mcamo 							{ quality = 1; price = 8; };
	class H_MilCap_ocamo 							{ quality = 1; price = 8; };
	class H_MilCap_oucamo 							{ quality = 1; price = 8; };
	class H_MilCap_rucamo 							{ quality = 1; price = 8; };

	///////////////////////////////////////////////////////////////////////////////
	// Beanies
	///////////////////////////////////////////////////////////////////////////////
	class H_Watchcap_blk 							{ quality = 1; price = 6; };
	class H_Watchcap_camo 							{ quality = 1; price = 6; };
	class H_Watchcap_khk 							{ quality = 1; price = 6; };
	class H_Watchcap_sgg 							{ quality = 1; price = 6; };

	///////////////////////////////////////////////////////////////////////////////
	// Bandannas
	///////////////////////////////////////////////////////////////////////////////
	class H_Bandanna_camo							{ quality = 1; price = 4; };
	class H_Bandanna_cbr							{ quality = 1; price = 4; };
	class H_Bandanna_gry							{ quality = 1; price = 4; };
	class H_Bandanna_khk							{ quality = 1; price = 4; };
	class H_Bandanna_khk_hs							{ quality = 1; price = 4; };
	class H_Bandanna_mcamo							{ quality = 1; price = 4; };
	class H_Bandanna_sgg							{ quality = 1; price = 4; };
	class H_Bandanna_surfer							{ quality = 1; price = 4; };

	///////////////////////////////////////////////////////////////////////////////
	// Boonie Hats
	///////////////////////////////////////////////////////////////////////////////
	class H_Booniehat_dgtl							{ quality = 1; price = 6; };
	class H_Booniehat_dirty							{ quality = 1; price = 6; };
	class H_Booniehat_grn							{ quality = 1; price = 6; };
	class H_Booniehat_indp							{ quality = 1; price = 6; };
	class H_Booniehat_khk							{ quality = 1; price = 6; };
	class H_Booniehat_khk_hs						{ quality = 1; price = 6; };
	class H_Booniehat_mcamo							{ quality = 1; price = 6; };
	class H_Booniehat_tan							{ quality = 1; price = 6; };

	///////////////////////////////////////////////////////////////////////////////
	// Hats
	///////////////////////////////////////////////////////////////////////////////
	class H_Hat_blue								{ quality = 1; price = 6; };
	class H_Hat_brown								{ quality = 1; price = 6; };
	class H_Hat_camo								{ quality = 1; price = 6; };
	class H_Hat_checker								{ quality = 1; price = 6; };
	class H_Hat_grey								{ quality = 1; price = 6; };
	class H_Hat_tan									{ quality = 1; price = 6; };
	class H_StrawHat								{ quality = 1; price = 6; };
	class H_StrawHat_dark							{ quality = 1; price = 6; };

	///////////////////////////////////////////////////////////////////////////////
	// Racing Helmets
	///////////////////////////////////////////////////////////////////////////////
	class H_RacingHelmet_1_F						{ quality = 1; price = 600; };
	class H_RacingHelmet_2_F						{ quality = 1; price = 600; };
	class H_RacingHelmet_3_F						{ quality = 1; price = 600; };
	class H_RacingHelmet_4_F						{ quality = 1; price = 600; };
	class H_RacingHelmet_1_black_F					{ quality = 1; price = 600; };	
	class H_RacingHelmet_1_blue_F					{ quality = 1; price = 600; };	
	class H_RacingHelmet_1_green_F					{ quality = 1; price = 600; };	
	class H_RacingHelmet_1_red_F					{ quality = 1; price = 600; };	
	class H_RacingHelmet_1_white_F					{ quality = 1; price = 600; };	
	class H_RacingHelmet_1_yellow_F					{ quality = 1; price = 600; };	
	class H_RacingHelmet_1_orange_F					{ quality = 1; price = 600; };	

	///////////////////////////////////////////////////////////////////////////////
	// Berets
	///////////////////////////////////////////////////////////////////////////////
	class H_Beret_02								{ quality = 1; price = 6; };
	class H_Beret_blk								{ quality = 1; price = 6; };
	class H_Beret_blk_POLICE						{ quality = 1; price = 6; };
	class H_Beret_brn_SF							{ quality = 1; price = 6; };
	class H_Beret_Colonel							{ quality = 3; price = 8; };
	class H_Beret_grn								{ quality = 1; price = 6; };
	class H_Beret_grn_SF							{ quality = 1; price = 6; };
	class H_Beret_ocamo								{ quality = 1; price = 6; };
	class H_Beret_red								{ quality = 1; price = 6; };

	///////////////////////////////////////////////////////////////////////////////
	// Shemags
	///////////////////////////////////////////////////////////////////////////////
	class H_Shemag_khk								{ quality = 1; price = 10; };
	class H_Shemag_olive							{ quality = 1; price = 10; };
	class H_Shemag_olive_hs							{ quality = 1; price = 10; };
	class H_Shemag_tan								{ quality = 1; price = 10; };
	class H_ShemagOpen_khk							{ quality = 1; price = 10; };
	class H_ShemagOpen_tan							{ quality = 1; price = 10; };
	class H_TurbanO_blk								{ quality = 1; price = 30; };

	///////////////////////////////////////////////////////////////////////////////
	// Light Helmets
	///////////////////////////////////////////////////////////////////////////////
	class H_HelmetB_light							{ quality = 1; price = 20; };
	class H_HelmetB_light_black						{ quality = 1; price = 20; };
	class H_HelmetB_light_desert					{ quality = 1; price = 20; };
	class H_HelmetB_light_grass						{ quality = 1; price = 20; };
	class H_HelmetB_light_sand						{ quality = 1; price = 20; };
	class H_HelmetB_light_snakeskin					{ quality = 1; price = 20; };

	///////////////////////////////////////////////////////////////////////////////
	// Helmets
	///////////////////////////////////////////////////////////////////////////////
	class H_HelmetIA								{ quality = 1; price = 100; };
	class H_HelmetIA_camo							{ quality = 1; price = 100; };
	class H_HelmetIA_net							{ quality = 1; price = 100; };
	class H_HelmetB									{ quality = 2; price = 100; };
	class H_HelmetB_black							{ quality = 2; price = 100; };
	class H_HelmetB_camo							{ quality = 3; price = 100; }; // This one is awesome!
	class H_HelmetB_desert							{ quality = 2; price = 100; };
	class H_HelmetB_grass							{ quality = 2; price = 100; };
	class H_HelmetB_paint							{ quality = 2; price = 100; };
	class H_HelmetB_plain_blk						{ quality = 2; price = 100; };
	class H_HelmetB_sand							{ quality = 2; price = 100; };
	class H_HelmetB_snakeskin						{ quality = 2; price = 100; };

	///////////////////////////////////////////////////////////////////////////////
	// Spec Ops Helmets
	///////////////////////////////////////////////////////////////////////////////
	class H_HelmetSpecB								{ quality = 2; price = 200; };
	class H_HelmetSpecB_blk							{ quality = 2; price = 200; };
	class H_HelmetSpecB_paint1						{ quality = 2; price = 200; };
	class H_HelmetSpecB_paint2						{ quality = 2; price = 200; };

	///////////////////////////////////////////////////////////////////////////////
	// Super Helmets
	///////////////////////////////////////////////////////////////////////////////
	class H_HelmetO_ocamo							{ quality = 3; price = 150; };
	class H_HelmetO_oucamo							{ quality = 3; price = 150; };
	class H_HelmetSpecO_blk							{ quality = 3; price = 100; };
	class H_HelmetSpecO_ocamo						{ quality = 3; price = 100; };
	class H_HelmetLeaderO_ocamo						{ quality = 3; price = 200; };
	class H_HelmetLeaderO_oucamo					{ quality = 3; price = 200; };

	///////////////////////////////////////////////////////////////////////////////
	// Pointer Attachments
	///////////////////////////////////////////////////////////////////////////////
	class acc_flashlight 							{ quality = 1; price = 4; };
	class acc_pointer_IR 							{ quality = 1; price = 10; };

	///////////////////////////////////////////////////////////////////////////////
	// Bitpod Attachments
	///////////////////////////////////////////////////////////////////////////////
	class bipod_01_F_blk	 						{ quality = 1; price = 10; };
	class bipod_01_F_mtp	 						{ quality = 1; price = 10; };
	class bipod_01_F_snd	 						{ quality = 1; price = 10; };
	class bipod_02_F_blk	 						{ quality = 1; price = 10; };
	class bipod_02_F_hex	 						{ quality = 1; price = 10; };
	class bipod_02_F_tan	 						{ quality = 1; price = 10; };
	class bipod_03_F_blk	 						{ quality = 1; price = 10; };
	class bipod_03_F_oli	 						{ quality = 1; price = 10; };

	///////////////////////////////////////////////////////////////////////////////
	// Muzzle Attachments
	///////////////////////////////////////////////////////////////////////////////
	class muzzle_snds_338_black 					{ quality = 2; price = 25; };
	class muzzle_snds_338_green 					{ quality = 2; price = 25; };
	class muzzle_snds_338_sand 						{ quality = 2; price = 25; };
	class muzzle_snds_93mmg 						{ quality = 2; price = 10; };
	class muzzle_snds_93mmg_tan 					{ quality = 2; price = 10; };
	class muzzle_snds_acp 							{ quality = 1; price = 10; };
	class muzzle_snds_B 							{ quality = 1; price = 20; };
	class muzzle_snds_H 							{ quality = 2; price = 20; };
	class muzzle_snds_H_MG 							{ quality = 2; price = 20; };
	class muzzle_snds_H_SW 							{ quality = 2; price = 20; };
	class muzzle_snds_L 							{ quality = 1; price = 10; };
	class muzzle_snds_M 							{ quality = 1; price = 10; };

	///////////////////////////////////////////////////////////////////////////////
	// Money
	///////////////////////////////////////////////////////////////////////////////
	class CUP_item_Money							{ quality = 3; price = 500000;sellPrice = 500000; };

	///////////////////////////////////////////////////////////////////////////////
	// Static MGs
	///////////////////////////////////////////////////////////////////////////////
	class O_HMG_01_weapon_F 						{ quality = 3; price = 50000; };
	class O_HMG_01_support_F 						{ quality = 3; price = 10000; };

	class O_HMG_01_high_weapon_F 					{ quality = 3; price = 60000; };
	class O_HMG_01_support_high_F 					{ quality = 3; price = 20000; };

	///////////////////////////////////////////////////////////////////////////////
	// Optic Attachments
	///////////////////////////////////////////////////////////////////////////////
	class optic_Aco									{ quality = 1; price = 70; };
	class optic_ACO_grn								{ quality = 1; price = 70; };
	class optic_ACO_grn_smg							{ quality = 1; price = 70; };
	class optic_Aco_smg								{ quality = 1; price = 70; };
	class optic_AMS									{ quality = 3; price = 300; };
	class optic_AMS_khk								{ quality = 3; price = 300; };
	class optic_AMS_snd								{ quality = 3; price = 300; };
	class optic_Arco								{ quality = 1; price = 100; };
	class optic_DMS									{ quality = 1; price = 150; };
	class optic_Hamr								{ quality = 3; price = 200; };
	class optic_Holosight							{ quality = 1; price = 50; };
	class optic_Holosight_smg						{ quality = 1; price = 50; };
	class optic_KHS_blk								{ quality = 3; price = 300; };
	class optic_KHS_hex								{ quality = 3; price = 300; };
	class optic_KHS_old								{ quality = 3; price = 300; };
	class optic_KHS_tan								{ quality = 3; price = 300; };
	class optic_LRPS								{ quality = 2; price = 400; };
	class optic_MRCO								{ quality = 1; price = 100; };
	class optic_MRD									{ quality = 1; price = 10; };
	class optic_SOS									{ quality = 2; price = 200; };
	class optic_Yorris								{ quality = 1; price = 10; };

	///////////////////////////////////////////////////////////////////////////////
	// Hardware
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Item_Rope							{ quality = 1; price = 20; };
	class Exile_Item_DuctTape						{ quality = 1; price = 300; };
	class Exile_Item_ExtensionCord					{ quality = 1; price = 40; };
	class Exile_Item_FuelCanisterEmpty				{ quality = 1; price = 40; };
	class Exile_Item_JunkMetal						{ quality = 1; price = 400; };
	class Exile_Item_LightBulb						{ quality = 1; price = 20; };
	class Exile_Item_MetalBoard						{ quality = 1; price = 600; };
	class Exile_Item_FloodLightKit					{ quality = 1; price = 700; };
	class Exile_Item_PortableGeneratorKit			{ quality = 1; price = 2500; };
	class Exile_Item_SafeKit						{ quality = 3; price = 10000; };
	class Exile_Item_CodeLock						{ quality = 2; price = 5000; };
	class Exile_Item_Laptop							{ quality = 2; price = 9000; };
	class Exile_Item_BaseCameraKit					{ quality = 2; price = 5000; };
	class Exile_Magazine_Battery					{ quality = 1; price = 7500; };
	class Exile_Item_CamoTentKit					{ quality = 1; price = 250; };
	class Exile_Item_MetalPole						{ quality = 1; price = 800; };
	class Exile_Item_CordlessScrewdriver			{ quality = 1; price = 750; };
	class Exile_Item_Hammer							{ quality = 1; price = 600; };
	class Exile_Item_OilCanister					{ quality = 1; price = 1750; };
	class Exile_Item_Screwdriver					{ quality = 1; price = 250; };
	class Exile_Item_Shovel							{ quality = 1; price = 700; };
	class Exile_Item_Wrench							{ quality = 1; price = 250; };
	class Exile_Item_ZipTie							{ quality = 1; price = 250; };
	class Exile_Item_Cement							{ quality = 1; price = 800; };
	class Exile_Item_Sand							{ quality = 1; price = 600; };
	class Exile_Item_MetalScrews					{ quality = 1; price = 100; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Food
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Item_EMRE							{ quality = 3; price = 75; }; //75, 60
	class Exile_Item_GloriousKnakworst				{ quality = 3; price = 40; }; //60, 30
	class Exile_Item_Surstromming					{ quality = 3; price = 34; }; //55, 25
	class Exile_Item_SausageGravy					{ quality = 3; price = 30; }; //50, 25
	class Exile_Item_Catfood						{ quality = 2; price = 24; }; //40, 40
	class Exile_Item_ChristmasTinner				{ quality = 3; price = 20; }; //40, 60
	class Exile_Item_BBQSandwich					{ quality = 3; price = 20; }; //40, 60
	class Exile_Item_Dogfood						{ quality = 2; price = 18; }; //30, 30
	class Exile_Item_BeefParts						{ quality = 2; price = 18; }; //30, 30
	class Exile_Item_Cheathas						{ quality = 2; price = 18; }; //30, 30
	class Exile_Item_Noodles						{ quality = 1; price = 14; }; //25, 50
	class Exile_Item_SeedAstics						{ quality = 1; price = 12; }; //20, 40
	class Exile_Item_Raisins						{ quality = 1; price = 10; }; //15, 30
	class Exile_Item_Moobar							{ quality = 1; price = 8; }; //10, 30
	class Exile_Item_InstantCoffee					{ quality = 1; price = 30; }; //5, 10
	class Exile_Item_CockONut						{ quality = 1; price = 60; }; //5, 10
	class Exile_Item_DsNuts							{ quality = 1; price = 70; }; //5, 10
	class Exile_Item_Can_Empty						{ quality = 1; price = 1; sellPrice = 1; };

	///////////////////////////////////////////////////////////////////////////////
	// Drinks
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Item_PlasticBottleCoffee	 		{ quality = 3; price = 100; }; //100, 60
	class Exile_Item_PowerDrink						{ quality = 3; price = 60; }; //95, 10
	class Exile_Item_PlasticBottleFreshWater 		{ quality = 2; price = 50; sellPrice = 4; }; //80, 15
	class Exile_Item_Beer 							{ quality = 1; price = 50; }; //75, 30
	class Exile_Item_EnergyDrink					{ quality = 1; price = 40; }; //75, 20
	class Exile_Item_MountainDupe					{ quality = 1; price = 30; }; //50, 20
	class Exile_Item_PlasticBottleEmpty				{ quality = 1; price = 6; };

	///////////////////////////////////////////////////////////////////////////////
	// First Aid
	///////////////////////////////////////////////////////////////////////////////	
	class Exile_Item_InstaDoc                       { quality = 1; price = 1250; };
	class Exile_Item_Vishpirin						{ quality = 1; price = 300; };
	class Exile_Item_Bandage	                    { quality = 1; price = 100; };
	class Exile_Item_Heatpack	                    { quality = 1; price = 50; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Tools
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Item_Matches 						{ quality = 1; price = 60; };
	class Exile_Item_CookingPot						{ quality = 2; price = 80; };
	class Exile_Melee_Axe							{ quality = 1; price = 100; };
	class Exile_Item_CanOpener						{ quality = 1; price = 80; };
	class Exile_Item_Handsaw						{ quality = 1; price = 500; };
	class Exile_Item_Pliers							{ quality = 1; price = 350; };
	class Exile_Item_Grinder						{ quality = 1; price = 1250; };

	///////////////////////////////////////////////////////////////////////////////
	// Navigation
	///////////////////////////////////////////////////////////////////////////////
	class ItemWatch									{ quality = 1; price = 2; };	
	class ItemGPS									{ quality = 1; price = 40; };
	class ItemMap									{ quality = 1; price = 6; };
	class ItemCompass								{ quality = 1; price = 6; };
	class ItemRadio									{ quality = 1; price = 40; };
	class Binocular									{ quality = 1; price = 40; };
	class Rangefinder								{ quality = 2; price = 200; };
	class NVGoggles									{ quality = 2; price = 300; };
	class NVGoggles_INDEP							{ quality = 2; price = 300; };
	class NVGoggles_OPFOR							{ quality = 2; price = 300; };
	class Exile_Item_XM8							{ quality = 2; price = 2; };	
	class rhsusf_ANPVS_14                           { quality = 2; price = 90; };
	class rhsusf_ANPVS_15                           { quality = 2; price = 95; };
	class lerca_1200_black                          { quality = 2; price = 100; };
	class lerca_1200_tan                            { quality = 2; price = 100; };
	class Leupold_Mk4                               { quality = 2; price = 105; };
	class rhs_pdu4                                  { quality = 2; price = 95; };

	///////////////////////////////////////////////////////////////////////////////
	// Watch out for a Walter fart! He has gas!
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Headgear_GasMask					{ quality = 3; price = 500; };

	///////////////////////////////////////////////////////////////////////////////
	// Rebreather
	///////////////////////////////////////////////////////////////////////////////
	class V_RebreatherB								{ quality = 2; price = 250; };
	class V_RebreatherIA							{ quality = 2; price = 250; };
	class V_RebreatherIR							{ quality = 2; price = 250; };

	///////////////////////////////////////////////////////////////////////////////
	// Pilot Stuff
	///////////////////////////////////////////////////////////////////////////////
	class B_Parachute								{ quality = 3; price = 150; };
	class H_CrewHelmetHeli_B						{ quality = 2; price = 150; };
	class H_CrewHelmetHeli_I						{ quality = 2; price = 150; };
	class H_CrewHelmetHeli_O						{ quality = 2; price = 150; };
	class H_HelmetCrew_I							{ quality = 1; price = 100; };
	class H_HelmetCrew_B							{ quality = 1; price = 100; };
	class H_HelmetCrew_O							{ quality = 1; price = 100; };
	class H_PilotHelmetHeli_B						{ quality = 3; price = 100; };
	class H_PilotHelmetHeli_I						{ quality = 3; price = 100; };
	class H_PilotHelmetHeli_O						{ quality = 3; price = 100; };
	class Exile_Headgear_SantaHat					{ quality = 3; price = 300; };
	class U_B_HeliPilotCoveralls					{ quality = 1; price = 80; };
	class U_B_PilotCoveralls						{ quality = 1; price = 60; };
	class U_I_HeliPilotCoveralls					{ quality = 1; price = 60; };
	class U_I_pilotCoveralls						{ quality = 1; price = 60; };
	class U_O_PilotCoveralls						{ quality = 1; price = 60; };
	class H_PilotHelmetFighter_B					{ quality = 2; price = 150; };
	class H_PilotHelmetFighter_I					{ quality = 2; price = 150; };
	class H_PilotHelmetFighter_O					{ quality = 2; price = 150; };

	///////////////////////////////////////////////////////////////////////////////
	// DLC Driver Uniforms
	///////////////////////////////////////////////////////////////////////////////
	class U_C_Driver_1								{ quality = 3; price = 150; };
	class U_C_Driver_2								{ quality = 3; price = 150; };
	class U_C_Driver_3								{ quality = 3; price = 150; };
	class U_C_Driver_4								{ quality = 3; price = 150; };
	class U_C_Driver_1_black						{ quality = 3; price = 300; };
	class U_C_Driver_1_blue							{ quality = 3; price = 300; };
	class U_C_Driver_1_green						{ quality = 3; price = 300; };
	class U_C_Driver_1_red							{ quality = 3; price = 300; };
	class U_C_Driver_1_white						{ quality = 3; price = 300; };
	class U_C_Driver_1_yellow						{ quality = 3; price = 300; };
	class U_C_Driver_1_orange						{ quality = 3; price = 300; };

	///////////////////////////////////////////////////////////////////////////////
	// Backpacks
	///////////////////////////////////////////////////////////////////////////////
	class B_HuntingBackpack							{ quality = 3; price = 70; };
	class B_OutdoorPack_blk							{ quality = 1; price = 80; };
	class B_OutdoorPack_blu							{ quality = 1; price = 80; };
	class B_OutdoorPack_tan							{ quality = 1; price = 80; };
	class B_AssaultPack_blk							{ quality = 1; price = 90; };
	class B_AssaultPack_cbr							{ quality = 1; price = 90; };
	class B_AssaultPack_dgtl						{ quality = 1; price = 90; };
	class B_AssaultPack_khk							{ quality = 1; price = 90; };
	class B_AssaultPack_mcamo						{ quality = 1; price = 90; };
	class B_AssaultPack_rgr							{ quality = 1; price = 90; };
	class B_AssaultPack_sgg							{ quality = 1; price = 90; };
	class B_FieldPack_blk							{ quality = 2; price = 120; };
	class B_FieldPack_cbr							{ quality = 2; price = 120; };
	class B_FieldPack_ocamo							{ quality = 2; price = 120; };
	class B_FieldPack_oucamo						{ quality = 2; price = 120; };
	class B_TacticalPack_blk						{ quality = 2; price = 150; };
	class B_TacticalPack_rgr						{ quality = 2; price = 150; };
	class B_TacticalPack_ocamo						{ quality = 2; price = 150; };
	class B_TacticalPack_mcamo						{ quality = 2; price = 150; };
	class B_TacticalPack_oli						{ quality = 2; price = 150; };
	class B_Kitbag_cbr								{ quality = 3; price = 200; };
	class B_Kitbag_mcamo							{ quality = 3; price = 200; };
	class B_Kitbag_sgg								{ quality = 3; price = 200; };
	class B_Bergen_blk								{ quality = 2; price = 200; };
	class B_Bergen_mcamo							{ quality = 2; price = 200; };
	class B_Bergen_rgr								{ quality = 2; price = 200; };
	class B_Bergen_sgg								{ quality = 2; price = 200; };
	class B_Carryall_cbr							{ quality = 3; price = 1000; };
	class B_Carryall_khk							{ quality = 3; price = 1000; };
	class B_Carryall_mcamo							{ quality = 3; price = 1000; };
	class B_Carryall_ocamo							{ quality = 3; price = 1000; };
	class B_Carryall_oli							{ quality = 3; price = 1000; };
	class B_Carryall_oucamo							{ quality = 3; price = 1000; };

	///////////////////////////////////////////////////////////////////////////////
	// Ammunition
	///////////////////////////////////////////////////////////////////////////////
	class 100Rnd_65x39_caseless_mag 				{ quality = 1; price = 100; };
	class 100Rnd_65x39_caseless_mag_Tracer 			{ quality = 2; price = 100; };
	class 10Rnd_127x54_Mag 							{ quality = 1; price = 1000; };
	// Broken in Arma
	class 10Rnd_338_Mag 							{ quality = 1; price = 100; };

	class 10Rnd_762x54_Mag 							{ quality = 1; price = 100; };
	//class 10Rnd_762x51_Mag 						{ quality = 1; price = 100; };
	class 10Rnd_93x64_DMR_05_Mag 					{ quality = 1; price = 200; };
	class 11Rnd_45ACP_Mag 							{ quality = 1; price = 100; };
	class 150Rnd_762x54_Box 						{ quality = 1; price = 100; };
	class 150Rnd_762x54_Box_Tracer 					{ quality = 2; price = 100; };
	class 16Rnd_9x21_Mag 							{ quality = 1; price = 100; };
	class 200Rnd_65x39_cased_Box 					{ quality = 1; price = 100; };
	class 200Rnd_65x39_cased_Box_Tracer 			{ quality = 2; price = 100; };
	class 150Rnd_93x64_Mag 							{ quality = 2; price = 500; };
	class 130Rnd_338_Mag 							{ quality = 2; price = 500; };
	class 20Rnd_556x45_UW_mag 						{ quality = 1; price = 100; };
	class 20Rnd_762x51_Mag 							{ quality = 1; price = 100; };
	class 30Rnd_45ACP_Mag_SMG_01 					{ quality = 1; price = 100; };
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Green 		{ quality = 2; price = 100; };
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow		{ quality = 2; price = 100; };
	class 30Rnd_45ACP_Mag_SMG_01_Tracer_Red			{ quality = 2; price = 100; };
	class 30Rnd_556x45_Stanag 						{ quality = 1; price = 100; };
	class 30Rnd_556x45_Stanag_Tracer_Green 			{ quality = 2; price = 100; };
	class 30Rnd_556x45_Stanag_green  				{ quality = 2; price = 100; };
	class 30Rnd_556x45_Stanag_Tracer_Red 			{ quality = 2; price = 100; };
	class 30Rnd_556x45_Stanag_Tracer_Yellow 		{ quality = 2; price = 100; };
	class 30Rnd_556x45_Stanag_red 					{ quality = 2; price = 100; };
	class 30Rnd_65x39_caseless_green 				{ quality = 1; price = 100; };
	class 30Rnd_65x39_caseless_green_mag_Tracer 	{ quality = 2; price = 100; };
	class 30Rnd_65x39_caseless_mag 					{ quality = 1; price = 100; };
	class 30Rnd_65x39_caseless_mag_Tracer 			{ quality = 2; price = 100; };
	class 30Rnd_9x21_Mag 							{ quality = 1; price = 100; };
	class 5Rnd_127x108_APDS_Mag 					{ quality = 2; price = 600; };
	class 5Rnd_127x108_Mag 							{ quality = 1; price = 500; };
	class 6Rnd_45ACP_Cylinder 						{ quality = 1; price = 100; };
	class 6Rnd_GreenSignal_F 						{ quality = 9000; price = 100; };
	class 6Rnd_RedSignal_F 							{ quality = 9000; price = 100; };
	class 7Rnd_408_Mag 								{ quality = 1; price = 100; };
	class 9Rnd_45ACP_Mag 							{ quality = 1; price = 6; };

	///////////////////////////////////////////////////////////////////////////////
	// Flares
	///////////////////////////////////////////////////////////////////////////////
	class Chemlight_blue							{ quality = 1; price = 2; };
	class Chemlight_green							{ quality = 1; price = 2; };
	class Chemlight_red								{ quality = 1; price = 2; };
	class FlareGreen_F								{ quality = 1; price = 6; };
	class FlareRed_F								{ quality = 1; price = 6; };
	class FlareWhite_F								{ quality = 1; price = 6; };
	class FlareYellow_F								{ quality = 1; price = 6; };
	class UGL_FlareGreen_F							{ quality = 2; price = 8; };
	class UGL_FlareRed_F							{ quality = 2; price = 8; };
	class UGL_FlareWhite_F							{ quality = 2; price = 8; };
	class UGL_FlareYellow_F							{ quality = 2; price = 8; };
	class 3Rnd_UGL_FlareGreen_F						{ quality = 3; price = 8*3; };
	class 3Rnd_UGL_FlareRed_F						{ quality = 3; price = 8*3; };
	class 3Rnd_UGL_FlareWhite_F						{ quality = 3; price = 8*3; };
	class 3Rnd_UGL_FlareYellow_F					{ quality = 3; price = 8*3; };

	///////////////////////////////////////////////////////////////////////////////
	// Smokes
	///////////////////////////////////////////////////////////////////////////////
	class SmokeShell								{ quality = 1; price = 6; };
	class SmokeShellBlue							{ quality = 1; price = 6; };
	class SmokeShellGreen							{ quality = 1; price = 6; };
	class SmokeShellOrange							{ quality = 1; price = 6; };
	class SmokeShellPurple							{ quality = 1; price = 6; };
	class SmokeShellRed								{ quality = 1; price = 6; };
	class SmokeShellYellow							{ quality = 1; price = 6; };
	class 1Rnd_Smoke_Grenade_shell					{ quality = 2; price = 8; };
	class 1Rnd_SmokeBlue_Grenade_shell				{ quality = 2; price = 8; };
	class 1Rnd_SmokeGreen_Grenade_shell				{ quality = 2; price = 8; };
	class 1Rnd_SmokeOrange_Grenade_shell			{ quality = 2; price = 8; };
	class 1Rnd_SmokePurple_Grenade_shell			{ quality = 2; price = 8; };
	class 1Rnd_SmokeRed_Grenade_shell				{ quality = 2; price = 8; };
	class 1Rnd_SmokeYellow_Grenade_shell			{ quality = 2; price = 8; };
	class 3Rnd_Smoke_Grenade_shell					{ quality = 3; price = 8*3; };
	class 3Rnd_SmokeBlue_Grenade_shell				{ quality = 3; price = 8*3; };
	class 3Rnd_SmokeGreen_Grenade_shell				{ quality = 3; price = 8*3; };
	class 3Rnd_SmokeOrange_Grenade_shell			{ quality = 3; price = 8*3; };
	class 3Rnd_SmokePurple_Grenade_shell			{ quality = 3; price = 8*3; };
	class 3Rnd_SmokeRed_Grenade_shell				{ quality = 3; price = 8*3; };
	class 3Rnd_SmokeYellow_Grenade_shell			{ quality = 3; price = 8*3; };

	///////////////////////////////////////////////////////////////////////////////
	// Explosives
	///////////////////////////////////////////////////////////////////////////////
	class HandGrenade								{ quality = 3; price = 100; };
	class MiniGrenade								{ quality = 2; price = 100; };
	class B_IR_Grenade								{ quality = 1; price = 100; };
	class O_IR_Grenade								{ quality = 1; price = 100; };
	class I_IR_Grenade								{ quality = 1; price = 100; };
	class 1Rnd_HE_Grenade_shell						{ quality = 2; price = 100; };
	class 3Rnd_HE_Grenade_shell						{ quality = 3; price = 700; };	
	class APERSBoundingMine_Range_Mag				{ quality = 3; price = 5000; };
	class APERSMine_Range_Mag						{ quality = 3; price = 6000; };
	class APERSTripMine_Wire_Mag					{ quality = 3; price = 3000; };
	class ClaymoreDirectionalMine_Remote_Mag		{ quality = 3; price = 3500; };
	class DemoCharge_Remote_Mag						{ quality = 3; price = 7000; };
	class IEDLandBig_Remote_Mag						{ quality = 3; price = 6000; };
	class IEDLandSmall_Remote_Mag					{ quality = 3; price = 3000; };
	class IEDUrbanBig_Remote_Mag					{ quality = 3; price = 8000; };
	class IEDUrbanSmall_Remote_Mag					{ quality = 3; price = 4000; };
	class SatchelCharge_Remote_Mag					{ quality = 3; price = 10000;};
	class SLAMDirectionalMine_Wire_Mag				{ quality = 3; price = 7000; };

	///////////////////////////////////////////////////////////////////////////////
	// Launcher Ammo
	///////////////////////////////////////////////////////////////////////////////
	class RPG32_F									{ quality = 3; price = 15000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Pistols
	///////////////////////////////////////////////////////////////////////////////
	class hgun_ACPC2_F 								{ quality = 1; price = 50; };
	class hgun_P07_F 								{ quality = 1; price = 50; };
	class hgun_Pistol_heavy_01_F 					{ quality = 2; price = 80; };
	class hgun_Pistol_heavy_02_F 					{ quality = 2; price = 80; };
	class hgun_Pistol_Signal_F 						{ quality = 9000; price = 100; };
	class hgun_Rook40_F 							{ quality = 1; price = 50; };

	///////////////////////////////////////////////////////////////////////////////
	// Sub Machine Guns
	///////////////////////////////////////////////////////////////////////////////
	class hgun_PDW2000_F 							{ quality = 1; price = 100; };
	class SMG_01_F 									{ quality = 1; price = 150; };
	class SMG_02_F 									{ quality = 1; price = 150; };

	///////////////////////////////////////////////////////////////////////////////
	// Light Machine Guns
	///////////////////////////////////////////////////////////////////////////////
	class arifle_MX_SW_Black_F						{ quality = 2; price = 500; };
	class arifle_MX_SW_F							{ quality = 2; price = 500; };
	class LMG_Mk200_F								{ quality = 2; price = 500; };
	class LMG_Zafir_F								{ quality = 2; price = 550; };
	class MMG_01_hex_F								{ quality = 3; price = 8000; };
	class MMG_01_tan_F								{ quality = 3; price = 8000; };
	class MMG_02_black_F							{ quality = 3; price = 6500; };
	class MMG_02_camo_F								{ quality = 3; price = 6500; };
	class MMG_02_sand_F								{ quality = 3; price = 6500; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Assault Rifles
	///////////////////////////////////////////////////////////////////////////////
	class arifle_Katiba_C_F							{ quality = 1; price = 150; };
	class arifle_Katiba_F							{ quality = 1; price = 150; };
	class arifle_Katiba_GL_F						{ quality = 2; price = 200; };
	class arifle_Mk20_F								{ quality = 1; price = 150; };
	class arifle_Mk20_GL_F							{ quality = 2; price = 200; };
	class arifle_Mk20_GL_plain_F					{ quality = 2; price = 200; };
	class arifle_Mk20_plain_F						{ quality = 1; price = 150; };
	class arifle_Mk20C_F							{ quality = 1; price = 150; };
	class arifle_Mk20C_plain_F						{ quality = 1; price = 150; };
	class arifle_MX_Black_F							{ quality = 1; price = 450; };
	class arifle_MX_F								{ quality = 1; price = 450; };
	class arifle_MX_GL_Black_F						{ quality = 2; price = 450; };
	class arifle_MX_GL_F							{ quality = 2; price = 450; };
	class arifle_MXC_Black_F						{ quality = 1; price = 350; };
	class arifle_MXC_F								{ quality = 1; price = 350; };
	class arifle_SDAR_F								{ quality = 3; price = 650; };
	class arifle_TRG20_F							{ quality = 1; price = 250; };
	class arifle_TRG21_F							{ quality = 1; price = 250; };
	class arifle_TRG21_GL_F							{ quality = 2; price = 350; };

	///////////////////////////////////////////////////////////////////////////////
	// Sniper Rifles
	///////////////////////////////////////////////////////////////////////////////
	class arifle_MXM_Black_F 						{ quality = 1; price = 550; };
	class arifle_MXM_F 								{ quality = 1; price = 550; };
	class srifle_DMR_01_F 							{ quality = 2; price = 600; };
	class srifle_DMR_02_camo_F 						{ quality = 3; price = 2500; };
	class srifle_DMR_02_F 							{ quality = 3; price = 2500; };
	class srifle_DMR_02_sniper_F 					{ quality = 3; price = 2500; };
	class srifle_DMR_03_F 							{ quality = 3; price = 750; };
	class srifle_DMR_03_khaki_F 					{ quality = 3; price = 750; };
	class srifle_DMR_03_multicam_F 					{ quality = 3; price = 750; };
	class srifle_DMR_03_tan_F 						{ quality = 3; price = 750; };
	class srifle_DMR_03_woodland_F 					{ quality = 3; price = 750; };
	class srifle_DMR_04_F 							{ quality = 3; price = 700; };
	class srifle_DMR_04_Tan_F 						{ quality = 3; price = 700; };
	class srifle_DMR_05_blk_F 						{ quality = 3; price = 3500; };
	class srifle_DMR_05_hex_F 						{ quality = 3; price = 3500; };
	class srifle_DMR_05_tan_f 						{ quality = 3; price = 3500; };
	class srifle_DMR_06_camo_F 						{ quality = 3; price = 800; };
	class srifle_DMR_06_olive_F 					{ quality = 3; price = 800; };
	class srifle_EBR_F 								{ quality = 2; price = 700; };
	class srifle_GM6_camo_F 						{ quality = 3; price = 12500; };
	class srifle_GM6_F 								{ quality = 3; price = 12500; };
	class srifle_LRR_camo_F 						{ quality = 3; price = 10000; };
	class srifle_LRR_F 								{ quality = 3; price = 10000; };

	
	///////////////////////////////////////////////////////////////////////////////
	// BIKES
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Bike_OldBike 						{ quality = 1; price = 40; };
	class Exile_Bike_MountainBike 					{ quality = 1; price = 50; };

	///////////////////////////////////////////////////////////////////////////////
	// QUAD BIKES
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Bike_QuadBike_Black					{ quality = 1; price = 250; };
	class Exile_Bike_QuadBike_Blue					{ quality = 1; price = 250; };
	class Exile_Bike_QuadBike_Red					{ quality = 1; price = 250; };
	class Exile_Bike_QuadBike_White					{ quality = 1; price = 250; };
	class Exile_Bike_QuadBike_Nato					{ quality = 1; price = 250; };
	class Exile_Bike_QuadBike_Csat					{ quality = 1; price = 250; };
	class Exile_Bike_QuadBike_Fia					{ quality = 1; price = 250; };
	class Exile_Bike_QuadBike_Guerilla01			{ quality = 1; price = 250; };
	class Exile_Bike_QuadBike_Guerilla02			{ quality = 1; price = 250; };

	///////////////////////////////////////////////////////////////////////////////
	// KARTS
	//////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Kart_BluKing					{ quality = 1; price = 800; };
	class Exile_Car_Kart_RedStone					{ quality = 1; price = 800; };
	class Exile_Car_Kart_Vrana						{ quality = 1; price = 800; };
	class Exile_Car_Kart_Green						{ quality = 1; price = 800; };
	class Exile_Car_Kart_Blue						{ quality = 1; price = 800; };
	class Exile_Car_Kart_Orange						{ quality = 1; price = 800; };
	class Exile_Car_Kart_White						{ quality = 1; price = 800; };
	class Exile_Car_Kart_Yellow						{ quality = 1; price = 800; };
	class Exile_Car_Kart_Black						{ quality = 1; price = 800; };

	///////////////////////////////////////////////////////////////////////////////
	// MOTOR BOATS
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_MotorBoat_Police				{ quality = 1; price = 900; };
	class Exile_Boat_MotorBoat_Orange				{ quality = 1; price = 900; };
	class Exile_Boat_MotorBoat_White				{ quality = 1; price = 900; };

	///////////////////////////////////////////////////////////////////////////////
	// RUBBER DUCKS
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_RubberDuck_CSAT				{ quality = 1; price = 800; };
	class Exile_Boat_RubberDuck_Digital				{ quality = 1; price = 800; };
	class Exile_Boat_RubberDuck_Orange				{ quality = 1; price = 800; };
	class Exile_Boat_RubberDuck_Blue				{ quality = 1; price = 800; };
	class Exile_Boat_RubberDuck_Black				{ quality = 1; price = 800; };

	///////////////////////////////////////////////////////////////////////////////
	// SDV
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_SDV_CSAT						{ quality = 1; price = 11000; };
	class Exile_Boat_SDV_Digital					{ quality = 1; price = 11000; };
	class Exile_Boat_SDV_Grey						{ quality = 1; price = 11000; };

	///////////////////////////////////////////////////////////////////////////////
	// UH-1H Huey
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Huey_Green 					{ quality = 1; price = 21000; };
	class Exile_Chopper_Huey_Desert					{ quality = 1; price = 21000; };
	class Exile_Chopper_Huey_Armed_Green			{ quality = 1; price = 25000; };
	class Exile_Chopper_Huey_Armed_Desert			{ quality = 1; price = 25000; };

	///////////////////////////////////////////////////////////////////////////////
	// ARMED BOAT
	///////////////////////////////////////////////////////////////////////////////
	class B_Boat_Armed_01_minigun_F            		{ quality = 1; price = 15000; };

	///////////////////////////////////////////////////////////////////////////////
	// Hellcat
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Hellcat_Green				{ quality = 1; price = 27500; };
	class Exile_Chopper_Hellcat_FIA					{ quality = 1; price = 27500; };

	///////////////////////////////////////////////////////////////////////////////
	// Hummingbird
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Hummingbird_Green			{ quality = 1; price = 8000; };


	///////////////////////////////////////////////////////////////////////////////
	// Hummingbird (Civillian)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Hummingbird_Civillian_Blue				{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Red				{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_ION				{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_BlueLine			{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Digital			{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Elliptical		{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Furious			{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_GrayWatcher		{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Jeans				{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Light				{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Shadow			{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Sheriff			{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Speedy			{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Sunset			{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Vrana				{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Wasp				{ quality = 1; price = 6000; };
	class Exile_Chopper_Hummingbird_Civillian_Wave				{ quality = 1; price = 6000; };

	///////////////////////////////////////////////////////////////////////////////
	// Huron
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Huron_Black								{ quality = 1; price = 40000; };
	class Exile_Chopper_Huron_Green								{ quality = 1; price = 165000; };

	///////////////////////////////////////////////////////////////////////////////
	// Mohawk
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Mohawk_FIA								{ quality = 1; price = 20000; };
	
	///////////////////////////////////////////////////////////////////////////////
	// Pawnee
	///////////////////////////////////////////////////////////////////////////////
	class B_Heli_light_01_armed_F								{ quality = 1; price = 150000; };	
	///////////////////////////////////////////////////////////////////////////////
	// Orca
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Orca_CSAT								{ quality = 1; price = 12000; };
	class Exile_Chopper_Orca_Black								{ quality = 1; price = 12000; };
	class Exile_Chopper_Orca_BlackCustom						{ quality = 1; price = 12000; };
	class O_Heli_Light_02_v2_F   			            		{ quality = 1; price = 1500000; };

	///////////////////////////////////////////////////////////////////////////////
	// Taru
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Taru_Transport_CSAT						{ quality = 1; price = 25000; };
	class Exile_Chopper_Taru_Transport_Black					{ quality = 1; price = 25000; };
	
	class Exile_Chopper_Taru_CSAT								{ quality = 1; price = 20000; };
	class Exile_Chopper_Taru_Black								{ quality = 1; price = 20000; };

	class Exile_Chopper_Taru_Covered_CSAT						{ quality = 1; price = 18000; };
	class Exile_Chopper_Taru_Covered_Black						{ quality = 1; price = 18000; };

	///////////////////////////////////////////////////////////////////////////////
	// Cessna
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Plane_Cessna									{ quality = 1; price = 16500; };

	///////////////////////////////////////////////////////////////////////////////
	// Hatchback
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Hatchback_Beige						{ quality = 1; price = 12000; };
	class Exile_Car_Hatchback_Green						{ quality = 1; price = 12000; };
	class Exile_Car_Hatchback_Blue						{ quality = 1; price = 12000; };
	class Exile_Car_Hatchback_BlueCustom				{ quality = 1; price = 12000; };
	class Exile_Car_Hatchback_BeigeCustom				{ quality = 1; price = 12000; };
	class Exile_Car_Hatchback_Yellow					{ quality = 1; price = 12000; };
	class Exile_Car_Hatchback_Grey						{ quality = 1; price = 12000; };
	class Exile_Car_Hatchback_Black						{ quality = 1; price = 12000; };
	class Exile_Car_Hatchback_Dark						{ quality = 1; price = 12000; };
	class Exile_Car_Hatchback_Rusty1					{ quality = 1; price = 12000; };
	class Exile_Car_Hatchback_Rusty2					{ quality = 1; price = 12000; };
	class Exile_Car_Hatchback_Rusty3					{ quality = 1; price = 12000; };

	///////////////////////////////////////////////////////////////////////////////
	// Ikarus
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Ikarus_Blue 				{ quality = 1; price = 17000; };
	class Exile_Car_Ikarus_Red 					{ quality = 1; price = 17000; };
	class Exile_Car_Ikarus_Party 				{ quality = 1; price = 17000; };

	///////////////////////////////////////////////////////////////////////////////
	// Ural (Open)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Ural_Open_Blue			{ quality = 1; price = 25000; };
	class Exile_Car_Ural_Open_Yellow		{ quality = 1; price = 25000; };
	class Exile_Car_Ural_Open_Worker		{ quality = 1; price = 25000; };
	class Exile_Car_Ural_Open_Military		{ quality = 1; price = 25000; };

	///////////////////////////////////////////////////////////////////////////////
	// Ural (Covered)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Ural_Covered_Blue			{ quality = 1; price = 28000; };
	class Exile_Car_Ural_Covered_Yellow			{ quality = 1; price = 28000; };
	class Exile_Car_Ural_Covered_Worker			{ quality = 1; price = 28000; };
	class Exile_Car_Ural_Covered_Military		{ quality = 1; price = 28000; };

	///////////////////////////////////////////////////////////////////////////////
	// SUVXL
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_SUVXL_Black 				{ quality = 1; price = 20000; };

	///////////////////////////////////////////////////////////////////////////////
	// Tractor
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Tractor_Red 				{ quality = 1; price = 2000; };

	///////////////////////////////////////////////////////////////////////////////
	// Tractor (Old)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_OldTractor_Red 				{ quality = 1; price = 1200; };

	///////////////////////////////////////////////////////////////////////////////
	// Tow Tractor
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_TowTractor_White			{ quality = 1; price = 2600; };

	///////////////////////////////////////////////////////////////////////////////
	// Octavius
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Octavius_White				{ quality = 1; price = 6000; };
	class Exile_Car_Octavius_Black				{ quality = 1; price = 6000; };

	///////////////////////////////////////////////////////////////////////////////
	// UAZ
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_UAZ_Green				{ quality = 1; price = 7000; };

	///////////////////////////////////////////////////////////////////////////////
	// UAZ (Open)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_UAZ_Open_Green			{ quality = 1; price = 8000; };

	///////////////////////////////////////////////////////////////////////////////
	// Land Rover
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_LandRover_Red 				{ quality = 1; price = 11000; };
	class Exile_Car_LandRover_Urban 			{ quality = 1; price = 11000; };
	class Exile_Car_LandRover_Green 			{ quality = 1; price = 11000; };
	class Exile_Car_LandRover_Sand 				{ quality = 1; price = 11000; };
	class Exile_Car_LandRover_Desert 			{ quality = 1; price = 11000; };

	///////////////////////////////////////////////////////////////////////////////
	// Land Rover (Ambulance)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_LandRover_Ambulance_Green		{ quality = 1; price = 12000; };
	class Exile_Car_LandRover_Ambulance_Desert		{ quality = 1; price = 12000; };
	class Exile_Car_LandRover_Ambulance_Sand		{ quality = 1; price = 12000; };

	///////////////////////////////////////////////////////////////////////////////
	// Lada
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Lada_Green 				{ quality = 1; price = 6000; };
	class Exile_Car_Lada_Taxi 				{ quality = 1; price = 6000; };
	class Exile_Car_Lada_Red 				{ quality = 1; price = 6000; };
	class Exile_Car_Lada_White 				{ quality = 1; price = 6000; };
	class Exile_Car_Lada_Hipster 			{ quality = 1; price = 6000; };

	///////////////////////////////////////////////////////////////////////////////
	// Volha
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Volha_Blue				{ quality = 1; price = 6000; };
	class Exile_Car_Volha_White				{ quality = 1; price = 6000; };
	class Exile_Car_Volha_Black				{ quality = 1; price = 6000; };

	///////////////////////////////////////////////////////////////////////////////
	// Hatchback (Sport)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Hatchback_Sport_Red					{ quality = 1; price = 14000; };
	class Exile_Car_Hatchback_Sport_Blue				{ quality = 1; price = 14000; };
	class Exile_Car_Hatchback_Sport_Orange				{ quality = 1; price = 14000; };
	class Exile_Car_Hatchback_Sport_White				{ quality = 1; price = 14000; };
	class Exile_Car_Hatchback_Sport_Beige				{ quality = 1; price = 14000; };
	class Exile_Car_Hatchback_Sport_Green				{ quality = 1; price = 14000; };

	///////////////////////////////////////////////////////////////////////////////
	// HEMMT
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_HEMMT 								{ quality = 1; price = 48000; };

	///////////////////////////////////////////////////////////////////////////////
	// Hunter
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Hunter 								{ quality = 1; price = 30500; };
	class B_MRAP_01_hmg_F 								{ quality = 1; price = 139500; };

	///////////////////////////////////////////////////////////////////////////////
	// Ifrit
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Ifrit 								{ quality = 1; price = 34000; };
	class O_MRAP_02_hmg_F 								{ quality = 1; price = 143000; };

	///////////////////////////////////////////////////////////////////////////////
	// Offroad
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Offroad_Red							{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_Beige						{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_White						{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_Blue						{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_DarkRed						{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_BlueCustom					{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_Guerilla01					{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_Guerilla02					{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_Guerilla03					{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_Guerilla04					{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_Guerilla05					{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_Guerilla06					{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_Guerilla07					{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_Guerilla08					{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_Guerilla09					{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_Guerilla10					{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_Guerilla11					{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_Guerilla12					{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_Rusty1						{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_Rusty2						{ quality = 1; price = 16000; };
	class Exile_Car_Offroad_Rusty3						{ quality = 1; price = 16000; };

	///////////////////////////////////////////////////////////////////////////////
	// Offroad (Armed)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Offroad_Armed_Guerilla01 			{ quality = 1; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla02 			{ quality = 1; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla03 			{ quality = 1; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla04 			{ quality = 1; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla05 			{ quality = 1; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla06 			{ quality = 1; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla07 			{ quality = 1; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla08 			{ quality = 1; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla09 			{ quality = 1; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla10 			{ quality = 1; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla11 			{ quality = 1; price = 25000; };
	class Exile_Car_Offroad_Armed_Guerilla12 			{ quality = 1; price = 25000; };

	///////////////////////////////////////////////////////////////////////////////
	// Offroad (Repair)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Offroad_Repair_Civillian 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Red 					{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Beige 				{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_White 				{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Blue 				{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_DarkRed 				{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_BlueCustom 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla01 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla02 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla03 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla04 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla05 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla06 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla07 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla08 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla09 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla10 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla11 			{ quality = 1; price = 12500; };
	class Exile_Car_Offroad_Repair_Guerilla12 			{ quality = 1; price = 12500; };

	///////////////////////////////////////////////////////////////////////////////
	// Strider
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Strider 							{ quality = 1; price = 48000; };
	class I_MRAP_03_hmg_F 							   { quality = 1; price = 168000; };

	///////////////////////////////////////////////////////////////////////////////
	// SUV
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_SUV_Red 							{ quality = 1; price = 14000; };
	class Exile_Car_SUV_Black 							{ quality = 1; price = 14000; };
	class Exile_Car_SUV_Grey 							{ quality = 1; price = 14000; };
	class Exile_Car_SUV_Orange 							{ quality = 1; price = 14000; };

	///////////////////////////////////////////////////////////////////////////////
	// Tempest
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Tempest 							{ quality = 1; price = 48300; };

	///////////////////////////////////////////////////////////////////////////////
	// Van 
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Van_Black 							{ quality = 1; price = 12000; };
	class Exile_Car_Van_White 							{ quality = 1; price = 12000; };
	class Exile_Car_Van_Red 							{ quality = 1; price = 12000; };
	class Exile_Car_Van_Guerilla01 						{ quality = 1; price = 12000; };
	class Exile_Car_Van_Guerilla02 						{ quality = 1; price = 12000; };
	class Exile_Car_Van_Guerilla03 						{ quality = 1; price = 12000; };
	class Exile_Car_Van_Guerilla04 						{ quality = 1; price = 12000; };
	class Exile_Car_Van_Guerilla05 						{ quality = 1; price = 12000; };
	class Exile_Car_Van_Guerilla06 						{ quality = 1; price = 12000; };
	class Exile_Car_Van_Guerilla07 						{ quality = 1; price = 12000; };
	class Exile_Car_Van_Guerilla08 						{ quality = 1; price = 12000; };

	///////////////////////////////////////////////////////////////////////////////
	// Van (Box) 
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Van_Box_Black 						{ quality = 1; price = 17000; };
	class Exile_Car_Van_Box_White 						{ quality = 1; price = 17000; };
	class Exile_Car_Van_Box_Red 						{ quality = 1; price = 17000; };
	class Exile_Car_Van_Box_Guerilla01 					{ quality = 1; price = 17000; };
	class Exile_Car_Van_Box_Guerilla02 					{ quality = 1; price = 17000; };
	class Exile_Car_Van_Box_Guerilla03 					{ quality = 1; price = 17000; };
	class Exile_Car_Van_Box_Guerilla04 					{ quality = 1; price = 17000; };
	class Exile_Car_Van_Box_Guerilla05 					{ quality = 1; price = 17000; };
	class Exile_Car_Van_Box_Guerilla06 					{ quality = 1; price = 17000; };
	class Exile_Car_Van_Box_Guerilla07 					{ quality = 1; price = 17000; };
	class Exile_Car_Van_Box_Guerilla08 					{ quality = 1; price = 17000; };

	///////////////////////////////////////////////////////////////////////////////
	// Van (Fuel) 
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Van_Fuel_Black 						{ quality = 1; price = 15000; };
	class Exile_Car_Van_Fuel_White 						{ quality = 1; price = 15000; };
	class Exile_Car_Van_Fuel_Red 						{ quality = 1; price = 15000; };
	class Exile_Car_Van_Fuel_Guerilla01 				{ quality = 1; price = 15000; };
	class Exile_Car_Van_Fuel_Guerilla02 				{ quality = 1; price = 15000; };
	class Exile_Car_Van_Fuel_Guerilla03 				{ quality = 1; price = 15000; };

	///////////////////////////////////////////////////////////////////////////////
	// Zamak
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Zamak 								{ quality = 1; price = 43000; };
};
class CfgExileCustomCode 
{
	ExileClient_object_player_death_startBleedingOut = 		"GG\overrides\GG_object_player_death_startBleedingOut.sqf";
	ExileClient_object_player_bambiStateBegin =	 			"GG\overrides\GG_object_player_bambiStateBegin.sqf";
	ExileClient_gui_selectSpawnLocation_show = 				"GG\overrides\GG_gui_selectSpawnLocation_show.sqf";
	ExileClient_util_playerEquipment_add = 					"GG\overrides\GG_util_playerEquipment_add.sqf";
	ExileClient_object_item_construct= 						"GG\overrides\GG_object_item_construct.sqf";
    ExileClient_gui_xm8_slide_players_onOpen = 				"GG\overrides\GG_gui_xm8_slide_players_onOpen.sqf";
    ExileClient_construction_handleAbort = 					"GG\overrides\GG_construction_handleAbort.sqf";
    ExileClient_object_item_consume = 						"GG\overrides\GG_object_item_consume.sqf";
    ExileClient_system_lootManager_thread_spawn = 			"GG\overrides\GG_system_lootManager_thread_spawn.sqf";
    ExileClient_object_player_thread_safeZone = 			"GG\SecureSafezones\compiles\GG_safeZone.sqf";
    ExileClient_object_player_event_onEnterSafezone = 		"GG\SecureSafezones\compiles\GG_onEnterSafezone.sqf";
    ExileClient_object_player_event_onLeaveSafezone = 		"GG\SecureSafezones\compiles\GG_onLeaveSafezone.sqf";
    ExileClient_object_vehicle_network_lockResponse = 		"GG\SecureSafezones\compiles\GG_lockResponse.sqf";
    ExileClient_object_player_event_onInventoryOpened = 	"GG\overrides\GG_object_player_event_onInventoryOpened.sqf";
    ExileClient_gui_xm8_show = 								"GG\XM8_apps\scripts\ExileClient_gui_xm8_show.sqf";
    ExileClient_gui_xm8_slide_apps_onOpen = 				"GG\XM8_apps\scripts\ExileClient_gui_xm8_slide_apps_onOpen.sqf";
    ExileClient_gui_xm8_slide = 							"GG\XM8_apps\scripts\ExileClient_gui_xm8_slide.sqf";
    ExileClient_gui_xm8_slide_server_onOpen = 				"GG\overrides\GG_gui_xm8_slide_server_onOpen.sqf";
    ExileServer_system_territory_database_load = 			"GG\ExAdClient\VirtualGarage\CustomCode\ExileServer_system_territory_database_load.sqf";
};

class CfgNetworkMessages {
	class updateBankStats
	{
		module = "banking";
		parameters[] = {"STRING"};
	};

	class depositRequest
	{
		module = "banking";
		parameters[] = {"STRING"};
	};

	class updateATMResponse
	{
		module = "banking";
		parameters[] = {"STRING","STRING"};
	};

	class withdrawalRequest
	{
		module = "banking";
		parameters[] = {"STRING"};
	};

	class collectionRequest
	{
		module = "banking";
		parameters[] = {"STRING","STRING"};
	};

	class collectMoneyResponse
	{
		module = "banking";
		parameters[] = {"STRING","STRING"};
	};
	class saleRequest
	{
		module = "banking";
		parameters[] = {"STRING","STRING"};
	};
	class buyRequest
	{
		module = "banking";
		parameters[] = {"STRING","STRING"};
	};
	class updateWalletStats
	{
		module = "banking";
		parameters[] = {"STRING"};
	};
	class handleATMMessage
	{
		module = "banking";
		parameters[] = {"STRING","STRING"};
	};
	class youWonTheLottery
	{
		module = "banking";
		parameters[] = {"STRING","STRING"};
	};
	class AdvancedHint
	{
		parameters[] = {"STRING","ARRAY"};
	};
	class Call
	{
		parameters[] = {"CODE"};
	};
};


class CfgExileEnvironment
{
	class Altis 
	{
		class FireFlies
		{
			// 1 = enabled, 0 = disabled
			enable = 0;

			// At this hour fire flies begin to spawn
			startHour = 18;

			// At this hour fire flies stop spawning
			endHour = 4;
		};

		class Anomalies
		{
			// 1 = enabled, 0 = disabled
			enable = 0;

			// At this hour anomalies begin to spawn
			startHour = 19;

			// At this hour anomalies stop spawning
			endHour = 6;
		};

		class Breathing
		{
			// 1 = enabled, 0 = disabled
			enable = 0;
		};

		class Snow
		{
			// 1 = enabled, 0 = disabled
			enable = 0;

			// https://community.bistudio.com/wiki/surfaceType
			surfaces[] = {};
		};

		class Radiation 
		{
			// 1 = enabled, 0 = disabled
			enable = 0;

			/*
				Defines contaminated zones in a specific map. 
				You can define multiple zones per map. The format
				of the zones is:

				[Position ASL(!), Full Radiation Radius, Maximum Radius]

				The radius works as follows:

	            |-------------------------------------------------------|
	                                Maximum Radius
				
				|------------------------|
				  Full Radiation Radius   

				Within the full radiation radius, radiation factor is
				always at a maximum. Outside of this, it lowers down
				to no radiation smoothly.

				Radiation:

	            |------------------------|------------------------------|
	            1        1      1        1     0.75    0.5     0.25    0
			*/
			contaminatedZones[] = {};
		};

		class Temperature
		{
			// Temperature in °C for the time of day, per hour
			// Add the first index to the last index, so it is 25 indizes!
			daytimeTemperature[] = {15.93,16.89,18.42,20.40,22.68,25.10,27.48,29.63,31.40,32.66,33.32,33.80,33.80,33.32,32.66,31.40,29.63,27.48,25.10,22.68,20.40,18.42,16.89,15.93,15.93};
		
			// Temperature change in °C when it is 100% overcast
			overcast = -2;

			// Temperature change in °C when it is 100% raining
			rain = -5;

			// Temperature change in °C when it is 100% windy
			wind = -1;

			// Temperature change per 100m altitude in °C
			altitude = -0.5;

			// Difference from the daytime temperature to the water temperature
			water = -5;
		};
	};

	class Chernarus 
	{
		class FireFlies
		{
			// 1 = enabled, 0 = disabled
			enable = 0;

			// At this hour fire flies begin to spawn
			startHour = 18;

			// At this hour fire flies stop spawning
			endHour = 4;
		};

		class Anomalies
		{
			// 1 = enabled, 0 = disabled
			enable = 0;

			// At this hour anomalies begin to spawn
			startHour = 19;

			// At this hour anomalies stop spawning
			endHour = 6;
		};

		class Breathing
		{
			// 1 = enabled, 0 = disabled
			enable = 0;
		};

		class Snow
		{
			// 1 = enabled, 0 = disabled
			enable = 0;

			// https://community.bistudio.com/wiki/surfaceType
			surfaces[] = {};
		};

		class Radiation 
		{
			// 1 = enabled, 0 = disabled
			enable = 0;

			/*
				Defines contaminated zones in a specific map. 
				You can define multiple zones per map. The format
				of the zones is:

				[Position ASL(!), Full Radiation Radius, Maximum Radius]

				The radius works as follows:

	            |-------------------------------------------------------|
	                                Maximum Radius
				
				|------------------------|
				  Full Radiation Radius   

				Within the full radiation radius, radiation factor is
				always at a maximum. Outside of this, it lowers down
				to no radiation smoothly.

				Radiation:

	            |------------------------|------------------------------|
	            1        1      1        1     0.75    0.5     0.25    0
			*/
			contaminatedZones[] = {};
		};

		class Temperature
		{
			// Temperature in °C for the time of day, per hour
			// Add the first index to the last index, so it is 25 indizes!
			daytimeTemperature[] = {15.93,16.89,18.42,20.40,22.68,25.10,27.48,29.63,31.40,32.66,33.32,33.80,33.80,33.32,32.66,31.40,29.63,27.48,25.10,22.68,20.40,18.42,16.89,15.93,15.93};
		
			// Temperature change in °C when it is 100% overcast
			overcast = -2;

			// Temperature change in °C when it is 100% raining
			rain = -5;

			// Temperature change in °C when it is 100% windy
			wind = -1;

			// Temperature change per 100m altitude in °C
			altitude = -0.5;

			// Difference from the daytime temperature to the water temperature
			water = -5;
		};
	};

	class Panthera3
	{
		class FireFlies
		{
			// 1 = enabled, 0 = disabled
			enable = 1;

			// At this hour fire flies begin to spawn
			startHour = 18;

			// At this hour fire flies stop spawning
			endHour = 4;
		};

		class Anomalies
		{
			// 1 = enabled, 0 = disabled
			enable = 0;

			// At this hour anomalies begin to spawn
			startHour = 19;

			// At this hour anomalies stop spawning
			endHour = 6;
		};

		class Breathing
		{
			// 1 = enabled, 0 = disabled
			enable = 0;
		};

		class Snow
		{
			// 1 = enabled, 0 = disabled
			enable = 0;

			// https://community.bistudio.com/wiki/surfaceType
			surfaces[] = {};
		};

		class Radiation
		{
			// 1 = enabled, 0 = disabled
			enable = 0;

			/*
				Defines contaminated zones in a specific map.
				You can define multiple zones per map. The format
				of the zones is:

				[Position ASL(!), Full Radiation Radius, Maximum Radius]

				The radius works as follows:

	            |-------------------------------------------------------|
	                                Maximum Radius

				|------------------------|
				  Full Radiation Radius

				Within the full radiation radius, radiation factor is
				always at a maximum. Outside of this, it lowers down
				to no radiation smoothly.

				Radiation:

	            |------------------------|------------------------------|
	            1        1      1        1     0.75    0.5     0.25    0
			*/
			contaminatedZones[] = {};
		};

		class Temperature
		{
			// Temperature in °C for the time of day, per hour
			// Add the first index to the last index, so it is 25 indizes!
			daytimeTemperature[] = {15.93,16.89,18.42,20.40,22.68,25.10,27.48,29.63,31.40,32.66,33.32,33.80,33.80,33.32,32.66,31.40,29.63,27.48,25.10,22.68,20.40,18.42,16.89,15.93,15.93};

			// Temperature change in °C when it is 100% overcast
			overcast = -2;

			// Temperature change in °C when it is 100% raining
			rain = -5;

			// Temperature change in °C when it is 100% windy
			wind = -1;

			// Temperature change per 100m altitude in °C
			altitude = -0.5;

			// Difference from the daytime temperature to the water temperature
			water = -5;
		};
	};
};
class CfgExileHUD
{
	class ShortItemNames
	{
		SmokeShell[] 						= {"WHITE", 	"SMOKE"};
		1Rnd_Smoke_Grenade_shell[] 			= {"WHITE", 	"SMOKE"};
		3Rnd_Smoke_Grenade_shell[] 			= {"WHITE", 	"SMOKE"};

		SmokeShellBlue[] 					= {"BLUE", 		"SMOKE"};
		1Rnd_SmokeBlue_Grenade_shell[] 		= {"BLUE", 		"SMOKE"};
		3Rnd_SmokeBlue_Grenade_shell[] 		= {"BLUE", 		"SMOKE"};

		SmokeShellGreen[] 					= {"GREEN", 	"SMOKE"};
		1Rnd_SmokeGreen_Grenade_shell[] 	= {"GREEN", 	"SMOKE"};
		3Rnd_SmokeGreen_Grenade_shell[] 	= {"GREEN", 	"SMOKE"};

		SmokeShellOrange[] 					= {"ORANGE", 	"SMOKE"};
		1Rnd_SmokeOrange_Grenade_shell[]	= {"ORANGE", 	"SMOKE"};
		3Rnd_SmokeOrange_Grenade_shell[] 	= {"ORANGE", 	"SMOKE"};

		SmokeShellPurple[] 					= {"PURPLE", 	"SMOKE"};
		1Rnd_SmokePurple_Grenade_shell[] 	= {"PURPLE", 	"SMOKE"};
		3Rnd_SmokePurple_Grenade_shell[] 	= {"PURPLE", 	"SMOKE"};

		SmokeShellRed[] 					= {"RED", 		"SMOKE"};
		1Rnd_SmokeRed_Grenade_shell[] 		= {"RED", 		"SMOKE"};
		3Rnd_SmokeRed_Grenade_shell[] 		= {"RED", 		"SMOKE"};
				
		SmokeShellYellow[] 					= {"YELLOW", 	"SMOKE"};
		1Rnd_SmokeYellow_Grenade_shell[] 	= {"YELLOW", 	"SMOKE"};
		3Rnd_SmokeYellow_Grenade_shell[] 	= {"YELLOW", 	"SMOKE"};
				
		UGL_FlareCIR_F[] 					= {"IR", 		"FLARE"};
		3Rnd_UGL_FlareCIR_F[] 				= {"IR", 		"FLARE"};

		UGL_FlareGreen_F[] 					= {"GREEN", 	"FLARE"};
		3Rnd_UGL_FlareGreen_F[] 			= {"GREEN", 	"FLARE"};

		UGL_FlareRed_F[] 					= {"RED", 		"FLARE"};
		3Rnd_UGL_FlareRed_F[] 				= {"RED", 		"FLARE"};

		UGL_FlareWhite_F[] 					= {"WHITE", 	"FLARE"};
		3Rnd_UGL_FlareWhite_F[] 			= {"WHITE", 	"FLARE"};

		UGL_FlareYellow_F[] 				= {"YELLOW", 	"FLARE"};
		3Rnd_UGL_FlareYellow_F[] 			= {"YELLOW", 	"FLARE"};

		Chemlight_blue[] 					= {"BLUE", 		"LIGHT"};
		Chemlight_green[] 					= {"GREEN", 	"LIGHT"};
		Chemlight_red[] 					= {"RED", 		"LIGHT"};
		Chemlight_yellow[] 					= {"YELLOW", 	"LIGHT"};

		1Rnd_HE_Grenade_shell[] 			= {"40MM"};
		3Rnd_HE_Grenade_shell[] 			= {"40MM"};

		O_IR_Grenade[] 						= {"IR"};
		I_IR_Grenade[] 						= {"IR"};
		B_IR_Grenade[] 						= {"IR"};

		HandGrenade[] 						= {"RGO"};
		MiniGrenade[] 						= {"RGN"};

		Exile_Item_ZipTie[]					= {"ZIP", "TIE"};
	};
};
class CfgExileLootSettings
{
	/**
	 * Lifetime of loot in minutes. Synchronize this with
	 * the garbage collector settings of your server
	 * CfgSettings!
	 */
	lifeTime = 8;

	/**
	 * Interval in seconds when the client searches for
	 * new buildings to spawn loot in
	 */
	spawnInterval = 60;

	/**
	 * This is a percentage value to determine how many loot
	 * positions should contain loot when the system spawns loot.
	 *
	 * If a building has 20 positions defined, Exile will 
	 * spawn loot in 10 random positions of them.
	 * 
	 * This means smaller buildings spawn less loot and larger
	 * ones spawn more loot.
	 *
	 * You can also cap it at a maximum value. See below.
	 */
	maximumPositionCoverage = 6;

 	/**
 	 * Limit the number of loot positions per building. If the 
 	 * above percentage value exceeds this value, it will be capped.
 	 *
 	 * Example: Coverage is 50%. Building has 60 loot positions defined.
 	 * This results in 30 loot positions and that is too much. So we
 	 * cap this at 10
 	 */
	maximumNumberOfLootSpotsPerBuilding = 3;

	/**
	 * Exile spawns a random number of items per loot spot. This 
	 * is the upper cap for that. So 3 means it could spawn 1, 2 
	 * or 3.
	 */
	maximumNumberOfItemsPerLootSpot = 1;

	/**
	 * Radius in meter to spawn loot AROUND each player.
	 * Do NOT touch this value if you dont know what you do.
	 * The higher the number, the higher the drop rates, the
	 * easier your server will lag.
	 *
	 * 50m  = Minimum
	 * 200m = Maximum
	 */
	spawnRadius = 60;

	/**
	 * Defines the radius around trader cities where the system should
	 * not spawn loot. Set this to 0 if you want to have loot spawning
	 * in trader citites, ugh.
	 */
	minimumDistanceToTraderZones = 500;

	/**
	 * Defines the radius around territories where no loot spawns.
	 * This does not regard the actual size of a territory. So do not
	 * set this to a lower value than the maximum radius of a territory,
	 * which is 150m by default.
	 */
	minimumDistanceToTerritories = 50;
};
class CfgExileMusic
{
	Ambient[] = {"ExileTrack03","ExileTrack04"};
	Combat[] = {"ExileTrack06","ExileTrack07"};
	Intro[] = {"ExileTrack02","ExileTrack03"};
};
class CfgExileParty 
{
	showESP = 1;
	allow3DMarkers = 1;
};
class CfgFlags 
{
	class USA
	{
		name = "USA";
		texture = "\A3\Data_F\Flags\flag_us_co.paa";
		uids[] = {};
	};
	class YTUBE
	{
		name = "YouTube";
		texture = "GG\images\flags\flag_ytube.paa";
		uids[] = {};
	};
	class TWITCH
	{
		name = "Twitch";
		texture = "GG\images\flags\flag_twitch.paa";
		uids[] = {};
	};
	class SMAN
	{
		name = "Superman";
		texture = "GG\images\flags\flag_sman.paa";
		uids[] = {};
	};
	class SEGA
	{
		name = "SEGA";
		texture = "GG\images\flags\flag_sega.paa";
		uids[] = {};
	};
	class RAZOR
	{
		name = "Razor";
		texture = "GG\images\flags\flag_razor.paa";
		uids[] = {};
	};
	class KFC
	{
		name = "KFC";
		texture = "GG\images\flags\flag_kfc.paa";
		uids[] = {};
	};
	class KAPPA
	{
		name = "KAPPA";
		texture = "GG\images\flags\flag_kappa.paa";
		uids[] = {};
	};
	class INTEL
	{
		name = "INTEL";
		texture = "GG\images\flags\flag_intel.paa";
		uids[] = {};
	};
	class GOGL
	{
		name = "Google";
		texture = "GG\images\flags\flag_gogl.paa";
		uids[] = {};
	};
	class DAYZ
	{
		name = "DayZ";
		texture = "GG\images\flags\flag_dayz.paa";
		uids[] = {};
	};
	class MCD
	{
		name = "Mcdonalds";
		texture = "GG\images\flags\flag_bigmac.paa";
		uids[] = {};
	};
};
class ExileAbstractAction
{
	title = "";
	condition = "true";
	action = "";
	priority = 1.5;
	showWindow = false;
};

/**
 * Sort this by probability of occurence to speed things up a bit
 */
class CfgInteractionMenus
{
	class Car 
	{
		targetType = 2;
		target = "Car";

		class Actions 
		{
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && !ExilePlayerInSafezone && ((locked ExileClientInteractionObject) != 1)";
				action = "_this call ExileClient_object_lock_scan";
			};

			// Locks a vehicle
			class Lock: ExileAbstractAction
			{
				title = "Lock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 0) && ((locked ExileClientInteractionObject) != 1)";
				action = "true spawn ExileClient_object_lock_toggle";
			};

			// Unlocks a vehicle
			class Unlock: ExileAbstractAction
			{
				title = "Unlock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};

			// Repairs a vehicle to 100%. Requires Duckttape
			class Repair: ExileAbstractAction
			{
				title = "Repair";
				condition = "true";
				action = "['RepairVehicle', _this select 0] call ExileClient_action_execute";
			};

			// Hot-wires a vehicle
			class Hotwire: ExileAbstractAction
			{
				title = "Hotwire";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "['HotwireVehicle', _this select 0] call ExileClient_action_execute";
			};

			// Flips a vehicle so the player doesnt have to call an admin
			// Check if vector up is fucked
			class Flip: ExileAbstractAction
			{
				title = "Flip";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_flip";
			};

			// Fills fuel from a can into a car
			class Refuel: ExileAbstractAction
			{
				title = "Refuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_refuel";
			};

			// Drains fuel from a car into an empty jerry can
			class DrainFuel: ExileAbstractAction
			{
				title = "Drain Fuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_drain";
			};
		};
	};

	class Air
	{
		target = "Air";
		targetType = 2;

		class Actions
		{
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && ((locked ExileClientInteractionObject) != 1) && !ExilePlayerInSafezone";
				action = "_this call ExileClient_object_lock_scan";
			};

			// Locks a vehicle
			class Lock: ExileAbstractAction
			{
				title = "Lock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 0) && ((locked ExileClientInteractionObject) != 1)";
				action = "true spawn ExileClient_object_lock_toggle";
			};

			// Unlocks a vehicle
			class Unlock: ExileAbstractAction
			{
				title = "Unlock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};

			// Hot-wires a vehicle
			class Hotwire: ExileAbstractAction
			{
				title = "Hotwire";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "['HotwireVehicle', _this select 0] call ExileClient_action_execute";
			};

			// Repairs a vehicle to 100%. Requires Duckttape
			class Repair: ExileAbstractAction
			{
				title = "Repair";
				condition = "true";
				action = "['RepairVehicle', _this select 0] call ExileClient_action_execute";
			};

			// Flips a vehicle so the player doesnt have to call an admin
			// Check if vector up is fucked
			class Flip: ExileAbstractAction
			{
				title = "Flip";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_flip";
			};

			// Fills fuel from a can into a car
			class Refuel: ExileAbstractAction
			{
				title = "Refuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_refuel";
			};

			// Drains fuel from a car into an empty jerry can
			class DrainFuel: ExileAbstractAction
			{
				title = "Drain Fuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_drain";
			};

			class RotateLeft: ExileAbstractAction
			{
				title = "Rotate Left";	
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "[ExileClientInteractionObject,-15] call ExileClient_object_vehicle_rotate";
			};

			class RotateRight: ExileAbstractAction
			{
				title = "Rotate Right";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "[ExileClientInteractionObject,15] call ExileClient_object_vehicle_rotate";
			};
		};
	};

	class Safe
	{
		targetType = 2;
		target = "Exile_Container_Safe";

		class Actions 
		{
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && !((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 1) && !ExilePlayerInSafezone";
				action = "_this call ExileClient_object_lock_scan";
			};

			// Locks a vehicle
			class Lock : ExileAbstractAction
			{
				title = "Lock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "true spawn ExileClient_object_lock_toggle";
			};

			class Unlock : ExileAbstractAction
			{
				title = "Unlock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};

			class Pack : ExileAbstractAction
			{
				title = "Pack";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "_this spawn ExileClient_object_container_pack";
			};

			class SetPinCode : ExileAbstractAction
			{
				title = "Set PIN";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "_this spawn ExileClient_object_lock_setPin";
			};
			class HackSafe : ExileAbstractAction
			{
				title = "Hack Safe";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "_this spawn ExAd_fnc_startHack";
			};
		};
	};
	class ATM
    {
        targetType = 2;
        target = "Land_Atm_01_F";

        class Actions
        {
            class Access: ExileAbstractAction
			{
				title = "Access ATM";
				condition = "true";
				action = "createDialog 'AdvBankingATM';";
			};
        };
    };
	
	class CargoSmall
	{
		targetType = 2;
		target = "Land_CargoBox_V1_F_Kit";
		
		class Actions 
		{
			// Locks a vehicle
			class Lock : ExileAbstractAction
			{
				title = "Lock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "true spawn ExileClient_object_lock_toggle";
			};

			class Unlock : ExileAbstractAction
			{
				title = "Unlock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};

			class SetPinCode : ExileAbstractAction
			{
				title = "Set PIN";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "_this spawn ExileClient_object_lock_setPin";
			};
		};
	};	
	class Cargo20Military
	{
		targetType = 2;
		target = "Land_Cargo20_military_green_F";
		
		class Actions 
		{
			// Locks a vehicle
			class Lock : ExileAbstractAction
			{
				title = "Lock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "true spawn ExileClient_object_lock_toggle";
			};

			class Unlock : ExileAbstractAction
			{
				title = "Unlock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};

			class SetPinCode : ExileAbstractAction
			{
				title = "Set PIN";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "_this spawn ExileClient_object_lock_setPin";
			};
		};
	};
	class Cargo40
	{
		targetType = 2;
		target = "Land_Cargo40_light_green_F";

		class Actions 
		{
			// Locks a vehicle
			class Lock : ExileAbstractAction
			{
				title = "Lock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "true spawn ExileClient_object_lock_toggle";
			};
			
			class Unlock : ExileAbstractAction
			{
				title = "Unlock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};

			class SetPinCode : ExileAbstractAction
			{
				title = "Set PIN";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "_this spawn ExileClient_object_lock_setPin";
			};
		};
	};
	class Cargo20
	{
		targetType = 2;
		target = "Land_Cargo20_sand_F";

		class Actions 
		{
			// Locks a vehicle
			class Lock : ExileAbstractAction
			{
				title = "Lock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "true spawn ExileClient_object_lock_toggle";
			};

			class Unlock : ExileAbstractAction
			{
				title = "Unlock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};

			class SetPinCode : ExileAbstractAction
			{
				title = "Set PIN";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "_this spawn ExileClient_object_lock_setPin";
			};
		};
	};
	
	class Bunker
	{
		targetType = 2;
		target = "Land_Bunker_F";

		class Actions 
		{
			// Locks a vehicle
			class Lock : ExileAbstractAction
			{
				title = "Lock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "true spawn ExileClient_object_lock_toggle";
			};

			class Unlock : ExileAbstractAction
			{
				title = "Unlock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};

			class SetPinCode : ExileAbstractAction
			{
				title = "Set PIN";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "_this spawn ExileClient_object_lock_setPin";
			};
		};
	};
	class Laptop
	{
		targetType = 2;
		target = "Exile_Construction_Laptop_Static";

		class Actions
		{
			class CameraSystem: ExileAbstractAction
			{
				title = "CCTV Access";
				condition = "((ExileClientInteractionObject animationPhase 'LaptopLidRotation') >= 0.5)";
				action = "_this call ExileClient_gui_baseCamera_show";
			};
			class Access: ExileAbstractAction
			{
				title = "Online Banking";
				condition = "((ExileClientInteractionObject animationPhase 'LaptopLidRotation') >= 0.5)";
				action = "createDialog 'AdvBankingATM';";
			};
			class VG : ExileAbstractAction
			{
				title = "Virtual Garage";
				condition = "(((ExileClientInteractionObject animationPhase 'LaptopLidRotation') >= 0.5) && ((([_object, getPlayerUID player] call ExileClient_util_territory_getAccessLevel) select 0) >= ExAd_VG_ACCESS_LEVEL))";
				action = "[] spawn {[] call ExileClient_gui_xm8_show; UISleep 1; call XM8_VG_checkNearByFlags}";
			};
			class StopHack: ExileAbstractAction
			{
				title = "Interupt Hack";
				condition = "(ExileClientInteractionObject getVariable ['ExAd_HACKING_IN_PROGRESS', false])";
				action = "_this spawn ExAd_fnc_stopHack";
			};
		};
	};


	class SupplyBox
	{
		targetType = 2;
		target = "Exile_Container_SupplyBox";

		class Actions
		{
			class Mount: ExileAbstractAction
			{
				title = "Mount";
				condition = "(isNull (attachedTo ExileClientInteractionObject)) && ((ExileClientInteractionObject getvariable ['ExileOwnerUID',1]) isEqualTo 1)";
				action = "_this call ExileClient_object_supplyBox_mount";
			};

			class Install: ExileAbstractAction
			{
				title = "Install";
				condition = "isNull (attachedTo ExileClientInteractionObject) && ((ExileClientInteractionObject getvariable ['ExileOwnerUID',1]) isEqualTo 1)";
				action = "_this call ExileClient_object_supplyBox_install";
			};

			class Unmount: ExileAbstractAction
			{
				title = "Unmount";
				condition = "!(isNull (attachedTo ExileClientInteractionObject)) && ((ExileClientInteractionObject getvariable ['ExileOwnerUID',1]) isEqualTo 1)";
				action = "_this call ExileClient_object_supplyBox_unmount";
			};
		};
	};

	class Construction
	{
		targetType = 2;
		target = "Exile_Construction_Abstract_Static";

		class Actions 
		{
			class ScanLock: ExileAbstractAction
			{
				title = "Scan Lock";
				condition = "('Exile_Item_ThermalScannerPro' in (magazines player)) && !((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 1)";
				action = "_this call ExileClient_object_lock_scan";
			};

			class Unlock : ExileAbstractAction
			{
				title = "Unlock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo -1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};

			class Lock : ExileAbstractAction
			{
				title = "Lock";
				condition = "((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "true spawn ExileClient_object_lock_toggle";
			};

			// Picks up the construction so you can move it
			class Move: ExileAbstractAction
			{
				title = "Move";
				condition = "true";
				action = "_this spawn ExileClient_object_construction_move";
			};

			// Removes the construction. Does not refund anything YET!
			class Deconstruct: ExileAbstractAction
			{
				title = "Remove";
				condition = "true";
				action = "_this spawn ExileClient_object_construction_deconstruct";
			};

			class AddALock : ExileAbstractAction
			{
				title = "Add a Lock";
				condition = "call ExileClient_object_construction_lockAddShow";
				action = "_this spawn ExileClient_object_construction_lockAdd";
			};

			class Upgrade : ExileAbstractAction
			{
				title = "Upgrade";
				condition = "call ExileClient_object_construction_upgradeShow";
				action = "_this call ExileClient_object_construction_upgrade";
			};

		};
	};

	/*
		Tent, Storage crate etc.
	*/
	class Container
	{
		targetType = 2;
		target = "Exile_Container_Abstract";

		class Actions 
		{
			class Pack 
			{
				title = "Pack";
				condition = "!((typeOf ExileClientInteractionObject) isEqualTo 'Exile_Container_SupplyBox')";
				action = "_this spawn ExileClient_object_container_pack";
			};
			// Picks up the container so you can move it
			class Move: ExileAbstractAction
			{
				title = "Move";
				condition = "(getNumber(configFile >> 'CfgVehicles' >> typeOf ExileClientInteractionObject >> 'exileIsLockable') isEqualTo 0) || ((ExileClientInteractionObject getvariable ['ExileIsLocked',1]) isEqualTo 0)";
				action = "_this spawn ExileClient_object_construction_move";
			};
		};
	};

	class Flag
	{
		targetType = 2;
		target = "Exile_Construction_Flag_Static";

		class Actions
		{
			/*
			class Manage : ExileAbstractAction
			{
				title = "Manage";
				condition = "true";
				action = "_this call ExileClient_gui_baseManagement_event_show";
			};
			*/
			class Upgrade: ExileAbstractAction
			{
				title = "Upgrade";
				condition = "true";
				action = "_this call ExileClient_gui_upgradeterritoryDialog_request";
			};
			class HackVG : ExileAbstractAction
			{
				title = "Hack Virtual Garage";
				condition = "((([ExileClientInteractionObject, getPlayerUID player] call ExileClient_util_territory_getAccessLevel) select 0) < ExAd_VG_ACCESS_LEVEL)";
				action = "_this spawn ExAd_fnc_startHack";
			};
		};
	};

	class Boat 
	{
		targetType = 2;
		target = "Ship";

		class Actions
		{
			// Locks a vehicle
			class Lock: ExileAbstractAction
			{
				title = "Lock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 0) && ((locked ExileClientInteractionObject) != 1)";
				action = "true spawn ExileClient_object_lock_toggle";
			};

			// Unlocks a vehicle
			class Unlock: ExileAbstractAction
			{
				title = "Unlock";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "false spawn ExileClient_object_lock_toggle";
			};

			// Hot-wires a vehicle
			class Hotwire: ExileAbstractAction
			{
				title = "Hotwire";
				condition = "((locked ExileClientInteractionObject) isEqualTo 2) && ((locked ExileClientInteractionObject) != 1)";
				action = "['HotwireVehicle', _this select 0] call ExileClient_action_execute";
			};

			// Repairs a vehicle to 100%. Requires Duckttape
			class Repair: ExileAbstractAction
			{
				title = "Repair";
				condition = "true";
				action = "['RepairVehicle', _this select 0] call ExileClient_action_execute";
			};

			// Fills fuel from a can into a car
			class Refuel: ExileAbstractAction
			{
				title = "Refuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_refuel";
			};

			// Drains fuel from a car into an empty jerry can
			class DrainFuel: ExileAbstractAction
			{
				title = "Drain Fuel";
				condition = "call ExileClient_object_vehicle_interaction_show";
				action = "_this call ExileClient_object_vehicle_drain";
			};

			// Pushes a boat into look direction to move into water
			class Push: ExileAbstractAction
			{
				title = "Push!";
				condition = "((crew ExileClientInteractionObject) isEqualTo [])";
				action = "_this call ExileClient_object_vehicle_push";
			};
		};
	};

	class Bikes
	{
		targetType = 2;
		target = "Bicycle";

		class Actions
		{
			class Flip: ExileAbstractAction
			{
				title = "Flip";
				condition = "true";
				action = "_this call ExileClient_object_vehicle_flip";
			};
			class Pack: ExileAbstractAction
			{
				title = "Pack Bike";
				condition = "true";
				action = "deleteVehicle ExileClientInteractionObject;player linkItem 'ItemRadio';['Success',['Bike packed! Radio added!']] call ExileClient_gui_notification_event_addNotification;";
			};
		};
	};

	class Player 
	{
		targetType = 2;
		target = "Exile_Unit_Player";

		class Actions 
		{
			class Free: ExileAbstractAction
			{
				title = "Free";
				condition = "(alive ExileClientInteractionObject) && (ExileClientInteractionObject getVariable ['ExileIsHandcuffed', false]) && !ExileClientIsHandcuffed";
				action = "_this call ExileClient_object_handcuffs_free";
			};
			
			class Search: ExileAbstractAction
			{
				title = "Search Gear";
				condition = "(alive ExileClientInteractionObject) && (ExileClientInteractionObject getVariable ['ExileIsHandcuffed', false]) && !ExileClientIsHandcuffed";
				action = "_this call ExileClient_object_handcuffs_searchGear";
			};
			class Examine: ExileAbstractAction
           {
               title = "Examine Body";
               condition = "!(alive ExileClientInteractionObject) && ((ExileClientInteractionObject getVariable ['ExileName','']) != '')";
               action = "[(ExileClientInteractionObject getVariable ['ExileName','']),(ExileClientInteractionObject getVariable ['DroppedAmount',0])] call ExileClient_banking_player_examineMoney";
           };
	        class Collect: ExileAbstractAction
           {
               title = "Collect Pop Tabs";
               condition = "!(alive ExileClientInteractionObject) && ((ExileClientInteractionObject getVariable ['DroppedAmount',0]) > 0)";
               action = "[ExileClientInteractionObject,(ExileClientInteractionObject getVariable ['DroppedAmount',0])] call ExileClient_banking_player_collectMoney";
           };
		};
	};
};
/**
 * Classname is used for reference
 * name is displayed in crafting requirements
 * models is used for crafting and interaction menus
 */
class CfgInteractionModels
{
	class WaterSource
	{
		name = "Water tanks, barrels, coolers or pumps";
		models[] = 	
		{
			"barrelwater_f", 
			"barrelwater_grey_f",
			"waterbarrel_f",
			"watertank_f",
			"stallwater_f",
			"waterpump_01_f",
			"water_source_f",
			"misc_well.p3d",
			"watertank_f.p3d",
			"pumpa.p3d",
			"Land_Water_source_F",
			"Land_WaterTank_F",
			"Land_BarrelEmpty_F",
			"Land_BarrelWater_F",
			"Land_BarrelWater_grey_F",
			"Land_WaterBarrel_F",
			"Land_WaterCooler_01_new_F",
			"Land_WaterCooler_01_old_F",
			"Land_pumpa",
			"kasna_new.p3d",
			// Namalsk
			"wellpump",
			"Land_jhad_stand_water",
			"Land_Jbad_Misc_Well_L",
			"Land_jbad_Fridge",
			"Land_jbad_reservoir",
			"Land_jbad_teapot",
			"Land_KBud"
		};
	};

	class CleanWaterSource
	{
		name = "Water cooler";
		models[] = 	
		{
			"watercooler"
		};
	};

	class WorkBench
	{
		name = "Work Bench";
		models[] = 
		{
			"workstand_f.p3d"
		};
	};

	class WoodSource
	{
		name = "Trees";
		models[] = 
		{
			" t_",
			" bo_t_",

			// A2 trees
            " str_",
            " Smrk_",
            " les_",
            " brg_",
            "jablon"		
		};
	};

	class BushSource
	{
		name = "Bushes";
		models[] = {" b_"};
	};

	class StoneSource
	{
		name = "Stones, stone walls or rocks";
		models[] = 
		{
			// We are using find() so this should match everything that is out of stone/rock
			"stone",
			"Stone",
			"Rock",
			"rock",
			"cobble",
			"Cobble",
			"sea_wall_f.p3d"
		};
	};

	// TODO: Add https://community.bistudio.com/wikidata/images/thumb/6/60/Arma3_CfgVehicles_Land_Tank_rust_F.jpg/150px-Arma3_CfgVehicles_Land_Tank_rust_F.jpg
	class FuelSource
	{
		name = "Fuel pumps, stations or barrels";
		models[] = 
		{
			"fuelstation_feed_f.p3d",
			"metalbarrel_f.p3d",
			"flexibletank_01_f.p3d",
			"fs_feed_f.p3d",
			"fuel_tank_big.p3d",
			"fuel_tank_small.p3d",
			"fuel_tank_stairs.p3d",
			"a_fuelstation_feed.p3d",
			"ind_tanksmall.p3d",
			"ind_tanksmall2.p3d",
			"benzina_schenell.p3d",
			"fuelstation_army.p3d",
			"fuelstation.p3d",
			"Tank_rust_F"
		};	
	};

	class Wrecks
	{
		name = "Wrecks";
		models[] = 
		{
			"wreck_"
/*			
			"wreck_bmp2_f.p3d",
			"wreck_brdm2_f.p3d",
			"wreck_car2_f.p3d",
			"wreck_car3_f.p3d",
			"wreck_car_f.p3d",
			"wreck_cardismantled_f.p3d",
			"wreck_hmmwv_f.p3d",
			"wreck_hunter_f.p3d",
			"wreck_offroad2_f.p3d",
			"wreck_offroad_f.p3d",
			"wreck_skodovka_f.p3d",
			"wreck_slammer_f.p3d",
			"wreck_slammer_hull_f.p3d",
			"wreck_slammer_turret_f.p3d",
			"wreck_t72_hull_f.p3d",
			"wreck_t72_turret_f.p3d",
			"wreck_truck_dropside_f.p3d",
			"wreck_truck_f.p3d",
			"wreck_uaz_f.p3d",
			"wreck_ural_f.p3d"
			"wreck_van_f.p3d",
			*/
		};
	};

	class Trash
	{
		name = "Trash";
		models[] = 
		{
			"trash",
			"garbage",
			"crabcages_f.p3d",
			"fishinggear",
			"junkpile_f.p3d",
			"wheeliebin_01_f.p3d"
/*
			"barreltrash_f.p3d",
			"barreltrash_grey_f.p3d",
			"crabcages_f.p3d",
			"fishinggear_01_f.p3d",
			"fishinggear_02_f.p3d",
			"garbage_square3_f.p3d",
			"garbage_square5_f.p3d",
			"garbagebags_f.p3d",
			"garbagebarrel_01_f.p3d",
			"garbagecontainer_closed_f.p3d",
			"garbagecontainer_open_f.p3d",
			"garbagepallet_f.p3d",
			"garbagewashingmachine_f.p3d",
			"junkpile_f.p3d",
			"wheeliebin_01_f.p3d"
*/
		};
	};
};
class CfgPlayer 
{
	// In minutes ammount of time it takes to go from 100 - 0 if stationary
	hungerDecay = 90;
	thirstDecay = 60;

	// Damage taken from 0 (health||thirst)/sec
	healthDecay = 5.0;

	// Health regen if over BOTH
	thirstRegen = 80;
	hungerRegen = 80;

	// IF above meet recover HP%/MIN
	recoveryPerMinute = 5;

	// Set custom aim precision coefficient for weapon sway
	// https://community.bistudio.com/wiki/Arma_3_Stamina
	// Set to -1 if you want to use Arma 3 default value
	// setCustomAimCoef
	customAimCoefficient = 0.15;

	// 0 or 1
	enableFatigue = 0;
	enableStamina = 0;
};
class CfgTerritories
{
	// Base Cost / Radius
	// Level 1 is allways for Pop Tabs, >= 2 for Respect
	prices[] = 
	{
		// Purchase Price 		Radius 		Number of Objects
		{5000,					10,			30 					}, // Level 1
		{10000,					15,			60 					}, // Level 2 
		{15000,					20,			90 					}, // Level 3
		{20000,					25,			120					}, // Level 4
		{25000,					30,			150					}, // Level 5
		{30000,					40,			180					}, // Level 6
		{35000,					50,		    210					}, // Level 7
		{50000,					60,		    240					}, // Level 8
		{75000,					70,		    270					}, // Level 9
		{90000,			  		80,		    300					}  // Level 10
	};

	// A shortcut of the above maximum radius
	maximumRadius = 80;

	// The above * 2 plus coverving the 20m you can move while placing things
	minimumDistanceToOtherTerritories = 200; 

	// Maximum number of territories a player can own
	maximumNumberOfTerritoriesPerPlayer = 2;

	/**
	 * Defines the minimum distance to safe zones / trader cities where players
	 * cannot build territories
	 */
	minimumDistanceToTraderZones = 500;

	/**
	 * Defines the minimum distance to spawn zones where players
	 * cannot build territories
	 */
	minimumDistanceToSpawnZones = 1000;

	// Amount of pop tabs or respect per object to pay
	popTabAmountPerObject = 50;
	respectAmountPerObject = 10;
};
class CfgTraderCategories 
{
	#include "cfg\RHS\TraderCategoriesRHS.hpp"
	#include "cfg\CUP\TraderCategoriesCUP.hpp"
	#include "cfg\TRYK\TraderCategoriesTRYK.hpp"
	
	class Community
	{
		name = "Community Items";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Community2
	{
		name = "Community Items 2";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Community3
	{
		name = "Community Items 3";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Community4
	{
		name = "Community Items 4";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Community5
	{
		name = "Community Items 5";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Community6
	{
		name = "Community Items 6";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Community7
	{
		name = "Community Items 7";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Community8
	{
		name = "Community Items 8";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Community9
	{
		name = "Community Items 9";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Community10
	{
		name = "Community Items 10";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			// Add your items here <3
		};
	};

	class Uniforms
	{
		name = "Uniforms";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\uniform_ca.paa";
		items[] = 
		{
			"U_C_Journalist",
			"U_C_Poloshirt_blue",
			"U_C_Poloshirt_burgundy",
			"U_C_Poloshirt_salmon",
			"U_C_Poloshirt_stripped",
			"U_C_Poloshirt_tricolour",
			"U_C_Poor_1",
			"U_C_Poor_2",
			"U_C_Poor_shorts_1",
			"U_C_Scientist",
			"U_OrestesBody",
			"U_Rangemaster",
			"U_NikosAgedBody",
			"U_NikosBody",
			"U_Competitor",
			"U_B_CombatUniform_mcam",
			"U_B_CombatUniform_mcam_tshirt",
			"U_B_CombatUniform_mcam_vest",
			"U_B_CombatUniform_mcam_worn",
			"U_B_CTRG_1",
			"U_B_CTRG_2",
			"U_B_CTRG_3",
			"U_I_CombatUniform",
			"U_I_CombatUniform_shortsleeve",
			"U_I_CombatUniform_tshirt",
			"U_I_OfficerUniform",
			"U_O_CombatUniform_ocamo",
			"U_O_CombatUniform_oucamo",
			"U_O_OfficerUniform_ocamo",
			"U_B_SpecopsUniform_sgg",
			"U_O_SpecopsUniform_blk",
			"U_O_SpecopsUniform_ocamo",
			"U_I_G_Story_Protagonist_F",
			"Exile_Uniform_Woodland",
			"U_C_HunterBody_grn",
			"U_IG_Guerilla1_1",
			"U_IG_Guerilla2_1",
			"U_IG_Guerilla2_2",
			"U_IG_Guerilla2_3",
			"U_IG_Guerilla3_1",
			"U_BG_Guerilla2_1",
			"U_IG_Guerilla3_2",
			"U_BG_Guerrilla_6_1",
			"U_BG_Guerilla1_1",
			"U_BG_Guerilla2_2",
			"U_BG_Guerilla2_3",
			"U_BG_Guerilla3_1",
			"U_BG_leader",
			"U_IG_leader",
			"U_I_G_resistanceLeader_F",
			"U_B_FullGhillie_ard",
			"U_B_FullGhillie_lsh",
			"U_B_FullGhillie_sard",
			"U_B_GhillieSuit",
			"U_I_FullGhillie_ard",
			"U_I_FullGhillie_lsh",
			"U_I_FullGhillie_sard",
			"U_I_GhillieSuit",
			"U_O_FullGhillie_ard",
			"U_O_FullGhillie_lsh",
			"U_O_FullGhillie_sard",
			"U_O_GhillieSuit",
			"U_I_Wetsuit",
			"U_O_Wetsuit",
			"U_B_Wetsuit",
			"U_B_survival_uniform",
			"U_B_HeliPilotCoveralls",
			"U_I_HeliPilotCoveralls",
			"U_B_PilotCoveralls",
			"U_I_pilotCoveralls",
			"U_O_PilotCoveralls",
			"U_C_Driver_1",
			"U_C_Driver_2",
			"U_C_Driver_3",
			"U_C_Driver_4",
			"U_C_Driver_1_black",
			"U_C_Driver_1_blue",
			"U_C_Driver_1_green",
			"U_C_Driver_1_red",
			"U_C_Driver_1_white",
			"U_C_Driver_1_yellow",
			"U_C_Driver_1_orange"
		};
	};

	class Vests
	{
		name = "Vests";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\vest_ca.paa";
		items[] = 
		{
			"V_Press_F",
			"V_Rangemaster_belt",
			"V_TacVest_blk",
			"V_TacVest_blk_POLICE",
			"V_TacVest_brn",
			"V_TacVest_camo",
			"V_TacVest_khk",
			"V_TacVest_oli",
			"V_TacVestCamo_khk",
			"V_TacVestIR_blk",
			"V_I_G_resistanceLeader_F",
			"V_BandollierB_blk",
			"V_BandollierB_cbr",
			"V_BandollierB_khk",
			"V_BandollierB_oli",
			"V_BandollierB_rgr",
			"V_Chestrig_blk",
			"V_Chestrig_khk",
			"V_Chestrig_oli",
			"V_Chestrig_rgr",
			"V_HarnessO_brn",
			"V_HarnessO_gry",
			"V_HarnessOGL_brn",
			"V_HarnessOGL_gry",
			"V_HarnessOSpec_brn",
			"V_HarnessOSpec_gry",
			"V_PlateCarrier1_blk",
			"V_PlateCarrier1_rgr",
			"V_PlateCarrier2_rgr",
			"V_PlateCarrier3_rgr",
			"V_PlateCarrierGL_blk",
			"V_PlateCarrierGL_mtp",
			"V_PlateCarrierGL_rgr",
			"V_PlateCarrierH_CTRG",
			"V_PlateCarrierIA1_dgtl",
			"V_PlateCarrierIA2_dgtl",
			"V_PlateCarrierIAGL_dgtl",
			"V_PlateCarrierIAGL_oli",
			"V_PlateCarrierL_CTRG",
			"V_PlateCarrierSpec_blk",
			"V_PlateCarrierSpec_mtp",
			"V_PlateCarrierSpec_rgr"
		};
	};

	class Headgear 
	{
		name = "Headgear";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\headgear_ca.paa";
		items[] =
		{
			"H_Cap_blk",
			"H_Cap_blk_Raven",
			"H_Cap_blu",
			"H_Cap_brn_SPECOPS",
			"H_Cap_grn",
			"H_Cap_headphones",
			"H_Cap_khaki_specops_UK",
			"H_Cap_oli",
			"H_Cap_press",
			"H_Cap_red",
			"H_Cap_tan",
			"H_Cap_tan_specops_US",
			"H_Watchcap_blk",
			"H_Watchcap_camo",
			"H_Watchcap_khk",
			"H_Watchcap_sgg",
			"H_MilCap_blue",
			"H_MilCap_dgtl",
			"H_MilCap_mcamo",
			"H_MilCap_ocamo",
			"H_MilCap_oucamo",
			"H_MilCap_rucamo",
			"H_Bandanna_camo",
			"H_Bandanna_cbr",
			"H_Bandanna_gry",
			"H_Bandanna_khk",
			"H_Bandanna_khk_hs",
			"H_Bandanna_mcamo",
			"H_Bandanna_sgg",
			"H_Bandanna_surfer",
			"H_Booniehat_dgtl",
			"H_Booniehat_dirty",
			"H_Booniehat_grn",
			"H_Booniehat_indp",
			"H_Booniehat_khk",
			"H_Booniehat_khk_hs",
			"H_Booniehat_mcamo",
			"H_Booniehat_tan",
			"H_Hat_blue",
			"H_Hat_brown",
			"H_Hat_camo",
			"H_Hat_checker",
			"H_Hat_grey",
			"H_Hat_tan",
			"H_StrawHat",
			"H_StrawHat_dark",
			"H_Beret_02",
			"H_Beret_blk",
			"H_Beret_blk_POLICE",
			"H_Beret_brn_SF",
			"H_Beret_Colonel",
			"H_Beret_grn",
			"H_Beret_grn_SF",
			"H_Beret_ocamo",
			"H_Beret_red",
			"H_Shemag_khk",
			"H_Shemag_olive",
			"H_Shemag_olive_hs",
			"H_Shemag_tan",
			"H_ShemagOpen_khk",
			"H_ShemagOpen_tan",
			"H_TurbanO_blk",
			"H_HelmetB",
			"H_HelmetB_black",
			"H_HelmetB_camo",
			"H_HelmetB_desert",
			"H_HelmetB_grass",
			"H_HelmetB_light",
			"H_HelmetB_light_black",
			"H_HelmetB_light_desert",
			"H_HelmetB_light_grass",
			"H_HelmetB_light_sand",
			"H_HelmetB_light_snakeskin",
			"H_HelmetB_paint",
			"H_HelmetB_plain_blk",
			"H_HelmetB_sand",
			"H_HelmetB_snakeskin",
			"H_HelmetCrew_B",
			"H_HelmetCrew_I",
			"H_HelmetCrew_O",
			"H_HelmetIA",
			"H_HelmetIA_camo",
			"H_HelmetIA_net",
			"H_HelmetLeaderO_ocamo",
			"H_HelmetLeaderO_oucamo",
			"H_HelmetO_ocamo",
			"H_HelmetO_oucamo",
			"H_HelmetSpecB",
			"H_HelmetSpecB_blk",
			"H_HelmetSpecB_paint1",
			"H_HelmetSpecB_paint2",
			"H_HelmetSpecO_blk",
			"H_HelmetSpecO_ocamo",
			"H_CrewHelmetHeli_B",
			"H_CrewHelmetHeli_I",
			"H_CrewHelmetHeli_O",
			"H_HelmetCrew_I",
			"H_HelmetCrew_B",
			"H_HelmetCrew_O",
			"H_PilotHelmetHeli_B",
			"H_PilotHelmetHeli_I",
			"H_PilotHelmetHeli_O",
			"Exile_Headgear_SantaHat",
			"H_RacingHelmet_1_F",
			"H_RacingHelmet_2_F",
			"H_RacingHelmet_3_F",
			"H_RacingHelmet_4_F",
			"H_RacingHelmet_1_black_F",
			"H_RacingHelmet_1_blue_F",
			"H_RacingHelmet_1_green_F",
			"H_RacingHelmet_1_red_F",
			"H_RacingHelmet_1_white_F",
			"H_RacingHelmet_1_yellow_F",
			"H_RacingHelmet_1_orange_F"
		};
	};


	class PointerAttachments 
	{
		name = "Pointer Attachments";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"acc_flashlight",
			"acc_pointer_IR"
		};
	};

	class BipodAttachments 
	{
		name = "Bipod Attachments";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itembipod_ca.paa";
		items[] = 
		{
			"bipod_01_F_blk",
			"bipod_01_F_mtp",
			"bipod_01_F_snd",
			"bipod_02_F_blk",
			"bipod_02_F_hex",
			"bipod_02_F_tan",
			"bipod_03_F_blk",
			"bipod_03_F_oli"
		};
	};

	class MuzzleAttachments 
	{
		name = "Suppressor Attachments";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemmuzzle_ca.paa";
		items[] = 
		{
			"muzzle_snds_338_black",
			"muzzle_snds_338_green",
			"muzzle_snds_338_sand",
			"muzzle_snds_93mmg",
			"muzzle_snds_93mmg_tan",
			"muzzle_snds_acp",
			"muzzle_snds_B",
			"muzzle_snds_H",
			"muzzle_snds_H_MG",
			"muzzle_snds_H_SW",
			"muzzle_snds_L",
			"muzzle_snds_M"
		};
	};

	class StaticMGs
	{
		name = "Static Machine Guns";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"O_HMG_01_weapon_F",
			"O_HMG_01_support_F",
			"O_HMG_01_high_weapon_F",
			"O_HMG_01_support_high_F"
		};
	};

	class OpticAttachments 
	{
		name = "Scopes";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemoptic_ca.paa";
		items[] = 
		{
			"optic_Aco",
			"optic_ACO_grn",
			"optic_ACO_grn_smg",
			"optic_Aco_smg",
			"optic_AMS",
			"optic_AMS_khk",
			"optic_AMS_snd",
			"optic_Arco",
			"optic_DMS",
			"optic_Hamr",
			"optic_Holosight",
			"optic_Holosight_smg",
			"optic_KHS_blk",
			"optic_KHS_hex",
			"optic_KHS_old",
			"optic_KHS_tan",
			"optic_LRPS",
			"optic_MRCO",
			"optic_MRD",
			"optic_SOS",
			"optic_Yorris"
		};
	};

	class Hardware 
	{
		name = "Hardware";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Item_Rope",
			"Exile_Item_DuctTape",
			"Exile_Magazine_Battery",
			"Exile_Item_ExtensionCord",
			"Exile_Item_FuelCanisterEmpty",
			"Exile_Item_JunkMetal",
			"Exile_Item_LightBulb",
			"Exile_Item_MetalBoard",
			"Exile_Item_FloodLightKit",
			"Exile_Item_PortableGeneratorKit",
			"Exile_Item_MetalPole",
			"Exile_Item_SafeKit",
			"Exile_Item_CamoTentKit",
			"Exile_Item_CodeLock",
			"Exile_Item_Laptop",
			"Exile_Item_BaseCameraKit",
			"Exile_Item_CordlessScrewdriver",
			"Exile_Item_Hammer",
			"Exile_Item_OilCanister",
			"Exile_Item_Screwdriver",
			"Exile_Item_Shovel",
			"Exile_Item_Wrench",
			"Exile_Item_ZipTie",
			"Exile_Item_Cement",
			"Exile_Item_Sand",
			"Exile_Item_MetalScrews"
		};
	};

	class Food 
	{
		name = "Fast Food";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Item_EMRE",		
			"Exile_Item_GloriousKnakworst",
			"Exile_Item_Surstromming",
			"Exile_Item_SausageGravy",
			"Exile_Item_Catfood",
			"Exile_Item_ChristmasTinner",
			"Exile_Item_BBQSandwich",
			"Exile_Item_Dogfood",
			"Exile_Item_BeefParts",
			"Exile_Item_Cheathas",
			"Exile_Item_Noodles",
			"Exile_Item_SeedAstics",
			"Exile_Item_Raisins",
			"Exile_Item_Moobar",
			"Exile_Item_InstantCoffee",
			"Exile_Item_CockONut",
			"Exile_Item_DsNuts"
		};
	};

	class Drinks 
	{
		name = "Drinks";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] =
		{
			"Exile_Item_PlasticBottleCoffee",
			"Exile_Item_PowerDrink",
			"Exile_Item_PlasticBottleFreshWater",
			"Exile_Item_Beer",
			"Exile_Item_EnergyDrink",
			"Exile_Item_MountainDupe",
			"Exile_Item_PlasticBottleEmpty"
		};
	};

	class Tools
	{
		name = "Tools";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Item_Matches",
			"Exile_Item_CookingPot",
			"Exile_Item_CanOpener",
			"Exile_Item_Handsaw",
			"Exile_Item_Pliers",
			"Exile_Item_Grinder",
			"Binocular",
			"Rangefinder",
			"NVGoggles",
			"NVGoggles_INDEP",
			"NVGoggles_OPFOR",
			"ItemGPS",
			"ItemMap",
			"ItemCompass",
			"ItemRadio",
			"ItemWatch",
			"Exile_Item_XM8"
		};
	};

	class FirstAid
	{
		name = "FirstAid";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Item_InstaDoc",
			"Exile_Item_Bandage",
			"Exile_Item_Vishpirin",
			"Exile_Item_Heatpack"
		};
	};
	class Navigation
	{
		name = "Special Environment";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"B_Parachute",
			"V_RebreatherB",
			"V_RebreatherIA",
			"V_RebreatherIR",
			"Exile_Headgear_GasMask"	
		};
	};

	class Backpacks
	{
		name = "Backpacks";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\backpack_ca.paa";
		items[] = 
		{
			"B_AssaultPack_blk",
			"B_AssaultPack_cbr",
			"B_AssaultPack_dgtl",
			"B_AssaultPack_khk",
			"B_AssaultPack_mcamo",
			"B_AssaultPack_rgr",
			"B_AssaultPack_sgg",
			"B_Bergen_blk",
			"B_Bergen_mcamo",
			"B_Bergen_rgr",
			"B_Bergen_sgg",
			"B_Carryall_cbr",
			"B_Carryall_khk",
			"B_Carryall_mcamo",
			"B_Carryall_ocamo",
			"B_Carryall_oli",
			"B_Carryall_oucamo",
			"B_FieldPack_blk",
			"B_FieldPack_cbr",
			"B_FieldPack_ocamo",
			"B_FieldPack_oucamo",
			"B_HuntingBackpack",
			"B_Kitbag_cbr",
			"B_Kitbag_mcamo",
			"B_Kitbag_sgg",
			"B_OutdoorPack_blk",
			"B_OutdoorPack_blu",
			"B_OutdoorPack_tan",
			"B_TacticalPack_blk",
			"B_TacticalPack_mcamo",
			"B_TacticalPack_ocamo",
			"B_TacticalPack_oli",
			"B_TacticalPack_rgr"
		};
	};

	class Ammunition
	{
		name = "Ammunition";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"100Rnd_65x39_caseless_mag",
			"100Rnd_65x39_caseless_mag_Tracer",
			"10Rnd_127x54_Mag",
			"10Rnd_338_Mag",
			"10Rnd_762x54_Mag",
			"10Rnd_93x64_DMR_05_Mag",
			"11Rnd_45ACP_Mag",
			"130Rnd_338_Mag",
			"150Rnd_762x54_Box",
			"150Rnd_762x54_Box_Tracer",
			"150Rnd_93x64_Mag",
			"16Rnd_9x21_Mag",
			"200Rnd_65x39_cased_Box",
			"200Rnd_65x39_cased_Box_Tracer",
			"20Rnd_556x45_UW_mag",
			"20Rnd_762x51_Mag",
			"30Rnd_45ACP_Mag_SMG_01",
			"30Rnd_45ACP_Mag_SMG_01_tracer_green",
			"30Rnd_45ACP_Mag_SMG_01_Tracer_Red",
			"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow",
			"30Rnd_556x45_Stanag",
			"30Rnd_556x45_Stanag_Tracer_Green",
			"30Rnd_556x45_Stanag_Tracer_Red",
			"30Rnd_556x45_Stanag_Tracer_Yellow",
			"30Rnd_65x39_caseless_green",
			"30Rnd_65x39_caseless_green_mag_Tracer",
			"30Rnd_65x39_caseless_mag",
			"30Rnd_65x39_caseless_mag_Tracer",
			"30Rnd_9x21_Mag",
			"5Rnd_127x108_APDS_Mag",
			"5Rnd_127x108_Mag",
			"6Rnd_45ACP_Cylinder",
			"6Rnd_GreenSignal_F",
			"6Rnd_RedSignal_F",
			"7Rnd_408_Mag",
			"9Rnd_45ACP_Mag"
		};
	};

	class Flares 
	{
		name = "Flares";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Chemlight_blue",
			"Chemlight_green",
			"Chemlight_red",
			"FlareGreen_F",
			"FlareRed_F",
			"FlareWhite_F",
			"FlareYellow_F",
			"UGL_FlareGreen_F",
			"UGL_FlareRed_F",
			"UGL_FlareWhite_F",
			"UGL_FlareYellow_F",
			"3Rnd_UGL_FlareGreen_F",
			"3Rnd_UGL_FlareRed_F",
			"3Rnd_UGL_FlareWhite_F",
			"3Rnd_UGL_FlareYellow_F",
			"CUP_FlareGreen_M203",
			"CUP_FlareRed_GP25_M",
			"CUP_FlareWhite_GP25_M",
			"CUP_FlareWhite_M203",
			"rhs_VG40MD_Green",
			"rhs_VG40MD_Red",
			"rhs_VG40MD_White",
			"rhs_VG40OP_green",
			"rhs_VG40OP_red",
			"rhs_VG40OP_white"
		};
	};

	class Smokes 
	{
		name = "Smokes";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"SmokeShell",
			"SmokeShellBlue",
			"SmokeShellGreen",
			"SmokeShellOrange",
			"SmokeShellPurple",
			"SmokeShellRed",
			"SmokeShellYellow",
			"1Rnd_Smoke_Grenade_shell",
			"1Rnd_SmokeBlue_Grenade_shell",
			"1Rnd_SmokeGreen_Grenade_shell",
			"1Rnd_SmokeOrange_Grenade_shell",
			"1Rnd_SmokePurple_Grenade_shell",
			"1Rnd_SmokeRed_Grenade_shell",
			"1Rnd_SmokeYellow_Grenade_shell",
			"3Rnd_Smoke_Grenade_shell",
			"3Rnd_SmokeBlue_Grenade_shell",
			"3Rnd_SmokeGreen_Grenade_shell",
			"3Rnd_SmokeOrange_Grenade_shell",
			"3Rnd_SmokePurple_Grenade_shell",
			"3Rnd_SmokeRed_Grenade_shell",
			"3Rnd_SmokeYellow_Grenade_shell",
			"CUP_1Rnd_SMOKE_GP25_M",
			"CUP_1Rnd_Smoke_M203",
			"CUP_1Rnd_SmokeGreen_M203",
			"CUP_1Rnd_SmokeRed_M203",
			"CUP_1Rnd_SmokeYellow_M203",
			"CUP_6Rnd_Smoke_M203"
		};
	};	

	class Explosives
	{
		name = "Explosives and Explosive Ammo";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\cargothrow_ca.paa";
		items[] = 
		{
			"HandGrenade",
			"MiniGrenade",
			"B_IR_Grenade",
			"O_IR_Grenade",
			"I_IR_Grenade",
			"1Rnd_HE_Grenade_shell",
			"3Rnd_HE_Grenade_shell",
			"APERSBoundingMine_Range_Mag",
			"APERSMine_Range_Mag",
			"APERSTripMine_Wire_Mag",
			"ClaymoreDirectionalMine_Remote_Mag",
			"DemoCharge_Remote_Mag",
			"IEDLandBig_Remote_Mag",
			"IEDLandSmall_Remote_Mag",
			"IEDUrbanBig_Remote_Mag",
			"IEDUrbanSmall_Remote_Mag",
			"SatchelCharge_Remote_Mag",
			"SLAMDirectionalMine_Wire_Mag",
			"CUP_HandGrenade_L109A1_HE",
			"CUP_HandGrenade_RGD5",
			"CUP_HandGrenade_M67",
			"rhsusf_8Rnd_HE",
			"rhsusf_8Rnd_FRAG",
			"CUP_1Rnd_HE_GP25_M",
			"CUP_1Rnd_HEDP_M203",
			"CUP_1Rnd_HE_M203",
			"CUP_6Rnd_HE_M203",
			"rhs_mag_m4009",
			"rhs_mag_m576",
			"rhs_VOG25",
			"rhs_VG40SZ",
			"rhs_VG40TB"
		};
	};

	class Pistols 
	{
		name = "Pistols";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\handgun_ca.paa";
		items[] = 
		{
			"hgun_ACPC2_F",
			"hgun_P07_F",
			"hgun_Pistol_heavy_01_F",
			"hgun_Pistol_heavy_02_F",
			"hgun_Pistol_Signal_F",
			"hgun_Rook40_F"
		};
	};

	class SubMachineGuns 
	{
		name = "Sub Machine Guns";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"hgun_PDW2000_F",
			"SMG_01_F",
			"SMG_02_F"
		};
	};

	class LightMachineGuns 
	{
		name = "Light Machine Guns";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"arifle_MX_SW_Black_F",
			"arifle_MX_SW_F",
			"LMG_Mk200_F",
			"LMG_Zafir_F",
			"MMG_01_hex_F",
			"MMG_01_tan_F",
			"MMG_02_black_F",
			"MMG_02_camo_F",
			"MMG_02_sand_F"
		};
	};

	class AssaultRifles
	{
		name = "Assault Rifles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"arifle_Katiba_C_F",
			"arifle_Katiba_F",
			"arifle_Katiba_GL_F",
			"arifle_Mk20_F",
			"arifle_Mk20_GL_F",
			"arifle_Mk20_GL_plain_F",
			"arifle_Mk20_plain_F",
			"arifle_Mk20C_F",
			"arifle_Mk20C_plain_F",
			"arifle_MX_Black_F",
			"arifle_MX_F",
			"arifle_MX_GL_Black_F",
			"arifle_MX_GL_F",
			"arifle_MXC_Black_F",
			"arifle_MXC_F",
			"arifle_SDAR_F",
			"arifle_TRG20_F",
			"arifle_TRG21_F",
			"arifle_TRG21_GL_F"
		};
	};

	class SniperRifles
	{
		name = "Sniper Rifles";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"arifle_MXM_Black_F",
			"arifle_MXM_F",
			"srifle_DMR_01_F",
			"srifle_DMR_02_camo_F",
			"srifle_DMR_02_F",
			"srifle_DMR_02_sniper_F",
			"srifle_DMR_03_F",
			"srifle_DMR_03_khaki_F",
			"srifle_DMR_03_multicam_F",
			"srifle_DMR_03_tan_F",
			"srifle_DMR_03_woodland_F",
			"srifle_DMR_04_F",
			"srifle_DMR_04_Tan_F",
			"srifle_DMR_05_blk_F",
			"srifle_DMR_05_hex_F",
			"srifle_DMR_05_tan_f",
			"srifle_DMR_06_camo_F",
			"srifle_DMR_06_olive_F",
			"srifle_EBR_F",
			"srifle_GM6_camo_F",
			"srifle_GM6_F",
			"srifle_LRR_camo_F",
			"srifle_LRR_F"
		};
	};

	class Bikes
	{
		name = "Bikes";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Bike_OldBike",
			"Exile_Bike_MountainBike"
		};
	};

	class Cars
	{
		name = "Cars";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Car_Kart_Black",
			"Exile_Bike_QuadBike_Black",
			"Exile_Car_OldTractor_Red",
			"Exile_Car_TowTractor_White",
			"Exile_Car_Tractor_Red",
			"Exile_Car_UAZ_Green",
			"Exile_Car_UAZ_Open_Green",
			"Exile_Car_Octavius_White",
			"Exile_Car_LandRover_Green",
			"Exile_Car_LandRover_Ambulance_Green",
			"Exile_Car_Lada_Green",
			"Exile_Car_Volha_White",
			"Exile_Car_Hatchback_Rusty1",
			"Exile_Car_Hatchback_Rusty2",
			"Exile_Car_Hatchback_Rusty3",
			"Exile_Car_Hatchback_Sport_Red",
			"Exile_Car_SUV_Red",
			"Exile_Car_SUVXL_Black",
			"Exile_Car_Offroad_Rusty1",
			"Exile_Car_Offroad_Rusty2",
			"Exile_Car_Offroad_Rusty3",
			"Exile_Car_Offroad_Repair_Civillian",
			"Exile_Car_Offroad_Armed_Guerilla01",
			"Exile_Car_Strider",
			"Exile_Car_Hunter",
			"B_MRAP_01_hmg_F",
			"I_MRAP_03_hmg_F",
			"O_MRAP_02_hmg_F",
			"Exile_Car_Ifrit"
		};
	};

	class Trucks
	{
		name = "Trucks";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Car_Van_Black",
			"Exile_Car_Van_Box_Black",
			"Exile_Car_Van_Fuel_Black",
			"Exile_Car_Ural_Open_Worker",
			"Exile_Car_Ural_Covered_Worker",
			"Exile_Car_Zamak",
			"Exile_Car_Tempest",
			"Exile_Car_HEMMT",
			"Exile_Car_Ikarus_Blue",
			"Exile_Car_Ural_Open_Worker",
			"Exile_Car_Ural_Covered_Worker"
		};
	};

	class Choppers
	{
		name = "Helicopters";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Chopper_Hummingbird_Green",
			"Exile_Chopper_Hummingbird_Civillian_Wasp",
			"Exile_Chopper_Huey_Green",
			"Exile_Chopper_Huey_Armed_Green",
			"Exile_Chopper_Taru_Black",
			"Exile_Chopper_Taru_Covered_Black",
			"Exile_Chopper_Taru_Transport_Black",
			"Exile_Chopper_Orca_BlackCustom",
			"Exile_Chopper_Mohawk_FIA",
			"Exile_Chopper_Huron_Black",
			"B_Heli_light_01_armed_F",
			"Exile_Chopper_Hellcat_Green"
		};
	};

	class Boats
	{
		name = "Boats";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Boat_RubberDuck_CSAT",
			"Exile_Boat_RubberDuck_Digital",
			"Exile_Boat_RubberDuck_Orange",
			"Exile_Boat_RubberDuck_Blue",
			"Exile_Boat_RubberDuck_Black",
			"Exile_Boat_MotorBoat_Police",
			"Exile_Boat_MotorBoat_Orange",
			"Exile_Boat_MotorBoat_White",
			"Exile_Boat_SDV_CSAT",
			"Exile_Boat_SDV_Digital",
			"Exile_Boat_SDV_Grey",
			"B_Boat_Armed_01_minigun_F"
		};
	};

	class Planes
	{
		name = "Planes";
		icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
		items[] = 
		{
			"Exile_Plane_Cessna"
		};
	};
  class MilitarySpecial
  {
    name = "MilitarySpecial";
    icon = "a3\ui_f\data\gui\Rsc\RscDisplayArsenal\itemacc_ca.paa";
    items[] =
    {

		"B_Carryall_ocamo",
		"B_Carryall_oucamo",
		"B_Carryall_mcamo",
		"B_Carryall_oli",
		"B_Carryall_khk",
		"B_Carryall_cbr",
		"Rangefinder",
		"Laserdesignator",
		"ItemRadio",
		"ItemGPS",
		"NVGoggles",
		"Exile_Item_InstaDoc",
		"rhs_weap_sr25",
		"rhs_weap_sr25_ec",
		"rhs_weap_m14ebrri",
		"rhs_weap_XM2010",
		"rhs_weap_XM2010_wd",
		"rhs_weap_XM2010_d",
		"rhs_weap_XM2010_sa",
		"rhs_weap_svd",
		"rhs_weap_svdp_wd",
		"rhs_weap_svdp_wd_npz",
		"rhs_weap_svdp_npz",
		"rhs_weap_svds",
		"rhs_weap_svds_npz"

    };
  };
};

class CfgTraders
{
	/**
	 * Weapons, scopes, silencers, ammo
	 */
	class Exile_Trader_Armory
	{
		name = "ARMORY";
		showWeaponFilter = 1;
		categories[] = 
		{
			"PointerAttachments",
			"RHSPointerAttachments",
			"CUPPointerAttachments",
			"BipodAttachments",
			"RHSBipodAttachments",
			"MuzzleAttachments",
			"RHSMuzzleAttachments",
			"CUPMuzzleAttachments",
			"OpticAttachments",
			"RHSOpticAttachments",
			"CUPOpticAttachments",
			"Ammunition",
			"RHSAmmo",
			"CUPAmmunition",
			"Pistols",
			"RHSPistols",
			"CUPPistols",
			"RHSShotguns",
			"CUPShotguns",
			"SubMachineGuns",
			"RHSSubMachineGuns",
			"CUPSubMachineGuns",
			"LightMachineGuns",
			"RHSLightMachineGuns",
			"CUPLightMachineGuns",
			"AssaultRifles",
			"RHSAssaultRifles",
			"CUPAssaultRifles",
			"SniperRifles",
			"RHSSniperRifles",
			"CUPSniperRifles"
		};
	};

	/**
	 * Satchels, nades, UAVs, static MGs
	 */
	class Exile_Trader_SpecialOperations
	{
		name = "SPECIAL OPERATIONS";
		showWeaponFilter = 1; // for noob tubes
		categories[] = 
		{
			"Flares",
			"Smokes",
			"StaticMGs",
			"Explosives",
			"CUPLaunchers",
			"CUPLauncherAmmo",
			"CUPExplosives",
			"RHSExplosives",
			"Navigation"
		};
	};

	/**
	 * Uniforms, vests, helmets, backpacks
	 */
	class Exile_Trader_Equipment
	{	
		name = "EQUIPMENT";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Headgear",
			"RHSHeadgear",
			"TRYKHeadgear",
			"TRYKNVGHeadgear",
			"Uniforms",
			"RHSUniforms",
			"TRYKUniforms",
			"Vests",
			"RHSVests",
			"TRYKVests",
			"Backpacks",
			"TRYKBackpacks",
			"CUPBackpacks",
			"FirstAid"
		};
	};

	/**
	 * Cans, cans, cans
	 */
	class Exile_Trader_Food
	{
		name = "FAST FOOD";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Food",
			"Drinks"
		};
	};

	/**
	 * Light bulbs, metal, etc.
	 */
	class Exile_Trader_Hardware
	{
		name = "HARDWARE";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Hardware",
			"Tools"
		};
	};

	/**
	 * Sells cars and general vehicles
	 */
	class Exile_Trader_Vehicle
	{
		name = "VEHICLE";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Cars",
			"Trucks",
			"RHSVehicles",
			"RHSArmedVehicles"
		};
	};

	/**
	 * Sells choppers and planes
	 */
	class Exile_Trader_Aircraft
	{
		name = "AIRCRAFT";
		showWeaponFilter = 0;
		categories[] = 
		{
			"RHSHelicopters",
			"RHSPlanes",
			"Choppers", 
			"Planes"
		};
	};

	/**
	 * Sells ships and boats
	 */ 
	class Exile_Trader_Boat
	{
		name = "BOAT";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Boats"
		};
	};

	/**
	 * Sells Community Items
	 */ 
	class Exile_Trader_CommunityCustoms
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community"
		};
	};

	class Exile_Trader_CommunityCustoms2
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community2"
		};
	};

	class Exile_Trader_CommunityCustoms3
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community3"
		};
	};

	class Exile_Trader_CommunityCustoms4
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community4"
		};
	};

	class Exile_Trader_CommunityCustoms5
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community5"
		};
	};

	class Exile_Trader_CommunityCustoms6
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community6"
		};
	};

	class Exile_Trader_CommunityCustoms7
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community7"
		};
	};

	class Exile_Trader_CommunityCustoms8
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community8"
		};
	};

	class Exile_Trader_CommunityCustoms9
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community9"
		};
	};

	class Exile_Trader_CommunityCustoms10
	{
		name = "COMMUNITY";
		showWeaponFilter = 0;
		categories[] = 
		{
			"Community10"
		};
	};
};
class CfgTrading 
{
	/*
	* This factor defines the difference between sales/purchase price of
	* items and vehicles. It is used if there is no sales price defined
	* in CfgExileArsenal. 
	*/
	sellPriceFactor = 0.5;
	
	rekeyPriceFactor = 0.1;
};
class CfgVehicleCustoms
{
	///////////////////////////////////////////////////////////////////////////////
	// QUAD BIKES
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Bike_QuadBike_Abstract
	{
		skins[] = 
		{
			
			{"Exile_Bike_QuadBike_Blue",		100, "Blue",		{"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_BLUE_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVBLUE_CO.paa"};},
			{"Exile_Bike_QuadBike_Red",			100, "Red",			{"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_RED_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVRED_CO.paa"};},
			{"Exile_Bike_QuadBike_White",		100, "White",		{"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_WHITE_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVWHITE_CO.paa"};},
			{"Exile_Bike_QuadBike_Nato",		150, "NATO",		{"\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","\A3\Soft_F\Quadbike_01\Data\Quadbike_01_wheel_co.paa"};},
			{"Exile_Bike_QuadBike_Csat",		150, "CSAT",		{"\A3\Soft_F\Quadbike_01\Data\Quadbike_01_OPFOR_CO.paa","\A3\Soft_F\Quadbike_01\Data\Quadbike_01_wheel_OPFOR_CO.paa"};},
			{"Exile_Bike_QuadBike_Fia",			150, "FIA",			{"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_INDP_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_INDP_CO.paa"};},
			{"Exile_Bike_QuadBike_Guerilla01",	150, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Quadbike_01\Data\Quadbike_01_IG_CO.paa","\A3\soft_f_gamma\Quadbike_01\Data\Quadbike_01_wheel_IG_CO.paa"};},
			{"Exile_Bike_QuadBike_Guerilla02",	150, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Quadbike_01\Data\Quadbike_01_INDP_Hunter_CO.paa","\A3\soft_f_gamma\Quadbike_01\Data\Quadbike_01_wheel_INDP_Hunter_CO.paa"};},
			{"Exile_Bike_QuadBike_Black",		100, "Black",		{"\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_CIV_BLACK_CO.paa","\A3\Soft_F_Beta\Quadbike_01\Data\Quadbike_01_wheel_CIVBLACK_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// MOTOR BOATS
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_MotorBoat_Abstract
	{
		skins[] = 
		{
			{"Exile_Boat_MotorBoat_Police",		350, "Police", {"\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_ext_police_co.paa","\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_int_police_co.paa"};},
			{"Exile_Boat_MotorBoat_Orange",		300, "Orange", {"\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_ext_rescue_co.paa","\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_int_rescue_co.paa"};},
			{"Exile_Boat_MotorBoat_White",		300, "White",  {"\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_ext_co.paa","\a3\boat_f_gamma\Boat_Civil_01\data\Boat_Civil_01_int_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// RUBBER DUCKS
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_RubberDuck_Abstract
	{
		skins[] = 
		{
			{"Exile_Boat_RubberDuck_CSAT",		200, "CSAT", {"\A3\boat_F\Boat_Transport_01\data\Boat_Transport_01_OPFOR_CO.paa"};},
			{"Exile_Boat_RubberDuck_Digital",	200, "Digital",{"\A3\boat_F\Boat_Transport_01\data\Boat_Transport_01_INDP_CO.paa"};},
			{"Exile_Boat_RubberDuck_Orange",	150, "Orange", {"\A3\boat_F\Boat_Transport_01\data\Boat_Transport_01_rescue_CO.paa"};},
			{"Exile_Boat_RubberDuck_Blue",		150, "Blue", {"\A3\boat_F\Boat_Transport_01\data\Boat_Transport_01_civilian_CO.paa"};},
			{"Exile_Boat_RubberDuck_Black",		150, "Black", {"\A3\boat_F\Boat_Transport_01\data\boat_transport_01_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// SDV
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Boat_SDV_Abstract
	{
		skins[] = 
		{
			{"Exile_Boat_SDV_CSAT",		200, "CSAT", {"\A3\boat_f_beta\SDV_01\data\SDV_ext_opfor_CO.paa"};},
			{"Exile_Boat_SDV_Digital",	200, "Digital", {"\A3\boat_f_beta\SDV_01\data\SDV_ext_INDP_CO.paa"};},
			{"Exile_Boat_SDV_Grey",		100, "Grey", {"\A3\boat_f_beta\SDV_01\data\SDV_ext_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Hellcat
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Hellcat_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Hellcat_Green", 350, "Green", 	{"\A3\Air_F_EPB\Heli_Light_03\data\Heli_Light_03_base_CO.paa"};},
			{"Exile_Chopper_Hellcat_FIA", 	500, "FIA", 	{"\A3\Air_F_EPB\Heli_Light_03\data\heli_light_03_base_indp_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Karts
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Kart_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Kart_BluKing", 				100, "Bluking", 	{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_blu_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"};},	
			{"Exile_Car_Kart_RedStone", 			100, "RedStone", 	{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_black_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_black_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"};},
			{"Exile_Car_Kart_Vrana", 				100, "Vrana", 		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_vrana_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_vrana_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"};},	
			{"Exile_Car_Kart_Green", 				100, "Green", 		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_green_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"};},	
			{"Exile_Car_Kart_Blue", 				100, "Blue", 		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_blue_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"};},	
			{"Exile_Car_Kart_Orange", 				100, "Orange",		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_orange_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_blu_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"};},	
			{"Exile_Car_Kart_White", 				100, "White", 		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_white_CO.paa","","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"};},	
			{"Exile_Car_Kart_Yellow", 				100, "Yellow", 		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_yellow_CO.paa","","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"};},	
			{"Exile_Car_Kart_Black", 				100, "Black", 		{"\a3\Soft_F_Kart\Kart_01\Data\Kart_01_base_black_CO.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_01_logos_black_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_1_CA.paa","\a3\Soft_F_Kart\Kart_01\Data\Kart_num_3_CA.paa"};}	
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Hummingbird (Civillian)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Hummingbird_Civillian_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Hummingbird_Civillian_Blue", 		350, "Blue", 		{"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Red", 		350, "Red", 		{"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_ION", 		350, "ION", 		{"\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_BlueLine", 	350, "BlueLine", 	{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueLine_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Digital", 	350, "Digital", 	{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Elliptical", 	350, "Elliptical", 	{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Furious", 	350, "Furious", 	{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_GrayWatcher", 350, "GrayWatcher",	{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_graywatcher_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Jeans", 		350, "Jeans", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Light", 		350, "Light", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_light_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Shadow", 		350, "Shadow", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_shadow_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Sheriff", 	350, "Sheriff", 	{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Speedy", 		350, "Speedy", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Sunset", 		350, "Sunset", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Vrana", 		350, "Vrana", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Wasp", 		350, "Wasp", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa"};},
			{"Exile_Chopper_Hummingbird_Civillian_Wave", 		350, "Wave", 		{"\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Huron
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Huron_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Huron_Black", 	450, "Black", {"\A3\Air_F_Heli\Heli_Transport_03\Data\Heli_Transport_03_ext01_black_CO.paa","\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_black_co.paa"};},
			{"Exile_Chopper_Huron_Green", 	450, "Green", {"\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_co.paa","\a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Orca
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Orca_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Orca_CSAT", 		350, "CSAT", 			{"\A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_CO.paa"};},
			{"Exile_Chopper_Orca_Black", 		350, "Black", 			{"\A3\Air_F\Heli_Light_02\Data\Heli_Light_02_ext_CO.paa"};},
			{"Exile_Chopper_Orca_BlackCustom", 	350, "Black Custom", 	{"\A3\Air_F_Heli\Heli_Light_02\Data\Heli_Light_02_ext_OPFOR_V2_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Taru
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Taru_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Taru_CSAT",		500, "CSAT", 	{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_co.paa"};},
			{"Exile_Chopper_Taru_Black",	500, "BLACK", 	{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_black_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_black_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Taru (Transport)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Taru_Transport_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Taru_Transport_CSAT",	500, "CSAT", 	{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_co.paa"};},
			{"Exile_Chopper_Taru_Transport_Black",	500, "Black", 	{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_black_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_black_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Taru (Covered)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Taru_Covered_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Taru_Covered_CSAT",		500, "CSAT",	{"A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_01_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_base_02_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext01_CO.paa","A3\Air_F_Heli\Heli_Transport_04\Data\Heli_Transport_04_Pod_Ext02_CO.paa"};},
			{"Exile_Chopper_Taru_Covered_Black",	500, "Black",	{"A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_01_black_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_base_02_black_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext01_black_co.paa","A3\Air_F_Heli\Heli_Transport_04\Data\heli_transport_04_pod_ext02_black_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Hatchback
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Hatchback_Abstract
	{	
		skins[] = 
		{
			{"Exile_Car_Hatchback_Rusty1", 			50, "Rusty White",		{"\exile_assets\model\RTV\Exile_Car_Hatchback_01_co.paa"};},
			{"Exile_Car_Hatchback_Rusty2", 			50, "Rusty Red",		{"\exile_assets\model\RTV\Exile_Car_Hatchback_02_co.paa"};},
			{"Exile_Car_Hatchback_Rusty3", 			50, "Rusty Yellow",		{"\exile_assets\model\RTV\Exile_Car_Hatchback_03_co.paa"};},
			{"Exile_Car_Hatchback_Beige", 			100, "Beige",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE01_CO.paa"};},
			{"Exile_Car_Hatchback_Green", 			100, "Green",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE02_CO.paa"};},
			{"Exile_Car_Hatchback_Blue", 			100, "Blue",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE03_CO.paa"};},
			{"Exile_Car_Hatchback_BlueCustom", 		100, "Blue Custom",		{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE04_CO.paa"};},
			{"Exile_Car_Hatchback_BeigeCustom", 	100, "Beige Custom",	{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE05_CO.paa"};},
			{"Exile_Car_Hatchback_Yellow", 			100, "Yellow",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE06_CO.paa"};},
			{"Exile_Car_Hatchback_Grey", 			100, "Grey",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE07_CO.paa"};},
			{"Exile_Car_Hatchback_Black", 			100, "Black",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE08_CO.paa"};},
			{"Exile_Car_Hatchback_Dark", 			100, "Dark",			{"\A3\Soft_F_Gamma\Hatchback_01\data\Hatchback_01_ext_BASE09_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Hatchback (Sport)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Hatchback_Sport_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Hatchback_Sport_Red", 		100, "Red",		{"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT01_CO.paa"};},
			{"Exile_Car_Hatchback_Sport_Blue", 		100, "Blue",	{"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT02_CO.paa"};},
			{"Exile_Car_Hatchback_Sport_Orange", 	100, "Orange",	{"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT03_CO.paa"};},
			{"Exile_Car_Hatchback_Sport_White", 	100, "White",	{"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT04_CO.paa"};},
			{"Exile_Car_Hatchback_Sport_Beige", 	100, "Beige",	{"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT05_CO.paa"};},
			{"Exile_Car_Hatchback_Sport_Green", 	100, "Green",	{"\A3\soft_f_gamma\Hatchback_01\data\Hatchback_01_ext_SPORT06_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Offroad
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Offroad_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Offroad_Rusty1", 		50, "Rusty White",	{"\exile_assets\model\RTV\Exile_offroad_03_co.paa","\exile_assets\model\RTV\Exile_offroad_03_co.paa"};},
			{"Exile_Car_Offroad_Rusty2", 		50, "Rusty Red",	{"\exile_assets\model\RTV\Exile_offroad_01_co.paa","\exile_assets\model\RTV\Exile_offroad_01_co.paa"};},
			{"Exile_Car_Offroad_Rusty3", 		50, "Rusty Blue",	{"\exile_assets\model\RTV\Exile_offroad_02_co.paa","\exile_assets\model\RTV\Exile_offroad_02_co.paa"};},
			{"Exile_Car_Offroad_Red", 			500, "Red",			{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_CO.paa"};},
			{"Exile_Car_Offroad_Beige", 		500, "Beige",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE01_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE01_CO.paa"};},
			{"Exile_Car_Offroad_White", 		500, "White",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE02_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE02_CO.paa"};},
			{"Exile_Car_Offroad_Blue", 			500, "Blue",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE03_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE03_CO.paa"};},
			{"Exile_Car_Offroad_DarkRed", 		500, "Dark Red",	{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE04_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE04_CO.paa"};},
			{"Exile_Car_Offroad_BlueCustom", 	500, "Blue Custom",	{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE05_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE05_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla01", 	700, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla02", 	700, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla03", 	700, "Guerilla 03",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla04", 	700, "Guerilla 04",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla05", 	700, "Guerilla 05",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla06", 	700, "Guerilla 06",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla07", 	700, "Guerilla 07",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla08", 	700, "Guerilla 08",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla09", 	700, "Guerilla 09",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla10", 	700, "Guerilla 10",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla11", 	700, "Guerilla 11",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa"};},
			{"Exile_Car_Offroad_Guerilla12", 	700, "Guerilla 12",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa"};},
			{"Exile_Car_Offroad_DarkRed",		700, "Exile Black", {"exile_assets\texture\vehicle\Exile_Offroad_Black_co.paa"};},
			{"Exile_Car_Offroad_DarkRed",		700, "Exile Light Blue", {"exile_assets\texture\vehicle\Exile_Offroad_LightBlue_co.paa"};},
			{"Exile_Car_Offroad_DarkRed",		700, "Exile Orange",{"exile_assets\texture\vehicle\Exile_Offroad_Orange_co.paa"};},
			{"Exile_Car_Offroad_DarkRed",		700, "Exile Pink",	{"exile_assets\texture\vehicle\Exile_Offroad_Pink_co.paa"};},
			{"Exile_Car_Offroad_DarkRed",		700, "Exile White",	{"exile_assets\texture\vehicle\Exile_Offroad_White_co.paa"};},
			{"Exile_Car_Offroad_DarkRed",		700, "Exile Yellow",{"exile_assets\texture\vehicle\Exile_Offroad_Yellow_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Land Rover
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_LandRover_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_LandRover_Red", 250, "Red", {"Exile_psycho_LRC\data\r_lr_base_co.paa","Exile_psycho_LRC\data\r_lr_special_co.paa"};},
			{"Exile_Car_LandRover_Urban", 250, "Urban", {"Exile_psycho_LRC\data\textures\lr_base_urbancamo_co.paa","Exile_psycho_LRC\data\textures\lr_special_urbancamo_co.paa"};},
			{"Exile_Car_LandRover_Green", 250, "Green", {"Exile_psycho_LRC\data\lr_acr_base_co.paa","Exile_psycho_LRC\data\lr_acr_spec_co.paa"};},
			{"Exile_Car_LandRover_Sand", 250, "Sand", {"Exile_psycho_LRC\data\lr_acr_sand_base_co.paa","Exile_psycho_LRC\data\lr_special_acr_co.paa"};},
			{"Exile_Car_LandRover_Desert", 250, "Desert", {"Exile_psycho_LRC\data\lr_acrs_base_co.paa","Exile_psycho_LRC\data\lr_special_acr_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Land Rover (Ambulance)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_LandRover_Ambulance_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_LandRover_Ambulance_Green", 250, "Green", {"Exile_psycho_LRC\data\lr_acr_base_co.paa","Exile_psycho_LRC\data\lr_amb_ext_co.paa","Exile_psycho_LRC\data\lr_acr_spec_co.paa"};},
			{"Exile_Car_LandRover_Ambulance_Desert", 250, "Desert", {"Exile_psycho_LRC\data\lr_acrs_base_co.paa","Exile_psycho_LRC\data\lr_amb_ext_co.paa","Exile_psycho_LRC\data\lr_special_acr_co.paa"};},
			{"Exile_Car_LandRover_Ambulance_Sand", 250, "Sand", {"Exile_psycho_LRC\data\lr_acr_sand_base_co.paa","Exile_psycho_LRC\data\lr_amb_ext_co.paa","Exile_psycho_LRC\data\lr_special_acr_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Octavius
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Octavius_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Octavius_White", 250, "White", {"exile_psycho_Octavia\Data\car_body_co.paa"};},
			{"Exile_Car_Octavius_Black", 250, "Black", {"exile_psycho_Octavia\Data\car_body_bl_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// UH-1H Huey
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Huey_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Huey_Green", 700, "Green", {"Exile_psycho_UH1H\data\uh1h_co.paa","Exile_psycho_UH1H\data\uh1h_in_co.paa","Exile_psycho_UH1H\data\default_co.paa","Exile_psycho_UH1H\data\alpha_ca.paa"};},
			{"Exile_Chopper_Huey_Desert", 700, "Desert", {"Exile_psycho_UH1H\data\uh1d_tka_co.paa","Exile_psycho_UH1H\data\uh1d_in_tka_co.paa","Exile_psycho_UH1H\data\default_co.paa","Exile_psycho_UH1H\data\alpha_ca.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// UH-1H Huey (Armed)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Chopper_Huey_Armed_Abstract
	{
		skins[] = 
		{
			{"Exile_Chopper_Huey_Armed_Green", 700, "Green", {"Exile_psycho_UH1H\data\uh1h_co.paa","Exile_psycho_UH1H\data\uh1h_in_co.paa","Exile_psycho_UH1H\data\default_co.paa","Exile_psycho_UH1H\data\alpha_ca.paa"};},
			{"Exile_Chopper_Huey_Armed_Desert", 700, "Desert", {"Exile_psycho_UH1H\data\uh1d_tka_co.paa","Exile_psycho_UH1H\data\uh1d_in_tka_co.paa","Exile_psycho_UH1H\data\default_co.paa","Exile_psycho_UH1H\data\alpha_ca.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Offroad (Armed)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Offroad_Armed_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Offroad_Armed_Guerilla01",	250, "Guerilla 01", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla02",	250, "Guerilla 02", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla03",	250, "Guerilla 03", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla04",	250, "Guerilla 04", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla05",	250, "Guerilla 05", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla06",	250, "Guerilla 06", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla07",	250, "Guerilla 07", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla08",	250, "Guerilla 08", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla09",	250, "Guerilla 09", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla10",	250, "Guerilla 10", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla11",	250, "Guerilla 11", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa"};},
			{"Exile_Car_Offroad_Armed_Guerilla12",	250, "Guerilla 12", {"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Offroad (Repair)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Offroad_Repair_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Offroad_Repair_Civillian",		150, "Civillian",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\Offroad_01_ext_repair_CIV_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\Offroad_01_ext_repair_CIV_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Red",			150, "Red",			{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Beige",			150, "Beige",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE01_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE01_CO.paa"};},
			{"Exile_Car_Offroad_Repair_White",			150, "White",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE02_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE02_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Blue",			150, "Blue",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE03_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE03_CO.paa"};},
			{"Exile_Car_Offroad_Repair_DarkRed",		150, "DarkRed",		{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE04_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE04_CO.paa"};},
			{"Exile_Car_Offroad_Repair_BlueCustom",		150, "BlueCustom",	{"\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE05_CO.paa","\a3\Soft_F\Offroad_01\data\Offroad_01_ext_BASE05_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla01",		250, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_01_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla02",		250, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_02_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla03",		250, "Guerilla 03",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_03_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla04",		250, "Guerilla 04",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_04_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla05",		250, "Guerilla 05",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_05_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla06",		250, "Guerilla 06",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_06_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla07",		250, "Guerilla 07",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_07_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla08",		250, "Guerilla 08",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_08_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla09",		250, "Guerilla 09",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_09_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla10",		250, "Guerilla 10",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_10_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla11",		250, "Guerilla 11",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_11_CO.paa"};},
			{"Exile_Car_Offroad_Repair_Guerilla12",		250, "Guerilla 12",	{"\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa","\A3\Soft_F_Bootcamp\Offroad_01\Data\offroad_01_ext_IG_12_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// SUV
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_SUV_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_SUV_Red", 		100, "Red",					{"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_CO.paa"};},
			{"Exile_Car_SUV_Black", 	150, "Black",				{"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_02_CO.paa"};},
			{"Exile_Car_SUV_Grey", 		100, "Grey",				{"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_03_CO.paa"};},
			{"Exile_Car_SUV_Orange", 	100, "Orange",				{"\A3\Soft_F_Gamma\SUV_01\Data\SUV_01_ext_04_CO.paa"};},
			{"Exile_Car_SUV_Black", 	150, "Snow Camo",			{"exile_assets\texture\vehicle\Exile_SUV_Snow_co.paa"};},
			{"Exile_Car_SUV_Black", 	150, "Leaf Camo",			{"exile_assets\texture\vehicle\Exile_SUV_Leaf_Light_co.paa"};},
			{"Exile_Car_SUV_Black", 	150, "Leaf Camo (Dark)",	{"exile_assets\texture\vehicle\Exile_SUV_Leaf_Dark_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// SUV XL
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_SUVXL_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_SUVXL_Black", 100, "Black", {""};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Van 
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Van_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Van_Black",			100, "Black",		{"\A3\soft_f_gamma\van_01\Data\Van_01_ext_black_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"};},
			{"Exile_Car_Van_White",			100, "White",		{"\A3\soft_f_gamma\van_01\Data\van_01_ext_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"};},
			{"Exile_Car_Van_Red",			100, "Red",			{"\A3\soft_f_gamma\van_01\Data\Van_01_ext_red_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"};},
			{"Exile_Car_Van_Guerilla01",	150, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_01_CO.paa"};},
			{"Exile_Car_Van_Guerilla02",	150, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_02_CO.paa"};},
			{"Exile_Car_Van_Guerilla03",	150, "Guerilla 03",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_03_CO.paa"};},
			{"Exile_Car_Van_Guerilla04",	150, "Guerilla 04",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_04_CO.paa"};},
			{"Exile_Car_Van_Guerilla05",	150, "Guerilla 05",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_05_CO.paa"};},
			{"Exile_Car_Van_Guerilla06",	150, "Guerilla 06",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_06_CO.paa"};},
			{"Exile_Car_Van_Guerilla07",	150, "Guerilla 07",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_07_CO.paa"};},
			{"Exile_Car_Van_Guerilla08",	150, "Guerilla 08",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_08_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Van (Box) 
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Van_Box_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Van_Box_Black",				100, "Black",		{"\A3\soft_f_gamma\van_01\Data\Van_01_ext_black_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"};},
			{"Exile_Car_Van_Box_White",				100, "White",		{"\A3\soft_f_gamma\van_01\Data\van_01_ext_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"};},
			{"Exile_Car_Van_Box_Red",				100, "Red",			{"\A3\soft_f_gamma\van_01\Data\Van_01_ext_red_CO.paa","\A3\soft_f_gamma\van_01\Data\van_01_adds_CO.paa"};},
			{"Exile_Car_Van_Box_Guerilla01",		150, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_01_CO.paa"};},
			{"Exile_Car_Van_Box_Guerilla02",		150, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_02_CO.paa"};},
			{"Exile_Car_Van_Box_Guerilla03",		150, "Guerilla 03",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_03_CO.paa"};},
			{"Exile_Car_Van_Box_Guerilla04",		150, "Guerilla 04",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_04_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_04_CO.paa"};},
			{"Exile_Car_Van_Box_Guerilla05",		150, "Guerilla 05",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_05_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_05_CO.paa"};},
			{"Exile_Car_Van_Box_Guerilla06",		150, "Guerilla 06",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_06_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_06_CO.paa"};},
			{"Exile_Car_Van_Box_Guerilla07",		150, "Guerilla 07",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_07_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_07_CO.paa"};},
			{"Exile_Car_Van_Box_Guerilla08",		150, "Guerilla 08",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_08_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_adds_IG_08_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Van (Fuel) 
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Van_Fuel_Abstract
	{
		skins[] = 
		{
			{"Exile_Car_Van_Fuel_Black",			100, "Black",		{"\A3\soft_f_gamma\van_01\Data\Van_01_ext_black_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_CO.paa"};},
			{"Exile_Car_Van_Fuel_White",			100, "White",		{"\A3\soft_f_gamma\van_01\Data\van_01_ext_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_CO.paa"};},
			{"Exile_Car_Van_Fuel_Red",				100, "Red",			{"\A3\soft_f_gamma\van_01\Data\Van_01_ext_red_CO.paa","\A3\soft_f_gamma\Van_01\Data\Van_01_tank_CO.paa"};},
			{"Exile_Car_Van_Fuel_Guerilla01",		150, "Guerilla 01",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_01_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_tank_IG_01_CO.paa"};},
			{"Exile_Car_Van_Fuel_Guerilla02",		150, "Guerilla 02",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_02_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_tank_IG_02_CO.paa"};},
			{"Exile_Car_Van_Fuel_Guerilla03",		150, "Guerilla 03",	{"\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_ext_IG_03_CO.paa","\A3\Soft_F_Bootcamp\Van_01\Data\Van_01_tank_IG_03_CO.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Ikarus
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Ikarus_Abstract
	{	
		skins[] = 
		{
			{"Exile_Car_Ikarus_Blue", 		200, "Blue",	{"Exile_psycho_Ikarus\Data\bus_exterior_co.paa"};},
			{"Exile_Car_Ikarus_Red", 		200, "Red",		{"Exile_psycho_Ikarus\Data\bus_exterior_eciv_co.paa"};},
			{"Exile_Car_Ikarus_Party", 		500, "Party",	{"Exile_psycho_Ikarus\Data\bus_exterior_eciv_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Ural (Open)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Ural_Open_Abstract
	{	
		skins[] = 
		{
			{"Exile_Car_Ural_Open_Blue",			300, "Blue",		{"Exile_psycho_Ural\data\Ural_kabina_civil_co.paa","Exile_psycho_Ural\data\ural_plachta_civil_co.paa"};},
			{"Exile_Car_Ural_Open_Yellow",			300, "Yellow",		{"Exile_psycho_Ural\data\ural_kabina_civ1_co.paa","Exile_psycho_Ural\data\ural_plachta_civ1_co.paa"};},
			{"Exile_Car_Ural_Open_Worker",			300, "Worker",		{"Exile_psycho_Ural\data\ural_kabina_civ2_co.paa","Exile_psycho_Ural\data\Ural_plachta_civil_co.paa"};},
			{"Exile_Car_Ural_Open_Military",		300, "Military",	{"Exile_psycho_Ural\data\ural_kabina_khk_co.paa","Exile_psycho_Ural\data\ural_plachta_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Ural (Covered)
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Ural_Covered_Abstract
	{	
		skins[] = 
		{
			{"Exile_Car_Ural_Covered_Blue",			300, "Blue",		{"Exile_psycho_Ural\data\ural_kabina_civil_co.paa","Exile_psycho_Ural\data\ural_plachta_civil_co.paa"};},
			{"Exile_Car_Ural_Covered_Yellow",		300, "Yellow",		{"Exile_psycho_Ural\data\ural_kabina_civ1_co.paa","Exile_psycho_Ural\data\ural_plachta_civ1_co.paa"};},
			{"Exile_Car_Ural_Covered_Worker",		300, "Worker",		{"Exile_psycho_Ural\data\ural_kabina_civ2_co.paa","Exile_psycho_Ural\data\Ural_plachta_civil_co.paa"};},
			{"Exile_Car_Ural_Covered_Military",		300, "Military",	{"Exile_psycho_Ural\data\ural_kabina_khk_co.paa","Exile_psycho_Ural\data\ural_plachta_co.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Lada
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Lada_Abstract
	{	
		skins[] = 
		{
			{"Exile_Car_Lada_Green", 		100, "Green",	{"exile_psycho_lada\data\lada_eciv1_co.paa","exile_psycho_lada\data\Lada_glass_ECIV1_CA.paa"};},
			{"Exile_Car_Lada_Taxi", 		100, "Taxi",	{"exile_psycho_lada\data\Lada_red_CO.paa"};},
			{"Exile_Car_Lada_Red", 			100, "Red",		{"exile_psycho_lada\data\Lada_red_CO.paa"};},
			{"Exile_Car_Lada_Hipster", 		100, "Hipster",	{"exile_psycho_lada\data\lada_eciv2_co.paa","exile_psycho_lada\data\Lada_glass_ECIV2_CA.paa"};}
		};
	};

	///////////////////////////////////////////////////////////////////////////////
	// Volha
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Volha_Abstract
	{	
		skins[] = 
		{
			{"Exile_Car_Volha_Blue", 		100, "Blue",	{"Exile_psycho_Gaz_volha\data\Volha_ECIV_CO.paa"};},
			{"Exile_Car_Volha_White", 		100, "White",	{"Exile_psycho_Gaz_volha\data\Volha_Gray_ECIV_CO.paa"};},
			{"Exile_Car_Volha_Black",		100, "Black",	{"Exile_psycho_Gaz_volha\data\Volha_Black_ECIV_CO.paa"};}
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////
	// HUNTER
	///////////////////////////////////////////////////////////////////////////////
	class Exile_Car_Hunter_Abstract
	{
		skins[] = 
		{
			
			{"Exile_Car_Hunter",		1000, "Exile White Edition",	{"exile_assets\texture\vehicle\Exile_Hunter_Snow_co.paa","exile_assets\texture\vehicle\Exile_Hunter_Snow_Back_co.paa"};},
			{"Exile_Car_Hunter",		1000, "Exile Hex",				{"exile_assets\texture\vehicle\Exile_Hunter_Hex_co.paa","exile_assets\texture\vehicle\Exile_Hunter_Black_Back_co.paa"};},
			{"Exile_Car_Hunter",		1000, "Exile Black",			{"exile_assets\texture\vehicle\Exile_Hunter_Black_co.paa","exile_assets\texture\vehicle\Exile_Hunter_Black_Back_co.paa"};}
		};
	};
	///////////////////////////////////////////////////////////////////////////////
	// BTR70
	///////////////////////////////////////////////////////////////////////////////
	class rhs_btr70_vmf
	{
		skins[] = 
		{
			
			{"rhs_btr70_msv",		1500, "BTR-70 Sand", {"rhsafrf\addons\rhs_btr70_camo\data\btr70_1_sand_co.paa","rhsafrf\addons\rhs_btr70_camo\data\btr70_2_sand_co.paa"};},	
			{"rhs_btr70_msv",		1500, "BTR-70 Desert", {"rhsafrf\addons\rhs_btr70_camo\data\btr70_des_1_co.paa","rhsafrf\addons\rhs_btr70_camo\data\btr70_des_2_co.paa"};},
			{"rhs_btr70_msv",		1500, "BTR-70 Mar", {"rhsafrf\addons\rhs_btr70_camo\data\btr70_mar_1_co.paa","rhsafrf\addons\rhs_btr70_camo\data\btr70_mar_2_co.paa"};},
			{"rhs_btr70_msv",		1500, "BTR-70 MC", {"rhsafrf\addons\rhs_btr70_camo\data\btr70_MC_1_co.paa","rhsafrf\addons\rhs_btr70_camo\data\btr70_MC_2_co.paa"};},
			{"rhs_btr70_msv",		1500, "BTR-70 Omon 1", {"rhsafrf\addons\rhs_btr70_camo\data\btr70_omon1_1_co.paa","rhsafrf\addons\rhs_btr70_camo\data\btr70_omon1_2_co.paa"};},
			{"rhs_btr70_msv",		1500, "BTR-70 Omon 2", {"rhsafrf\addons\rhs_btr70_camo\data\btr70_omon2_1_co.paa","rhsafrf\addons\rhs_btr70_camo\data\btr70_omon2_2_co.paa"};},
			{"rhs_btr70_msv",		1500, "BTR-70 Camo", {"rhsafrf\addons\rhs_btr70_camo\data\btr70_tri1_1_co.paa","rhsafrf\addons\rhs_btr70_camo\data\btr70_tri1_2_co.paa"};},
			{"rhs_btr70_msv",		1500, "BTR-70 Camo 2", {"rhsafrf\addons\rhs_btr70_camo\data\btr70_tri2_1_co.paa","rhsafrf\addons\rhs_btr70_camo\data\btr70_tri2_2_co.paa"};}
		};
	};
};
class CfgVehicleTransport 
{
	class Exile_Container_SupplyBox
	{
		vehicles[] = {"Exile_Car_Van_Abstract", "Exile_Car_Offroad_Abstract", "Exile_Car_Zamak_Abstract", "Exile_Car_HEMMT_Abstract", "Exile_Car_Tempest_Abstract"};

		class Exile_Car_Van_Abstract
		{
			attachPosition[] = {0, -1.1, 0.2};
			cargoIndizes[] = {2, 3, 4, 5, 6, 7}; 
			detachPosition[] = {0, -4.4};
		};

		class Exile_Car_Offroad_Abstract
		{
			attachPosition[] = {0, -1.6, 0.4};
			cargoIndizes[] = {1, 2, 3, 4}; 
			detachPosition[] = {0, -4};
		};

		class Exile_Car_Zamak_Abstract
		{
			attachPosition[] = {0.03, 0.3, 0};
			cargoIndizes[] = {2, 3, 4, 5, 6, 7}; 
			detachPosition[] = {0.03, -4.8};
		};

		class Exile_Car_HEMMT_Abstract
		{
			attachPosition[] = {0.05, -0.1, 0.3};
			cargoIndizes[] = {1, 2, 8, 9}; 
			detachPosition[] = {0.05, -6.1};
		};

		class Exile_Car_Tempest_Abstract
		{
			attachPosition[] = {0.08, -0.85, 0.4};
			cargoIndizes[] = {1, 6, 7, 9}; 
			detachPosition[] = {0.08, -6};
		};
	};
};