/*
*
*
*           CALLBACKS
*
*
*
*/


public OnPlayerConnect(playerid)
{
    new query[520],name[MAX_PLAYER_NAME];
    SetPlayerColor(playerid, -1);
    GetPlayerName(playerid, name, sizeof(name));
    mysql_format(MySQL, query, sizeof(query), "SELECT * FROM `accounts` WHERE `Name`='%s'", name);
    mysql_pquery(MySQL, query, "VerifyUser","d", playerid);
    return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
    SavePlayer(playerid);
    PlayerInfo[playerid][Logged] = 0;
	return 1;
}
public OnPlayerUpdate(playerid)
{
	return 1;
}
public OnPlayerSpawn(playerid)
{
	if(GetPVarInt(playerid, "Enter") == 0)
	{
		Kick(playerid);
	}

    PlayerInfo[playerid][Logged] = 1;
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	PlayerInfo[playerid][Deaths]++;// +1 deaths cua nguoi choi vao database khi bi giet
	PlayerInfo[killerid][Kill]++;// + 1 kill cua nguoi choi vao database khi giet nguoi
	return 1;
}

forward GivePlayerCash(playerid, amount);
public GivePlayerCash(playerid, amount)
{
    new query[520];
    PlayerInfo[playerid][Cash] = PlayerInfo[playerid][Cash] + amount;

    mysql_format(MySQL, query, sizeof(query), "UPDATE `accounts` SET `Cash`='%i'", PlayerInfo[playerid][Cash]);
    mysql_query(MySQL, query);
    return 1;
}

forward OnPlayerUpdateEx();
public OnPlayerUpdateEx()
{
    for(new i=0;i<MAX_PLAYERS;i++)
    {
    	if(GetPlayerMoney(i) != PlayerInfo[i][Cash])
		{
		    ResetPlayerMoney(i);
		    GivePlayerMoney(i, PlayerInfo[i][Cash]);
		}
    }
    return 1;    
}