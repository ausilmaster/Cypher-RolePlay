/*
*
*
*           MYSQL
*
*
*
*/

#define SQL_HOST    "127.0.0.1"
#define SQL_USER    "root"
#define SQL_PASS    ""
#define SQL_DB      "cypher"

new MySQL;



public OnQueryError(errorid, error[], callback[], query[], connectionHandle)
{
	switch(errorid)
	{
		case CR_SERVER_GONE_ERROR:
		{
			printf("Mat ket noi...");
			mysql_reconnect(connectionHandle);
		}
		case ER_SYNTAX_ERROR:
		{
			printf("Loi cu phap truy van: %s",query);
		}
	}
	return 1;
}