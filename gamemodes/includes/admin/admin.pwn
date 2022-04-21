/*
*
*
*           ADMIN
*
*
*
*/

GetAdminRank(playerid)
{
	new string[24];

	switch(PlayerInfo[playerid][Admin])
	{
        case 0: string = "Khong";
	    case 1: string = "Admin 1";
	    case 2: string = "Admin 2";
	    case 3: string = "Admin 3";
	    case 4: string = "Admin 4";
		case 5: string = "Admin 5";
		case 6: string = "Admin 6";
		case 7: string = "Admin 7";
		case 8: string = "Admin 8";
		case 9: string = "Owner";
	}
	return string;
}

CMD:admins(playerid, params[])
{
	if(PlayerInfo[playerid][Admin] < 1)
	{
	    return SendClientMessage(playerid, COLOR_LIGHTRED, "Ban khong co quyen su dung lenh nay.");
	}

	SendClientMessage(playerid, COLOR_LIGHTRED, "_________ Quan tri vien _________");

	for(new i=0;i<MAX_PLAYERS;i++)
	{
	    if(PlayerInfo[i][Admin] > 0)
		{
            return SendClientMessageEx(playerid, COLOR_WHITE, "(ID: %i) | Ten: %s | Rank: %s", i, PlayerName(i), GetAdminRank(i));	
		}
	}
	return 1;
}

CMD:givemoney(playerid, params[])
{
    new targetid, money;
    if(PlayerInfo[playerid][Admin] > 3)
    {
        if(sscanf(params, "ui", targetid, money))
        {
            return SendClientMessage(playerid, COLOR_WHITE, "Su dung: /givemoney [playerid] [so luong]");
        }
        if(!IsPlayerConnected(targetid))
        {
            return SendClientMessage(playerid, COLOR_LIGHTRED, "Nguoi choi do da bi mat ket noi.");
        }

        GivePlayerCash(targetid, money);

        SendClientMessageEx(playerid, COLOR_WHITE, "Ban vua nhan duoc $%i tu quan tri vien %s.", money, PlayerName(playerid));
    }
    else SendClientMessage(playerid, COLOR_LIGHTRED, "Ban khong co quyen su dung lenh nay");
    return 1;
}