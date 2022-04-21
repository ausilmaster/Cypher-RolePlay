/*
*
*
*           STOCKS
*
*
*
*/
SendClientMessageEx(playerid, color, const text[], {Float,_}:...)
{
	static
  	    args,
	    str[192];

	if((args = numargs()) <= 3)
	{
	    SendClientMessage(playerid, color, text);
	}
	else
	{
		while(--args >= 3)
		{
			#emit LCTRL 	5
			#emit LOAD.alt 	args
			#emit SHL.C.alt 2
			#emit ADD.C 	12
			#emit ADD
			#emit LOAD.I
			#emit PUSH.pri
		}
		#emit PUSH.S 	text
		#emit PUSH.C 	192
		#emit PUSH.C 	str
		#emit PUSH.S	8
		#emit SYSREQ.C 	format
		#emit LCTRL 	5
		#emit SCTRL 	4

		SendClientMessage(playerid, color, str);

		#emit RETN
	}
	return 1;
}

FormatNumber(number, money = 1)
{
	new length, value[32];

	format(value, sizeof(value), "%i", (number < 0) ? (-number) : (number));

	length = strlen(value);

    if(length > 3)
	{
  		for(new l = 0, i = length; --i >= 0; l ++)
		{
		    if((l % 3 == 0) && l > 0)
		    {
				strins(value, ",", i + 1);
			}
		}
	}

	if(money)
		strins(value, "$", 0);
	if(number < 0)
		strins(value, "-", 0);

	return value;
}



stock CameraPlayer(playerid)//Goc nhin khi dang nhap/dang ky
{
    SetPlayerCameraPos(playerid, 1431.6304, -980.7109, 139.0031);
    SetPlayerCameraLookAt(playerid, 1419.1520, -819.0696, 86.8392);
    SetPlayerPos(playerid, 1415.3553, -808.6208, -76.3112);
    TogglePlayerControllable(playerid,0);
    return 1;
}

stock PlayerName(playerid)
{
    new Name[MAX_PLAYER_NAME];
    GetPlayerName(playerid, Name, sizeof(Name));
    return Name;
}
stock MessageFaction(fid, color, message[])
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		if(PlayerInfo[i][pFaction] == fid)
		{
			SendClientMessage(i,color,message);
		}
	}
	return 1;
}

stock GetPlayerIpEx(playerid)
{
    new ip[16];
	GetPlayerIp(playerid, ip, sizeof(ip));
	return ip;
}