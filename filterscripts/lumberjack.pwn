//Lumberjack v2 script by !Pumpkin



#include <a_samp>

#define COLOR_GREY 0xAFAFAFAA

new Text:Textdraw0;
new Text:Textdraw1;
new Text:Textdraw2;
new Text:Textdraw3;

new tree;
new tree1;
new tree2;
new tree3;
new tree4;
new tree5;
new tree6;
new tree7;
new tree8;

new saw;
new saw1;
new saw2;

new splittree;
new splittree1;
new splittree2;
new splittree3;
new splittree4;
new splittree5;
new splittree6;
new splittree7;
new splittree8;

forward rebuildtime(playerid);
forward rebuildtime1(playerid);
forward rebuildtime2(playerid);
forward rebuildtime3(playerid);
forward rebuildtime4(playerid);
forward rebuildtime5(playerid);
forward rebuildtime6(playerid);
forward rebuildtime7(playerid);
forward rebuildtime8(playerid);

forward sawspawn(playerid);
forward sawspawn1(playerid);
forward sawspawn2(playerid);

forward HideTextdraw0(playerid);
forward HideTextdraw3(playerid);

forward removetree(playerid ,objectid);
forward removetree1(playerid);
forward removetree2(playerid);
forward removetree3(playerid);
forward removetree4(playerid);
forward removetree5(playerid);
forward removetree6(playerid);
forward removetree7(playerid);
forward removetree8(playerid);

forward doublecut(playerid);
forward doublecut1(playerid);
forward doublecut2(playerid);
forward doublecut3(playerid);
forward doublecut4(playerid);
forward doublecut5(playerid);
forward doublecut6(playerid);
forward doublecut7(playerid);
forward doublecut8(playerid);

forward treemove(playerid);
forward treemove1(playerid);
forward treemove2(playerid);
forward treemove3(playerid);
forward treemove4(playerid);
forward treemove5(playerid);
forward treemove6(playerid);
forward treemove7(playerid);
forward treemove8(playerid);

public OnFilterScriptInit()
{
	Create3DTextLabel("Su dung /chatgo tai cay gan do de chat no xuong", 0x008080FF, -1207.8995,-1387.3682,118.8217, 40.0, 0, 0);
	Create3DTextLabel("Su dung /dungcu o day de thay doi thanh thiet bi an toan", 0x008080FF, -1166.2971,-1402.2649,126.2859, 40.0, 0, 0);
	Create3DTextLabel("Su dung /nhatcua to pickup chainsaw", 0x008080FF, -1168.5690,-1406.7262,126.2859, 40.0, 0, 0);
	tree = CreateObject(654,-1238.8000000,-1378.5000000,117.8000000,0.0000000,0.0000000,0.0000000); //object(pinetree08) (1)
	tree1 = CreateObject(654,-1238.8000000,-1386.7000000,116.3000000,0.0000000,0.0000000,0.0000000); //object(pinetree08) (2)
	tree2 = CreateObject(654,-1235.8000000,-1394.3000000,114.6000000,0.0000000,0.0000000,0.0000000); //object(pinetree08) (3)
	tree3 = CreateObject(654,-1229.6000000,-1388.7000000,113.8000000,0.0000000,0.0000000,0.0000000); //object(pinetree08) (4)
	tree4 = CreateObject(654,-1232.5000000,-1377.9000000,114.8000000,0.0000000,0.0000000,0.0000000); //object(pinetree08) (5)
	tree5 = CreateObject(654,-1220.1000000,-1377.5000000,116.1000000,0.0000000,0.0000000,0.0000000); //object(pinetree08) (6)
	tree6 = CreateObject(654,-1216.1000000,-1386.7000000,115.6000000,0.0000000,0.0000000,0.0000000); //object(pinetree08) (7)
	tree7 = CreateObject(654,-1210.6000000,-1394.3000000,115.6000000,0.0000000,0.0000000,0.0000000); //object(pinetree08) (8)
	tree8 = CreateObject(654,-1222.2000000,-1393.5000000,115.1000000,0.0000000,0.0000000,0.0000000); //object(pinetree08) (9)
	CreateObject(18259,-1169.7000000,-1400.6000000,125.2000000,0.0000000,0.0000000,0.0000000); //object(logcabinn01) (1)
	CreateObject(2991,-1167.1000000,-1408.4000000,125.7000000,0.0000000,0.0000000,0.0000000); //object(imy_bbox) (1)
	CreateObject(2200,-1165.0000000,-1401.6000000,125.3000000,0.0000000,0.0000000,272.0000000); //object(med_office5_unit_1) (1)
	CreateObject(3785,-1169.8000000,-1399.5000000,128.3999900,359.8610000,91.9950000,6.0020000); //object(bulkheadlight) (1)
	saw = CreateObject(341,-1168.7000000,-1407.7000000,126.6000000,0.0000000,0.0000000,0.0000000); //object(1)
	saw1 = CreateObject(341, -1167.7, -1407.5, 126.6, 0, 0, 0);
	saw2 = CreateObject(341, -1166.4, -1407.5, 126.6, 0, 0, 0);

	Textdraw0 = TextDrawCreate(386.000000,370.000000,"Dang cua....");
	Textdraw1 = TextDrawCreate(432.000000,373.000000,"Hoan thanh!");
	TextDrawAlignment(Textdraw0,0);
	TextDrawAlignment(Textdraw1,0);
	TextDrawBackgroundColor(Textdraw0,0x000000ff);
	TextDrawBackgroundColor(Textdraw1,0x000000ff);
	TextDrawFont(Textdraw0,0);
	TextDrawLetterSize(Textdraw0,1.000000,5.399999);
	TextDrawFont(Textdraw1,3);
	TextDrawLetterSize(Textdraw1,1.000000,6.000000);
	TextDrawColor(Textdraw0,0xff0000ff);
	TextDrawColor(Textdraw1,0x00ff00ff);
	TextDrawSetOutline(Textdraw0,1);
	TextDrawSetOutline(Textdraw1,1);
	TextDrawSetProportional(Textdraw0,1);
	TextDrawSetProportional(Textdraw1,1);
	TextDrawSetShadow(Textdraw0,1);
	TextDrawSetShadow(Textdraw1,1);

	Textdraw2 = TextDrawCreate(371.000000,401.000000,"Dang tach....");
	Textdraw3 = TextDrawCreate(461.000000,371.000000,"Hoan thanh");
	TextDrawAlignment(Textdraw2,0);
	TextDrawAlignment(Textdraw3,0);
	TextDrawBackgroundColor(Textdraw2,0x000000ff);
	TextDrawBackgroundColor(Textdraw3,0x000000ff);
	TextDrawFont(Textdraw2,0);
	TextDrawLetterSize(Textdraw2,1.000000,4.000000);
	TextDrawFont(Textdraw3,3);
	TextDrawLetterSize(Textdraw3,1.000000,5.000000);
	TextDrawColor(Textdraw2,0xffff00cc);
	TextDrawColor(Textdraw3,0x00ff00ff);
	TextDrawSetOutline(Textdraw2,1);
	TextDrawSetOutline(Textdraw3,1);
	TextDrawSetProportional(Textdraw2,1);
	TextDrawSetProportional(Textdraw3,1);
	TextDrawSetShadow(Textdraw2,1);
	TextDrawSetShadow(Textdraw3,1);
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new index, cmd[20];
	cmd = strtok(cmdtext, index);

	if(!strcmp(cmdtext, "/gotochatgo"))
     {
        SetPlayerPos(playerid, -1168.5632,-1407.0413,126.2859);
        return 1;
     }


 	if(strcmp(cmd, "/nhatcua", true) == 0)
	{
	if(IsPlayerNearObject(playerid,saw, 0.8))
  	{
	if(GetPlayerSkin(playerid) == 260)
  	{
  	SendClientMessage(playerid, 0x9EC73DAA, "Ban da nhat mot cay cua");
   	//ApplyAnimation(playerid,"BAR","Barserve_order",4.0,1,0,0,1,0);
  	GivePlayerWeapon(playerid, 9, 1);
	RemoveBuildingForPlayer(playerid, 341,-1168.7000000,-1407.7000000,126.6000000, 0.0);
 	SetTimer("sawspawn", 3500, false);
  	}
	}
	if(IsPlayerNearObject(playerid,saw1, 0.8))
  	{
	if(GetPlayerSkin(playerid) == 260)
  	{
  	SendClientMessage(playerid, 0x9EC73DAA, "Ban da nhat mot cay cua");
   	//ApplyAnimation(playerid,"BAR","Barserve_order",4.0,1,0,0,1,0);
	RemoveBuildingForPlayer(playerid, 341,-1167.7, -1407.5, 126.6, 0.0);
  	GivePlayerWeapon(playerid, 9, 1);
  	SetTimer("sawspawn1", 35000, false);
  	}
  	}
	if(IsPlayerNearObject(playerid,saw2, 0.8))
  	{
	if(GetPlayerSkin(playerid) == 260)
  	{
  	SendClientMessage(playerid, 0x9EC73DAA, "Ban da nhat mot cay cua");
   	//ApplyAnimation(playerid,"BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,0);
  	GivePlayerWeapon(playerid, 9, 1);
	RemoveBuildingForPlayer(playerid, 341,-1166.4, -1407.5, 126.6, 0.0);
	SetTimer("sawspawn2", 35000, false);
  	}
  	}
   	else if(GetPlayerSkin(playerid) == 0)
	{
   	SendClientMessage(playerid, 0xAA3333AA, "Ban can mac do an toan truoc khi lam viec voi cua.");
   	SendClientMessage(playerid, 0xAA3333AA, "Ban cung can phai o gan mot cai cua co the chon.");
 }
	return 1;
	}

 	if(strcmp(cmdtext, "/dungcu", true) == 0)
    {
   	if(IsPlayerInRangeOfPoint(playerid, 2,-1165.0000000,-1401.6000000,125.3000000))
  	{
  	 	//ApplyAnimation(playerid,"CLOTHES","CLO_Pose_Out",4.1,1,0,1,1,0);
        // Set the player's skin to ID 277, which is a fireman.
        SetPlayerSkin(playerid, 260);
   		}
	else
	{
   	SendClientMessage(playerid, 0xAA3333AA, "Ban khong the thay doi trang phuc an toan o day.");
	}
	return 1;
	}

 	if(strcmp(cmd, "/tachgo", true) == 0)
	{
	if(GetPlayerWeapon(playerid) == 9)
    {
	if(IsPlayerNearObject(playerid,splittree, 3.0))
  	{
	TogglePlayerControllable(playerid,0);
	TextDrawShowForPlayer(playerid, Textdraw2);
	SetTimer("doublecut", 15000, false);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
	}
	if(IsPlayerNearObject(playerid,splittree1, 3.0))
  	{
	TogglePlayerControllable(playerid,0);
	TextDrawShowForPlayer(playerid, Textdraw2);
	SetTimer("doublecut1", 15000, false);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
	}
	if(IsPlayerNearObject(playerid,splittree2, 3.0))
  	{
	TogglePlayerControllable(playerid,0);
	TextDrawShowForPlayer(playerid, Textdraw2);
	SetTimer("doublecut2", 15000, false);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
	}
	if(IsPlayerNearObject(playerid,splittree3, 3.0))
  	{
	TogglePlayerControllable(playerid,0);
	TextDrawShowForPlayer(playerid, Textdraw2);
	SetTimer("doublecut3", 15000, false);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
	}
	if(IsPlayerNearObject(playerid,splittree4, 3.0))
  	{
	TogglePlayerControllable(playerid,0);
	TextDrawShowForPlayer(playerid, Textdraw2);
	SetTimer("doublecut4", 15000, false);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
	}
	if(IsPlayerNearObject(playerid,splittree5, 3.0))
  	{
	TogglePlayerControllable(playerid,0);
	TextDrawShowForPlayer(playerid, Textdraw2);
	SetTimer("doublecut5", 15000, false);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
	}
	if(IsPlayerNearObject(playerid,splittree6, 3.0))
  	{
	TogglePlayerControllable(playerid,0);
	TextDrawShowForPlayer(playerid, Textdraw2);
	SetTimer("doublecut6", 15000, false);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
	}
	if(IsPlayerNearObject(playerid,splittree7, 3.0))
  	{
	TogglePlayerControllable(playerid,0);
	TextDrawShowForPlayer(playerid, Textdraw2);
	SetTimer("doublecut7", 15000, false);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
	}
	if(IsPlayerNearObject(playerid,splittree8, 3.0))
  	{
	TogglePlayerControllable(playerid,0);
	TextDrawShowForPlayer(playerid, Textdraw2);
	SetTimer("doublecut8", 15000, false);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
	}
	return 1;
	}
	else if(GetPlayerWeapon(playerid) >= 0)
	{
   	SendClientMessage(playerid, 0xAA3333AA, "Ban ca mot cay cua cho cai nay!");
	}
	return 1;
	}

 	if(strcmp(cmd, "/chatgo", true) == 0)
	{
	if(GetPlayerWeapon(playerid) == 9)
    {
	if(IsPlayerNearObject(playerid,tree, 3.0))
  	{
	TextDrawShowForPlayer(playerid, Textdraw0);
	TogglePlayerControllable(playerid,0);
 	SetTimer("rebuildtime", 150000, false);
 	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
 	SetTimer("removetree", 35000, false);
 	SetTimer("treemove", 32500, false);
	/*RemoveBuildingForPlayer(playerid, 654,-1238.8000000,-1378.5000000,117.8000000, 0.0);
	CreateObject(831,-1238.8000000,-1378.5000000,117.8000000,0.0000000,0.0000000,0.0000000);*/
	}
	if(IsPlayerNearObject(playerid,tree1, 3.0))
  	{
	TogglePlayerControllable(playerid,0);
	TextDrawShowForPlayer(playerid, Textdraw0);
	SetTimer("rebuildtime1", 150000, false);
	////GameTextForPlayer(playerid, " ~r~ Cuting....please wait", 500, 2);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
 	SetTimer("removetree1", 35000, false);
	SetTimer("treemove1", 32500, false);
	/*RemoveBuildingForPlayer(playerid, 654,-1238.8000000,-1386.7000000,116.30000000, 0.0);
	CreateObject(831,-1238.8000000,-1386.7000000,116.3000000,0.0000000,0.0000000,0.0000000);*/
	}
	if(IsPlayerNearObject(playerid,tree2, 3.0))
  	{
  	TogglePlayerControllable(playerid,0);
  	TextDrawShowForPlayer(playerid, Textdraw0);
	SetTimer("rebuildtime2", 150000, false);
	//GameTextForPlayer(playerid, " ~r~ Cuting....please wait", 500, 2);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
 	SetTimer("removetree2", 35000, false);
	SetTimer("treemove2", 32500, false);
	/*RemoveBuildingForPlayer(playerid, 654,-1235.8000000,-1394.3000000,114.6000000, 0.0);
	CreateObject(831,-1235.8000000,-1394.3000000,114.6000000,0.0000000,0.0000000,0.0000000);*/
	}
	if(IsPlayerNearObject(playerid,tree3, 3.0))
  	{
  	TogglePlayerControllable(playerid,0);
  	TextDrawShowForPlayer(playerid, Textdraw0);
	SetTimer("rebuildtime3", 150000, false);
	//GameTextForPlayer(playerid, " ~r~ Cuting....please wait", 500, 2);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
 	SetTimer("removetree3", 35000, false);
 	SetTimer("treemove3", 32500, false);
	/*RemoveBuildingForPlayer(playerid, 654,-1229.6000000,-1388.7000000,113.8000000, 0.0);
	CreateObject(831,-1229.6000000,-1388.7000000,113.8000000,0.0000000,0.0000000,0.0000000);*/
	}
	if(IsPlayerNearObject(playerid,tree4, 3.0))
  	{
  	TogglePlayerControllable(playerid,0);
  	TextDrawShowForPlayer(playerid, Textdraw0);
	SetTimer("rebuildtime4", 150000, false);
	//GameTextForPlayer(playerid, " ~r~ Cuting....please wait", 500, 2);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
 	SetTimer("removetree4", 35000, false);
 	SetTimer("treemove4", 32500, false);
	/*RemoveBuildingForPlayer(playerid, 654,-1232.5000000,-1377.9000000,114.8000000, 0.0);
	CreateObject(831,-1232.5000000,-1377.9000000,114.8000000,0.0000000,0.0000000,0.0000000);*/
	}
	if(IsPlayerNearObject(playerid,tree5, 3.0))
  	{
  	TogglePlayerControllable(playerid,0);
  	TextDrawShowForPlayer(playerid, Textdraw0);
	SetTimer("rebuildtime5", 150000, false);
	//GameTextForPlayer(playerid, " ~r~ Cuting....please wait", 500, 2);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
 	SetTimer("removetree5", 35000, false);
 	SetTimer("treemove5", 32500, false);
	/*RemoveBuildingForPlayer(playerid, 654,-1220.1000000,-1377.5000000,116.1000000, 0.0);
	CreateObject(831,-1220.1000000,-1377.5000000,116.1000000,0.0000000,0.0000000,0.0000000);*/
	}
	if(IsPlayerNearObject(playerid,tree6, 3.0))
  	{
  	TogglePlayerControllable(playerid,0);
  	TextDrawShowForPlayer(playerid, Textdraw0);
	SetTimer("rebuildtime6", 150000, false);
	//GameTextForPlayer(playerid, " ~r~ Cuting....please wait", 500, 2);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
 	SetTimer("removetree6", 35000, false);
 	SetTimer("treemove6", 32500, false);
	/*RemoveBuildingForPlayer(playerid, 654,-1216.1000000,-1386.7000000,115.6000000, 0.0);
	CreateObject(831,-1216.1000000,-1386.7000000,115.6000000,0.0000000,0.0000000,0.0000000);*/
	}
	if(IsPlayerNearObject(playerid,tree7, 3.0))
  	{
  	TogglePlayerControllable(playerid,0);
  	TextDrawShowForPlayer(playerid, Textdraw0);
	SetTimer("rebuildtime7", 150000, false);
	//GameTextForPlayer(playerid, " ~r~ Cuting....please wait", 500, 2);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
 	SetTimer("removetree7", 35000, false);
 	SetTimer("treemove7", 32500, false);
/*	RemoveBuildingForPlayer(playerid, 654,-1210.6000000,-1394.3000000,115.6000000, 0.0);
	CreateObject(831,-1210.6000000,-1394.3000000,115.6000000,0.0000000,0.0000000,0.0000000);*/
	}
	if(IsPlayerNearObject(playerid,tree8, 3.0))
  	{
  	TogglePlayerControllable(playerid,0);
  	TextDrawShowForPlayer(playerid, Textdraw0);
	SetTimer("rebuildtime8", 150000, false);
	//GameTextForPlayer(playerid, " ~r~ Cuting....please wait", 500, 2);
	ApplyAnimation(playerid,"CHAINSAW","CSAW_G",4.1,1,0,1,1,0);
 	SetTimer("removetree8", 35000, false);
 	SetTimer("treemove8", 32500, false);
/*	RemoveBuildingForPlayer(playerid, 654,-1222.2000000,-1393.5000000,115.1000000, 0.0);
	CreateObject(831,-1222.2000000,-1393.5000000,115.1000000,0.0000000,0.0000000,0.0000000);*/
	}
	return 1;
	}
	else if(GetPlayerWeapon(playerid) >= 0)
	{
   	SendClientMessage(playerid, 0xAA3333AA, "Ban can co mot cay cua cho cai nay!");
	}
	return 1;
	}
	return 0;
}


public rebuildtime(playerid)
{
	CreateObject(654,-1238.8000000,-1378.5000000,117.8000000,0.0000000,0.0000000,0.0000000);
	RemoveBuildingForPlayer(playerid, 831,-1238.8000000,-1378.5000000,117.8000000, 0.0);
}

public rebuildtime1(playerid)
{
	CreateObject(654,-1238.8000000,-1386.7000000,116.3000000,0.0000000,0.0000000,0.0000000);
	RemoveBuildingForPlayer(playerid, 831,-1238.8000000,-1386.7000000,116.3000000, 0.0);
}

public rebuildtime2(playerid)
{
	CreateObject(654,-1235.8000000,-1394.3000000,114.6000000,0.0000000,0.0000000,0.0000000);
	RemoveBuildingForPlayer(playerid, 831,-1235.8000000,-1394.3000000,114.6000000, 0.0);
}

public rebuildtime3(playerid)
{
	CreateObject(654,-1229.6000000,-1388.7000000,113.8000000,0.0000000,0.0000000,0.0000000);
	RemoveBuildingForPlayer(playerid, 831,-1229.6000000,-1388.7000000,113.8000000, 0.0);
}

public rebuildtime4(playerid)
{
	CreateObject(654,-1232.5000000,-1377.9000000,114.8000000,0.0000000,0.0000000,0.0000000);
	RemoveBuildingForPlayer(playerid, 831,-1232.5000000,-1377.9000000,114.8000000, 0.0);
}

public rebuildtime5(playerid)
{
	CreateObject(654,-1220.1000000,-1377.5000000,116.1000000,0.0000000,0.0000000,0.0000000);
	RemoveBuildingForPlayer(playerid, 831,-1220.1000000,-1377.5000000,116.1000000, 0.0);
}

public rebuildtime6(playerid)
{
	RemoveBuildingForPlayer(playerid, 654,-1216.1000000,-1386.7000000,115.6000000, 0.0);
	CreateObject(831,-1216.1000000,-1386.7000000,115.6000000,0.0000000,0.0000000,0.0000000);
}

public rebuildtime7(playerid)
{
	CreateObject(654,-1210.6000000,-1394.3000000,115.6000000,0.0000000,0.0000000,0.0000000);
	RemoveBuildingForPlayer(playerid, 831,-1210.6000000,-1394.3000000,115.6000000, 0.0);
}

public rebuildtime8(playerid)
{
	CreateObject(654,-1222.2000000,-1393.5000000,115.1000000,0.0000000,0.0000000,0.0000000);
	RemoveBuildingForPlayer(playerid, 831,-1222.2000000,-1393.5000000,115.1000000, 0.0);
}

public removetree(playerid ,objectid)
{
	TogglePlayerControllable(playerid,1);
	SetTimer("HideTextdraw0", 3500, false);
	TextDrawHideForPlayer(playerid, Textdraw0);
    ClearAnimations(playerid);
    GivePlayerMoney(playerid, 100);
    DestroyObject(tree);
    SendClientMessage(playerid, 0x00FF00FF, "Da nhan 100$.");
   	SendClientMessage(playerid, 0xDABB3EAA, "TIP:Su dung /tachgo ke ben cay nga.");
	RemoveBuildingForPlayer(playerid, 654,-1238.7998, -1378.5, 117.8, 0.0);
	splittree = CreateObject(684, -1242.6, -1381.8, 117.8, 5.967, 6.033, 325.371);
	CreateObject(831,-1238.8000000,-1378.5000000,117.8000000,0.0000000,0.0000000,0.0000000);
}

public sawspawn(playerid)
{
saw = CreateObject(341,-1168.7000000,-1407.7000000,126.6000000,0.0000000,0.0000000,0.0000000); //object(1)
}

public sawspawn1(playerid)
{
saw1 = CreateObject(341, -1167.7, -1407.5, 126.6, 0, 0, 0);

}

public sawspawn2(playerid)
{
saw2 = CreateObject(341, -1166.4, -1407.5, 126.6, 0, 0, 0);
}

public removetree1(playerid)
{
	TogglePlayerControllable(playerid,1);
	TextDrawHideForPlayer(playerid, Textdraw0);
	TextDrawShowForPlayer(playerid, Textdraw1);
	SetTimer("HideTextdraw0", 3500, false);
    ClearAnimations(playerid);
    DestroyObject(tree1);
    GivePlayerMoney(playerid, 100);
    SendClientMessage(playerid, 0x00FF00FF, "Da nhan 100$.");
   	SendClientMessage(playerid, 0xDABB3EAA, "TIP:Su dung /tachgo ke ben cay nga.");
	RemoveBuildingForPlayer(playerid, 654,-1238.7998, -1386.7002, 116.3, 0.0);
	splittree1 = CreateObject(684, -1243.2, -1392.6, 116.1, 5.966, 6.031, 325.366);
	CreateObject(831,-1238.8000000,-1386.7000000,116.3000000,0.0000000,0.0000000,0.0000000);
}

public removetree2(playerid)
{
	TogglePlayerControllable(playerid,1);
	TextDrawHideForPlayer(playerid, Textdraw0);
	TextDrawShowForPlayer(playerid, Textdraw1);
	SetTimer("HideTextdraw0", 3500, false);
    ClearAnimations(playerid);
    DestroyObject(tree2);
    GivePlayerMoney(playerid, 100);
    SendClientMessage(playerid, 0x00FF00FF, "Da nhan 100$.");
   	SendClientMessage(playerid, 0xDABB3EAA, "TIP:Su dung /tachgo ke ben cay nga.");
	RemoveBuildingForPlayer(playerid, 654,-1235.7998, -1394.2998, 114.6, 0.0);
	splittree2 = CreateObject(684, -1239.6, -1397.7, 115.1, 5.966, 6.031, 325.366);
	CreateObject(831,-1235.8000000,-1394.3000000,114.6000000,0.0000000,0.0000000,0.0000000);
}

public removetree3(playerid)
{
	TogglePlayerControllable(playerid,1);
	TextDrawHideForPlayer(playerid, Textdraw0);
	TextDrawShowForPlayer(playerid, Textdraw1);
	SetTimer("HideTextdraw0", 3500, false);
    ClearAnimations(playerid);
    DestroyObject(tree3);
    GivePlayerMoney(playerid, 100);
    SendClientMessage(playerid, 0x00FF00FF, "Da nhan 100$.");
   	SendClientMessage(playerid, 0xDABB3EAA, "TIP:Su dung /tachgo ke ben cay nga.");
	RemoveBuildingForPlayer(playerid, 654,-1229.5996, -1388.7002, 113.8, 0.0);
	splittree3 = CreateObject(684, -1227.5, -1393, 116.3, 5.94, 8.042, 31.157);
	CreateObject(831,-1229.6000000,-1388.7000000,113.8000000,0.0000000,0.0000000,0.0000000);
}

public removetree4(playerid)
{
	TogglePlayerControllable(playerid,1);
	TextDrawHideForPlayer(playerid, Textdraw0);
	TextDrawShowForPlayer(playerid, Textdraw1);
	SetTimer("HideTextdraw0", 3500, false);
    ClearAnimations(playerid);
    DestroyObject(tree4);
    GivePlayerMoney(playerid, 100);
    SendClientMessage(playerid, 0x00FF00FF, "Da nhan 100$.");
   	SendClientMessage(playerid, 0xDABB3EAA, "TIP:Su dung /tachgo ke ben cay nga.");
	RemoveBuildingForPlayer(playerid, 654,-1232.5, -1377.9004, 114.8, 0.0);
	splittree4 = CreateObject(684, -1219.8, -1399.4, 115.6, 5.938, 8.042, 31.152);
	CreateObject(831,1232.5000000,-1377.9000000,114.8000000,0.0000000,0.0000000,0.0000000);
}

public removetree5(playerid)
{
	TogglePlayerControllable(playerid,1);
	TextDrawHideForPlayer(playerid, Textdraw0);
	TextDrawShowForPlayer(playerid, Textdraw1);
	SetTimer("HideTextdraw0", 3500, false);
    ClearAnimations(playerid);
    DestroyObject(tree5);
    GivePlayerMoney(playerid, 100);
    SendClientMessage(playerid, 0x00FF00FF, "Da nhan 100$.");
    SendClientMessage(playerid, 0xDABB3EAA, "TIP:Su dung /tachgo ke ben cay nga.");
 	RemoveBuildingForPlayer(playerid, 654,-1220.0996, -1377.5, 116.1, 0.0);
	splittree5 = CreateObject(684,-1211.2000000,-1397.6000000,116.6000000,359.9970000,1.9990000,31.9890000); //object(sm_fir_log02) (6)
	CreateObject(831,-1220.1000000,-1377.5000000,116.1000000,0.0000000,0.0000000,0.0000000);
}

public removetree6(playerid)
{
	TogglePlayerControllable(playerid,1);
	TextDrawHideForPlayer(playerid, Textdraw0);
	TextDrawShowForPlayer(playerid, Textdraw1);
	SetTimer("HideTextdraw0", 3500, false);
    ClearAnimations(playerid);
    DestroyObject(tree6);
    GivePlayerMoney(playerid, 100);
    SendClientMessage(playerid, 0x00FF00FF, "Da nhan 100$.");
	SendClientMessage(playerid, 0xDABB3EAA, "TTIP:Su dung /tachgo ke ben cay nga.");
	RemoveBuildingForPlayer(playerid, 654,-1216.0996, -1386.7002, 115.6, 0.0);
	splittree6 = CreateObject(684, -1216.8, -1375.6, 120.2, 15.996, 0, 299.998);
	CreateObject(831,-1216.1000000,-1386.7000000,115.6000000,0.0000000,0.0000000,0.0000000);
}

public removetree7(playerid)
{
	TogglePlayerControllable(playerid,1);
	TextDrawHideForPlayer(playerid, Textdraw0);
	TextDrawShowForPlayer(playerid, Textdraw1);
	SetTimer("HideTextdraw0", 3500, false);
    ClearAnimations(playerid);
    DestroyObject(tree7);
    GivePlayerMoney(playerid, 100);
    SendClientMessage(playerid, 0x00FF00FF, "Da nhan 100$.");
   	SendClientMessage(playerid, 0xDABB3EAA, "TTIP:Su dung /tachgo ke ben cay nga.");
	RemoveBuildingForPlayer(playerid, 654,-1210.5996, -1394.2998, 115.6, 0.0);
	splittree7 = CreateObject(684, -1206.7998, -1392.7002, 118.3, 15.996, 0, 299.998); // ÕIGE!!!
	CreateObject(831,-1210.6000000,-1394.3000000,115.6000000,0.0000000,0.0000000,0.0000000);
}

public removetree8(playerid)
{
	TogglePlayerControllable(playerid,1);
	TextDrawHideForPlayer(playerid, Textdraw0);
	TextDrawShowForPlayer(playerid, Textdraw1);
	SetTimer("HideTextdraw0", 3500, false);
    ClearAnimations(playerid);
    DestroyObject(tree8);
    GivePlayerMoney(playerid, 100);
    SendClientMessage(playerid, 0x00FF00FF, "Da nhan 100$.");
   	SendClientMessage(playerid, 0xDABB3EAA, "TTIP:Su dung /tachgo ke ben cay nga.");
	RemoveBuildingForPlayer(playerid, 654,-1222.2002, -1393.5, 115.1, 0.0);
	splittree8 = CreateObject(684, -1212.2002, -1385, 118.1, 15.991, 0, 299.993);
	CreateObject(831,-1222.2000000,-1393.5000000,115.1000000,0.0000000,0.0000000,0.0000000);
}

public doublecut(playerid)
{
	TogglePlayerControllable(playerid,1);
	TextDrawHideForPlayer(playerid, Textdraw2);
	TextDrawShowForPlayer(playerid, Textdraw3);
	SetTimer("HideTextdraw3", 3500, false);
    ClearAnimations(playerid);
    GivePlayerMoney(playerid, 75);
    SendClientMessage(playerid, 0x00FF00FF, "Da nhan 75$.");
	RemoveBuildingForPlayer(playerid, 684,-1242.6000000,-1381.8000000,117.8000000, 0.0);
}

public doublecut1(playerid)
{
	TogglePlayerControllable(playerid,1);
	TextDrawHideForPlayer(playerid, Textdraw2);
	TextDrawShowForPlayer(playerid, Textdraw3);
	SetTimer("HideTextdraw3", 3500, false);
    ClearAnimations(playerid);
    GivePlayerMoney(playerid, 75);
    SendClientMessage(playerid, 0x00FF00FF, "Da nhan 75$.");
	RemoveBuildingForPlayer(playerid, 684,-1243.2000000,-1392.6000000,116.1000000, 0.0);
}

public doublecut2(playerid)
{
	TogglePlayerControllable(playerid,1);
	SetTimer("HideTextdraw3", 3500, false);
	TextDrawHideForPlayer(playerid, Textdraw2);
	TextDrawShowForPlayer(playerid, Textdraw3);
    ClearAnimations(playerid);
    GivePlayerMoney(playerid, 75);
    SendClientMessage(playerid, 0x00FF00FF, "Da nhan 75$.");
	RemoveBuildingForPlayer(playerid, 684,-1239.6000000,-1397.7000000,115.1000000, 0.0);
}

public doublecut3(playerid)
{
	TogglePlayerControllable(playerid,1);
	SetTimer("HideTextdraw3", 3500, false);
	TextDrawHideForPlayer(playerid, Textdraw2);
	TextDrawShowForPlayer(playerid, Textdraw3);
    ClearAnimations(playerid);
    GivePlayerMoney(playerid, 75);
    SendClientMessage(playerid, 0x00FF00FF, "Da nhan 75$.");
	RemoveBuildingForPlayer(playerid, 684,-1227.5000000,-1393.0000000,116.3000000, 0.0);
}

public doublecut4(playerid)
{
	TogglePlayerControllable(playerid,1);
	SetTimer("HideTextdraw3", 3500, false);
	TextDrawHideForPlayer(playerid, Textdraw2);
	TextDrawShowForPlayer(playerid, Textdraw3);
    ClearAnimations(playerid);
    GivePlayerMoney(playerid, 75);
    SendClientMessage(playerid, 0x00FF00FF, "Da nhan 75$.");
	RemoveBuildingForPlayer(playerid, 684,-1219.8000000,-1399.4000000,115.6000000, 0.0);
}

public doublecut5(playerid)
{
	TogglePlayerControllable(playerid,1);
	SetTimer("HideTextdraw3", 3500, false);
	TextDrawHideForPlayer(playerid, Textdraw2);
	TextDrawShowForPlayer(playerid, Textdraw3);
    ClearAnimations(playerid);
    GivePlayerMoney(playerid, 75);
    SendClientMessage(playerid, 0x00FF00FF, "Da nhan 75$.");
	RemoveBuildingForPlayer(playerid, 684,-1211.2000000,-1397.6000000,116.6000000, 0.0);
}

public doublecut6(playerid)
{
	TogglePlayerControllable(playerid,1);
	SetTimer("HideTextdraw3", 3500, false);
	TextDrawHideForPlayer(playerid, Textdraw2);
	TextDrawShowForPlayer(playerid, Textdraw3);
    ClearAnimations(playerid);
    GivePlayerMoney(playerid, 75);
    SendClientMessage(playerid, 0x00FF00FF, "Da nhan 75$.");
	RemoveBuildingForPlayer(playerid, 684,-1211.9000000,-1387.4000000,117.3000000, 0.0);
}

public doublecut7(playerid)
{
	TogglePlayerControllable(playerid,1);
	SetTimer("HideTextdraw3", 3500, false);
	TextDrawHideForPlayer(playerid, Textdraw2);
	TextDrawShowForPlayer(playerid, Textdraw3);
    ClearAnimations(playerid);
    GivePlayerMoney(playerid, 75);
    SendClientMessage(playerid, 0x00FF00FF, "Da nhan 75$.");
	RemoveBuildingForPlayer(playerid, 684,-1215.6000000,-1376.3000000,120.1000000, 0.0);
}

public doublecut8(playerid)
{
	TogglePlayerControllable(playerid,1);
	SetTimer("HideTextdraw3", 3500, false);
	TextDrawHideForPlayer(playerid, Textdraw2);
	TextDrawShowForPlayer(playerid, Textdraw3);
    ClearAnimations(playerid);
    GivePlayerMoney(playerid, 75);
    SendClientMessage(playerid, 0x00FF00FF, "Da nhan 75$.");
	RemoveBuildingForPlayer(playerid, 684,-1228.0000000,-1377.5000000,118.8000000, 0.0);
}

public treemove(playerid)
{
	MoveObject(tree, -1238.7998000,-1378.5000000,117.8000000,0.005,0.0000000,274.0000000,40.0000000);
}

public treemove1(playerid)
{
	MoveObject(tree1, -1238.7998, -1386.7002, 116.3, 0.005, 0, 268, 44);
}

public treemove2(playerid)
{
	MoveObject(tree2, -1235.7998, -1394.2998, 114.6, 0.005,0, 268, 50);
}

public treemove3(playerid)
{
	MoveObject(tree3, -1229.5996, -1388.7002, 113.8, 0.005,0, 92, 298);
}

public treemove4(playerid)
{
	MoveObject(tree4, -1232.5, -1377.9004, 114.8, 0.005,0, 76, 0);
}

public treemove5(playerid)
{
	MoveObject(tree5, -1220.0996, -1377.5, 116.1, 0.005,0, 54, 42);
}

public treemove6(playerid)
{
	MoveObject(tree6, -1216.0996, -1386.7002, 115.6, 0.005,0, 88, 0);
}

public treemove7(playerid)
{
	MoveObject(tree7, -1210.5996, -1394.2998, 115.6, 0.005,0, 68, 28);
}

public treemove8(playerid)
{
	MoveObject(tree8, -1222.2002, -1393.5, 115.1, 0.005,0, 98, 0);
}

public HideTextdraw0(playerid)
{
TextDrawHideForPlayer(playerid, Textdraw1);

}
public HideTextdraw3(playerid)
{
TextDrawHideForPlayer(playerid, Textdraw3);

}


strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}

stock IsPlayerNearObject(playerid, objectid, Float:range)
{
    new Float:X, Float:Y, Float:Z;
    GetObjectPos(objectid, X, Y, Z);
    if(IsPlayerInRangeOfPoint(playerid, range, X, Y, Z))return true;
    return false;
}
