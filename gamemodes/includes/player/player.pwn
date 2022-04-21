/*
*
*
*           PLAYERS
*
*
*
*/


enum pInfo
{
    Password[128],
    Logged,
    Sex,
    Age,
    Skin,
    Admin,
    Float:X,
    Float:Y,
    Float:Z,
    Float:Lifetime,
    Float:Jacket,
    Deaths,
    Kill,
    Faction,
    Rank,
    Job,
    Cash,
    Int,
    VW,
	Level,
	Piz
}
new PlayerInfo[MAX_PLAYERS][pInfo];


forward VerifyUser(playerid);
forward CreateAccount(playerid);
forward PlayerLogin(playerid);
forward LoginPlayer(playerid);
forward SavePlayer(playerid);

public VerifyUser(playerid)
{
	new Rows;
    Rows = cache_get_row_count();
    if(!Rows)
    {
        CameraPlayer(playerid);
        ShowPlayerDialog(playerid, DIALOG_REGISTER, DIALOG_STYLE_INPUT, "Dang Ky", "Chao mung ban den voi may chu\n\nTai khoan nay chua dang ky, vui long nhap mat khau de dang ky.", "Dang Ky", "Huy bo");
	}
	else
	{
        CameraPlayer(playerid);
        ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT, "Dang Nhap", "Chao mung ban quay tro lai voi may chu\n\nTai khoan nay da duoc dang ky, hay dang nhap de tham gia.", "Dang Nhap", "Huy bo");
	}
	return 1;
}


public CreateAccount(playerid)
{
    new query[520],warning[125];
    mysql_format(MySQL, query, sizeof(query), "INSERT INTO `accounts`(`Name`, `Password`, `Skin`, `X`, `Y`, `Z`, `Sex`, `Lifetime`) VALUES ('%s','%s','%i','1772.9946', '-1894.6461', '13.5518','%i','100')",
    PlayerName(playerid),
    PlayerInfo[playerid][Password],
    PlayerInfo[playerid][Skin],
    PlayerInfo[playerid][Sex]);
    mysql_query(MySQL, query);
    GivePlayerCash(playerid, 500);
    SendClientMessage(playerid,LIGHTGREEN,"Xin chuc mung! Hoan tat dang ky tai khoan.");
    SendClientMessage(playerid,-1,"Chao mung ban den voi may chu cua chung toi.");
    format(warning,sizeof(warning),"Tai khoan: %s - Tuoi: %d - Gioi tinh: %d", PlayerName(playerid), PlayerInfo[playerid][Age], PlayerInfo[playerid][Sex]);
    print(warning); //Thong bao tai khoan duoc tao cho may chu
    return 1;
}

public PlayerLogin(playerid)
{
    if(cache_get_row_count() == 0)
    {
        ShowPlayerDialog(playerid, DIALOG_LOGIN, DIALOG_STYLE_INPUT, "Dang Nhap", "Sai mat khau!\n\nTai khoan nay da duoc dang ky, hay dang nhap de tham gia.", "Dang Nhap", "Huy bo");
    }
    else
    {
        PlayerInfo[playerid][Skin] = cache_get_row_int(0, 3);
        PlayerInfo[playerid][X] = cache_get_row_float(0, 4);
        PlayerInfo[playerid][Y] = cache_get_row_float(0, 5);
        PlayerInfo[playerid][Z] = cache_get_row_float(0, 6);
        PlayerInfo[playerid][Sex] = cache_get_row_int(0, 7);
        PlayerInfo[playerid][Lifetime] = cache_get_row_float(0, 8);
        PlayerInfo[playerid][Jacket] = cache_get_row_float(0, 9);
        PlayerInfo[playerid][Deaths] = cache_get_row_int(0, 10);
        PlayerInfo[playerid][Kill] = cache_get_row_int(0, 11);
        PlayerInfo[playerid][Faction] = cache_get_row_int(0, 12);
        PlayerInfo[playerid][Rank] = cache_get_row_int(0, 13);
        PlayerInfo[playerid][Job] = cache_get_row_int(0, 14);
        PlayerInfo[playerid][Cash] = cache_get_row_int(0, 15);
        PlayerInfo[playerid][Int] = cache_get_row_int(0, 16);
        PlayerInfo[playerid][VW] = cache_get_row_int(0, 17);
        PlayerInfo[playerid][Age] = cache_get_row_int(0, 18);
        PlayerInfo[playerid][Admin] = cache_get_row_int(0, 19);
        SetPVarInt(playerid, "Enter", 1);
        LoginPlayer(playerid);
    }
    return 1;
}
public LoginPlayer(playerid)
{
    SetSpawnInfo(playerid, 0, PlayerInfo[playerid][Skin], PlayerInfo[playerid][X],PlayerInfo[playerid][Y],PlayerInfo[playerid][Z], 0.0000, 0,0,0,0,0,0);
    SpawnPlayer(playerid);
    SetPlayerHealth(playerid,PlayerInfo[playerid][Lifetime]);
    SetPlayerArmour(playerid,PlayerInfo[playerid][Jacket]);
    SetPlayerVirtualWorld(playerid,PlayerInfo[playerid][VW]);
    SetPlayerInterior(playerid,PlayerInfo[playerid][Int]);
    SetPlayerSkin(playerid,PlayerInfo[playerid][Skin]);
    return 1;
}
public SavePlayer(playerid)
{
    new query[520],Float:jX,Float:jY,Float:jZ,Float:hp,Float:armor,pVW,pInt;
    GetPlayerPos(playerid, jX, jY, jZ);
    GetPlayerHealth(playerid,hp);
    GetPlayerArmour(playerid,armor);
    PlayerInfo[playerid][VW] = GetPlayerVirtualWorld(playerid);
    PlayerInfo[playerid][Int] = GetPlayerInterior(playerid);
    pVW = GetPlayerVirtualWorld(playerid);
    pInt = GetPlayerInterior(playerid);
    mysql_format(MySQL, query, sizeof(query), "UPDATE `accounts` SET `Skin`='%i',`X`='%f',`Y`='%f',`Z`='%f',`Sex`='%i',`Lifetime`='%f',`Jacket`='%f',`Deaths`='%i',`Kill`='%i' WHERE `Name`='%s'",
    PlayerInfo[playerid][Skin],
    jX,
    jY,
    jZ,
    PlayerInfo[playerid][Sex],
    hp,
    armor,
    PlayerInfo[playerid][Deaths],
    PlayerInfo[playerid][Kill],
    PlayerName(playerid));
    mysql_query(MySQL, query);
    //
    mysql_format(MySQL, query, sizeof(query), "UPDATE `accounts` SET `Admin`='%i', `Age`='%i', `Faction`='%i', `Rank`='%i', `Job`='%i', `Cash`='%i' WHERE `Name`='%s'",
    PlayerInfo[playerid][Admin],
    PlayerInfo[playerid][Age],
    PlayerInfo[playerid][Faction],
    PlayerInfo[playerid][Rank],
    PlayerInfo[playerid][Job],
    PlayerInfo[playerid][Cash],
    PlayerName(playerid));
    mysql_query(MySQL, query);

    mysql_format(MySQL, query, sizeof(query), "UPDATE `accounts` SET `VW`='%i', `Interior`='%i' WHERE `Name`='%s'",
    pVW,
    pInt,
    PlayerName(playerid));
    mysql_query(MySQL, query);
    return 1;
}