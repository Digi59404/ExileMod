
uiSleep 2;
_respect = ExileClientPlayerScore;
switch (true) do 
{
    case (_respect > 2500 && _respect < 4999):
    {
    _rank = "Scavenger";  
     [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,5000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "CUP_U_I_GUE_Anorak_03";
	player addVest "V_Rangemaster_belt";
	player addBackpack "CUP_B_SLA_Medicbag";
	player addHeadgear "H_Bandanna_sgg";
	player addItem "Exile_Item_Matches";
    player addItem "Exile_Item_ExtensionCord";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_CanOpener";
	//  "Your rank is Scavenger";
    };
     
    case (_respect > 4999 && _respect < 49999):
   {
   call ExileClient_object_player_bambiStateEnd;
    _rank = "Pickpocket";     
   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,50000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "U_I_C_Soldier_Bandit_3_F";
	player addWeapon "hgun_P07_F";
	player addVest "V_BandollierB_rgr";
	for "_i" from 1 to 2 do {this addItemToVest "16Rnd_9x21_Mag";};
	player addBackpack "B_AssaultPack_rgr";
	player addHeadgear "H_Cap_blk";
	player addItem "Exile_Item_Matches";
    player addItem "Exile_Item_ExtensionCord";
    player addItem "Exile_Item_ChristmasTinner";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_CanOpener";
	//    "Your rank is Pickpocket";
    };
   
    case (_respect > 49999 && _respect < 99999):
   {
    _rank = "Thief";
    call ExileClient_object_player_bambiStateEnd;
   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,100000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "U_I_G_Story_Protagonist_F";
	player addVest "V_BandollierB_blk";
	for "_i" from 1 to 3 do {this addItemToVest "11Rnd_45ACP_Mag";};
	player addBackpack "B_AssaultPack_blk";
	player addHeadgear "H_Watchcap_blk";
	player addWeapon "hgun_Pistol_heavy_01_F";
	player addHandgunItem "muzzle_snds_acp";
	player addHandgunItem "optic_MRD";
	player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addItem "Exile_Item_ExtensionCord";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_Vishpirin";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
   //   "Your rank is Thief";
   };
   
    case (_respect > 99999 && _respect < 149999):
   {
    _rank = "Gangster";  
    call ExileClient_object_player_bambiStateEnd;
   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,150000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "U_BG_Guerilla2_3";
    player addVest "V_BandollierB_rgr";
    player addBackpack "B_FieldPack_oli";
	for "_i" from 1 to 2 do {player addItemToBackpack "Exile_Magazine_8Rnd_74Slug";};
    for "_i" from 1 to 2 do {player addItemToBackpack "Exile_Magazine_8Rnd_74Pellets";};
	player addHeadgear "CUP_H_PMC_Cap_Grey";
	player addGoggles "G_Bandanna_oli";
	player addWeaponGlobal "Exile_Weapon_M1014";
    player addItem "Exile_Item_Matches";
    player linkItem "ItemGPS";
    player addItem "Exile_Item_ExtensionCord";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //  "Your rank is Gangster";
   };
   
    case (_respect > 149999 && _respect < 249999):
   {
   _rank = "Hitman";
   call ExileClient_object_player_bambiStateEnd;
   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,250000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
    player forceAddUniform "TRYK_U_B_PCUGs_BLK";
    player addVest "TRYK_V_harnes_blk_L";
    player addBackpack "B_FieldPack_blk";
    player addHeadgear "TRYK_H_woolhat";
	for "_i" from 1 to 3 do {player addItemToBackpack "hlc_30Rnd_9x19_GD_MP5";};
	player addWeaponGlobal "hlc_smg_mp5sd5";
	player addPrimaryWeaponItem "optic_Aco_smg";
    player addItem "Exile_Item_Matches";
    player addItem "Exile_Item_ExtensionCord";
    player addItem "Exile_Item_BBQSandwich";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    player addItem "Exile_Item_InstaDoc";
    player addItem "Exile_Item_CanOpener";
    player addItem "Exile_Item_PlasticBottleFreshWater";
    //   "Your rank is Hitman";
   };
   
    case (_respect > 249999 && _respect < 349999):
   {
    _rank = "Bounty Hunter";  
  call ExileClient_object_player_bambiStateEnd;
    [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,350000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    //  "Your rank is Bounty Hunter";
   };
   
    case (_respect > 349999 && _respect < 449999):
   {
    _rank = "Mercenary";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,450000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    //   "Your rank is Mercenary";
   };
   
    case (_respect > 449999 && _respect < 599999):
   {
    _rank = "Assassin";  
  call ExileClient_object_player_bambiStateEnd;
     [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,600000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    //  "Your rank is Assassin"
   };
   
     case (_respect > 599999 && _respect < 799999):
   {
    _rank = "Terrorist";  
	call ExileClient_object_player_bambiStateEnd;
		[parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,800000-_respect],0,0,10,0] spawn bis_fnc_dynamictext;

    //   "Your rank is Terrorist";
   };
   
       case (_respect > 800000):
   {
    _rank = "Warlord";
    call ExileClient_object_player_bambiStateEnd;  
   [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t>",_rank],0,0,10,0] spawn bis_fnc_dynamictext;

   //    "Your rank is Warlord";
   };
   
    default
    {   
    //  "Your rank is Inmate";
    _rank = "Inmate";  
     [parseText format["<br/><br/><br/><t size='0.6'font='OrbitronLight'>Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn %2 more respect for the next rank!</t>",_rank,2500-_respect],0,0,10,0] spawn bis_fnc_dynamictext;
	 player linkItem "ItemMap";
    };
};
