/*
*
*
*           DIALOGS
*
*
*
*/


public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
	//
	case DIALOG_REGISTER:
	{
        if(response)
		{
		new password[128];
		SendClientMessage(playerid, LIGHTGREEN, "Tot lam!{ffffff} Hay tiep tuc phan dang ky cua ban.");
		ShowPlayerDialog(playerid, DIALOG_SEX, DIALOG_STYLE_MSGBOX, "Gioi tinh", "Chon gioi tinh cua nhan vat ma ban muon.", "Nam", "Nu");
		format(password,sizeof(password),"%s",inputtext);
		PlayerInfo[playerid][Password] = password;
		}
		else
		{
		Kick(playerid);
		}
    }
    //
	case DIALOG_SEX:
	{
		if(response)
		{
		PlayerInfo[playerid][Sex] = 0; // Con trai
		PlayerInfo[playerid][Skin] = 250;
		SendClientMessage(playerid,-1,"Duoc roi, ban la {FFFF00}Nam{FFFFFF}.");
		ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Tuoi tac", "Nhap tuoi cua nhan vat\n\nToi thieu 18 - Toi da 90.", "Tiep tuc", "Huy bo");
		}
		else
		{
		PlayerInfo[playerid][Sex] = 1; // Con gai
		PlayerInfo[playerid][Skin] = 226;
		SendClientMessage(playerid,-1,"Duoc roi, ban la {FFFF00}Nu{FFFFFF}.");
		ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Tuoi tac", "Nhap tuoi cua nhan vat\n\nToi thieu 18 - Toi da 90.", "Tiep tuc", "Huy bo");
		}
	  }
	//
	case DIALOG_AGE:
	{
	     if(response) //Inputtex < 18 toi thieu 18 ky tu, inputtext > 90 toi da 90 ky tu
		 {
		 if(strval(inputtext) < 18 || strval(inputtext) > 90) return ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Tuoi tac", "Nhap tuoi cua ban\n\n{FF0000}Toi thieu 18 - Toi da 90.", "Tiep tuc", "Huy bo");
		 PlayerInfo[playerid][Age] = strval(inputtext);
		 SetSpawnInfo(playerid, 0, PlayerInfo[playerid][Skin], 1772.9946, -1894.6461, 13.5518, 0.0000, 0,0,0,0,0,0);
		 SetPVarInt(playerid, "Enter", 1);
		 SpawnPlayer(playerid);
		 CreateAccount(playerid);
	     }
		 else
		 {
		 Kick(playerid);
		 }
	}
	//
	case DIALOG_LOGIN:
	{
        if(response)
		{
		new query[520];
		mysql_format(MySQL,query,sizeof(query),"SELECT * FROM `accounts` WHERE `Name`='%s' AND `Password`='%s'",PlayerName(playerid),inputtext);
		mysql_pquery(MySQL, query, "PlayerLogin","d", playerid);
		}
		else
		{
		Kick(playerid);
		}
	}
	//
	}
	return 1;
}