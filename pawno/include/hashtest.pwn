#include <a_samp>
#include <sscanf2>
#include <zcmd>
native WP_Hash(buffer[], len, const str[]);


public OnFilterScriptInit() {}
public OnFilterScriptExit() {}


stock generateRandomSalt() {
	new salt[32 + 1];
	for(new i; i < 32; i++) {
		salt[i] = random(79) + 47;

		if(salt[i] == 33 || salt[i] == 34 || salt[i] == 37 || salt[i] == 39 || salt[i] == 92) { //invalid SQL chars
			salt[i] = 33; //replace with !
		}
	}
	salt[32] = 0;
	return salt;
}

forward HashPassword(password[], playerid);
public HashPassword(password[], playerid) {
    new string[130];
    
    new part1[33];
    new part2[33];
    strmid(part1, password, 0, floatround(strlen(password)/2, floatround_floor));
    strmid(part2, password, floatround(strlen(password)/2, floatround_floor), strlen(password));
    
    new salt[32+1];
    format(salt, sizeof salt, "%s", generateRandomSalt());

    format(string, sizeof(string), "%s%s%s", part1, salt, part2);
    WP_Hash(string, sizeof string, string);
    return 1;
}

CMD:hash(playerid, params[]) {

    new pass[60];
    if(sscanf(params, "s[60]", pass)) {
        return SendClientMessage(playerid, -1, "You must provide a password");

    }
    HashPassword(pass, playerid);
    return 1;
}