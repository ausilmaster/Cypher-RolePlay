//SetPlayerAttachedObject(playerid, 0, 2060, 3, 0.213999, -0.348001, -0.103999, -167.8, -93.7999, -161.7, 1, 1, 1, 0, 0);
#include <a_samp>
#include <streamer>
#include <zcmd>

#define COLOR_WHITE 0xFFFFFFAA

#if defined FILTERSCRIPT

#define PRESSED(%0) \
(((newkeys&(%0))==(%0)) && ((oldkeys & (%0)) != (%0)))
#define HOLDING(%0)														((newkeys & (%0)) == (%0))
#define RELEASED(%0) 													(((newkeys & (%0)) != (%0)) && ((oldkeys & (%0)) == (%0)))

public OnFilterScriptExit()
{
	return 1;
}

#else

main()
{
	print("\n----------------------------------");
	print(" Job - Brian");
	print("----------------------------------\n");
}

#endif

public OnGameModeInit()
{
	return 1;
}
public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	return 1;
}

public OnPlayerConnect(playerid)
{
	CreateDynamicPickup(1239, 23, 2145.6328,-2263.4792,13.3000, -1);//
	CreateDynamic3DTextLabel("Apasati Y pentru a începe lucrul",COLOR_WHITE,2145.6328,-2263.4792,13.3000+0.6,25.0);
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	if(IsPlayerInRangeOfPoint(playerid, 3, 2190.7366,-2245.5591,13.4895))
	{
		new string[200];
		RemovePlayerAttachedObject(playerid, 0);
		DisablePlayerCheckpoint(playerid);
		SetPlayerSpecialAction(playerid, 0);
		new rand=random(500);
		new job = 500;
		GivePlayerMoney(playerid, rand+job);
	    format(string, sizeof(string), "Ai primit %d$ pentru aceasta lucrare.", rand+job);
		SendClientMessage(playerid, -1, string);
	}
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if(newkeys & KEY_YES) //Key
	{
		if(IsPlayerInRangeOfPoint(playerid, 1.0, 2145.6328,-2263.4792,13.3000))
		{
			SetPlayerAttachedObject(playerid, 0, 2060, 3, 0.213999, -0.348001, -0.103999, -167.8, -93.7999, -161.7, 1, 1, 1, 0, 0);
			ApplyAnimation(playerid,"CARRY","crry_prtial",4.1,1,0,0,1,1);
			SendClientMessage(playerid, -1, "Luati o geanta, o aduceti la markerul de pe miniharta");
			SetPlayerCheckpoint(playerid, 2190.7366,-2245.5591,13.4895, 3);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_CARRY);
			return 1;
		}
	}
	return 1;
}

