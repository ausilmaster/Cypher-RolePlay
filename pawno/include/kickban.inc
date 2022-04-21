/* *  KickBan.inc - Hooks Kick() and Ban() to show the messages properly. *  Created by Emmet on Wednesday, June 5, 2013 @ 1:52 AM.*/
#include <a_samp>
new    bool:g_DelayAction[MAX_PLAYERS char],    g_BanReason[MAX_PLAYERS][128 char];

stock _Kick(playerid)
{
	if (IsPlayerConnected(playerid))
	{
		g_DelayAction{playerid} = true;
		SetTimerEx("DelayAction", 60, false, "ii", playerid, 1);
	}
	return 1;
}

stock _Ban(playerid)
{
	if (IsPlayerConnected(playerid))
	{
		g_DelayAction{playerid} = true;
		SetTimerEx("DelayAction", 60, false, "ii", playerid, 2);
	}
	return 1;
}

stock _BanEx(playerid, const reason[])
{
	if (IsPlayerConnected(playerid))
	{
		g_DelayAction{playerid} = true;
		strpack(g_BanReason[playerid], reason);
		SetTimerEx("DelayAction", 60, false, "ii", playerid, 3);
	}
	return 1;
}

forward DelayAction(playerid, action);
public DelayAction(playerid, action)
{
	if (!IsPlayerConnected(playerid)) return g_DelayAction{playerid} = false;
	else
	{
		if (g_DelayAction{playerid})
		{
			g_DelayAction{playerid} = false;
			switch (action)
			{
				case 1:
				{
					Kick( playerid );
				}
				case 2:
				{
					Ban( playerid );
				}
				case 3:
				{
					new reason[128];
					strunpack(reason, g_BanReason[playerid]);
					BanEx( playerid, reason );
					g_BanReason[playerid]{0} = '\0';
				}
				default: return 0;
			}
			return 1;
		}
	}
	return 0;
}

#define Kick _Kick
#define Ban _Ban
#define BanEx _BanEx
