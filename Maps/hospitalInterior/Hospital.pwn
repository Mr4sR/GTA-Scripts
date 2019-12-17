#include <a_samp>
/*

------------------------------------------------------------------------------------------
Credits to the creators of Xobjects
Credits to the map Passout_IE   */

forward Timer();
forward SetPlayerPosWithObjects(playerid,Float:x,Float:y,Float:z);


//------------------------------------------------------------------------------

enum object_info
{
	modelid,
	Float:ox,
	Float:oy,
	Float:oz,
	Float:orx,
	Float:ory,
	Float:orz,
	Float:viewdist
}

new Objects[][object_info] = {
{14595, 1180.4391, -1388.3793, 2.0348, 0.0000, 0.0000, 90.1369, 500.0},
{18553, 1191.0493, -1385.2354, -0.6264, 0.0000, 0.0000, 87.6625, 500.0},
{18553, 1192.6693, -1385.2125, 0.7236, 0.0000, 0.0000, 86.8031, 500.0},
{2007, 1184.7882, -1379.6500, -1.9227, 0.0000, 0.0000, 0.0000, 500.0},
{2007, 1183.8059, -1379.6715, -1.9227, 0.0000, 0.0000, 0.0000, 500.0},
{2162, 1181.9301, -1379.2957, -1.8585, 0.0000, 0.0000, 0.0000, 500.0},
{2163, 1185.3390, -1380.9780, -1.9237, 0.0000, 0.0000, 273.1969, 500.0},
{2208, 1180.7450, -1382.2063, -1.9183, 0.0000, 0.0000, 89.3814, 500.0},
{2208, 1180.8126, -1384.7112, -1.9183, 0.0000, 0.0000, 91.1003, 500.0},
{1819, 1175.5725, -1384.8077, -1.9185, 0.0000, 0.0000, 0.0000, 500.0},
{2199, 1182.6536, -1384.8519, -1.9215, 0.0000, 0.0000, 180.4818, 500.0},
{2569, 1180.9142, -1384.7863, -1.8118, 0.0000, 0.0000, 91.1003, 500.0},
{2591, 1180.4489, -1385.1351, 0.7836, 0.0000, 0.0000, 90.2409, 500.0},
{2591, 1183.9246, -1385.1707, 0.7836, 0.0000, 0.0000, 268.8997, 500.0},
{1778, 1166.5919, -1386.3032, -1.9201, 0.0000, 0.0000, 0.0000, 500.0},
{1789, 1165.2905, -1386.5585, -1.3621, 0.0000, 0.0000, 0.0000, 500.0},
{2146, 1175.8838, -1392.4473, -1.4328, 0.0000, 0.0000, 0.0000, 500.0},
{2186, 1184.8839, -1383.0775, -1.9254, 0.0000, 0.0000, 269.7591, 500.0},
{2190, 1180.6179, -1379.3430, -1.0575, 0.0000, 0.0000, 43.8313, 500.0},
{2596, 1180.4966, -1379.2740, 1.7048, 6.0161, 359.1406, 317.8876, 500.0},
{2596, 1180.0686, -1384.9508, 0.9986, 6.8755, 0.0000, 140.9477, 500.0},
{14632, 1168.7366, -1396.2781, -0.4174, 0.0000, 0.0000, 0.0000, 500.0},
{1432, 1164.6432, -1401.1038, -1.7865, 0.0000, 0.0000, 0.0000, 500.0},
{1432, 1162.2817, -1399.1563, -1.7865, 0.0000, 0.0000, 0.0000, 500.0},
{1432, 1164.4725, -1397.2844, -1.7865, 0.0000, 0.0000, 0.0000, 500.0},
{1432, 1161.4653, -1402.3417, -1.7865, 0.0000, 0.0000, 0.0000, 500.0},
{1663, 1182.1984, -1380.9491, -1.4581, 0.0000, 0.0000, 272.3375, 500.0},
{1705, 1175.8365, -1382.9967, -1.9203, 0.0000, 0.0000, 91.1003, 500.0},
{1705, 1175.8467, -1381.9147, -1.9203, 0.0000, 0.0000, 91.9597, 500.0},
{1705, 1175.8578, -1380.7874, -1.9203, 0.0000, 0.0000, 91.1003, 500.0},
{1738, 1161.0452, -1386.5829, -1.2637, 0.0000, 0.0000, 0.0000, 500.0},
{1771, 1189.9792, -1400.4313, -1.2846, 0.0000, 0.0000, 0.0000, 500.0},
{1771, 1190.2343, -1412.1647, -1.2846, 0.0000, 0.0000, 0.0000, 500.0},
{1808, 1175.6654, -1400.8738, -1.9235, 0.0000, 0.0000, 89.3814, 500.0},
{1808, 1166.6495, -1392.8798, -1.9235, 0.0000, 0.0000, 271.4780, 500.0},
{2146, 1184.6044, -1407.2739, -1.4328, 0.0000, 0.0000, 0.0000, 500.0},
{2186, 1155.8945, -1393.9648, -1.9254, 0.0000, 0.0000, 0.0000, 500.0},
{936, 1155.6327, -1402.3196, -1.4436, 0.0000, 0.0000, 91.1003, 500.0},
{936, 1155.6005, -1400.4097, -1.4436, 0.0000, 0.0000, 92.8192, 500.0},
{936, 1155.9205, -1398.9236, -1.4436, 0.0000, 0.0000, 0.0000, 500.0},
{14481, 1193.6644, -1397.2411, -0.4893, 0.0000, 0.0000, 0.0000, 500.0},
{14481, 1194.0762, -1410.1713, -0.4893, 0.0000, 0.0000, 0.0000, 500.0},
{2415, 1155.9580, -1397.8474, -1.9202, 0.0000, 0.0000, 89.3814, 500.0},
{2421, 1155.2572, -1402.5403, -0.9729, 0.0000, 0.0000, 93.6786, 500.0},
{2426, 1155.2550, -1401.7462, -0.9739, 0.0000, 0.0000, 91.1003, 500.0},
{2452, 1157.2961, -1404.1658, -1.9253, 0.0000, 0.0000, 180.3776, 500.0},
{2596, 1166.8241, -1404.3055, 1.0943, 0.0000, 0.0000, 240.5382, 500.0},
{2713, 1164.2433, -1386.5868, -1.7721, 0.0000, 0.0000, 0.0000, 500.0},
{955, 1179.4562, -1385.6345, -1.5153, 0.0000, 0.0000, 0.0000, 500.0},
{956, 1185.1859, -1392.1447, -1.5143, 0.0000, 0.0000, 271.4780, 500.0},
{2212, 1162.2056, -1399.3777, -1.0934, 332.4980, 18.0482, 354.8434, 500.0},
{2218, 1161.3828, -1402.4198, -1.0492, 339.3735, 23.2048, 0.0000, 500.0},
{2221, 1164.4302, -1401.2793, -1.1018, 0.0000, 0.0000, 0.0000, 500.0},
{2221, 1164.4258, -1397.5415, -1.1018, 0.0000, 0.0000, 0.0000, 500.0},
{2221, 1155.3247, -1400.5515, -0.8987, 0.0000, 0.0000, 0.0000, 500.0},
{2222, 1155.3344, -1399.8407, -0.8997, 0.0000, 0.0000, 0.0000, 500.0},
{2342, 1164.5050, -1396.8779, -1.0623, 0.0000, 0.0000, 0.0000, 500.0},
{2425, 1156.7459, -1398.8722, -0.9706, 0.0000, 0.0000, 0.0000, 500.0},
{2429, 1154.7412, -1400.8251, -0.9681, 0.0000, 0.0000, 91.9597, 500.0},
{2453, 1155.4877, -1399.1023, -0.5897, 0.0000, 0.0000, 0.0000, 500.0},
{1359, 1166.4133, -1390.4768, -1.2198, 0.0000, 0.0000, 0.0000, 500.0},
{1359, 1175.0909, -1385.8501, -1.2198, 0.0000, 0.0000, 0.0000, 500.0},
{1359, 1185.3112, -1397.2500, -1.1847, 0.0000, 0.0000, 0.0000, 500.0},
{1359, 1185.0878, -1426.1653, -1.1810, 0.0000, 0.0000, 0.0000, 500.0},
{1369, 1176.3881, -1413.1376, -1.2964, 0.0000, 0.0000, 85.9437, 500.0},
{1430, 1186.0747, -1409.3445, -1.6028, 0.0000, 0.0000, 0.0000, 500.0},
{1430, 1186.2141, -1396.0016, -1.5959, 0.0000, 0.0000, 0.0000, 500.0},
{2672, 1163.3833, -1397.5641, -1.6388, 0.0000, 0.0000, 0.0000, 500.0},
{2673, 1162.9558, -1402.4564, -1.8305, 0.0000, 0.0000, 0.0000, 500.0},
{2674, 1162.7123, -1400.4849, -1.8966, 0.0000, 0.0000, 0.0000, 500.0},
{2676, 1164.7466, -1399.1532, -1.8150, 0.0000, 0.0000, 0.0000, 500.0},
{1215, 1180.4142, -1385.7118, -1.3540, 0.0000, 0.0000, 0.0000, 500.0},
{1215, 1167.6322, -1389.3132, -1.3540, 0.0000, 0.0000, 0.0000, 500.0},
{1215, 1185.1250, -1399.8046, -1.3471, 0.0000, 0.0000, 0.0000, 500.0},
{1262, 1175.4435, -1405.7538, -0.2337, 0.0000, 0.0000, 269.7591, 500.0},
{1342, 1155.3513, -1396.3969, -0.8846, 0.0000, 0.0000, 0.0000, 500.0},
{2591, 1162.2897, -1388.0458, 0.7836, 0.0000, 0.0000, 0.0000, 500.0},
{2591, 1162.3058, -1391.3250, 0.7904, 0.0000, 0.0000, 0.0000, 500.0},
{2591, 1156.4637, -1395.1571, 0.7904, 0.0000, 0.0000, 267.1808, 500.0},
{2591, 1159.5762, -1395.3121, 0.7836, 0.0000, 0.0000, 267.1808, 500.0},
{2151, 1186.2148, -1404.3698, -1.9193, 0.0000, 0.0000, 89.3814, 500.0},
{2151, 1186.2520, -1402.9860, -1.9193, 0.0000, 0.0000, 86.8031, 500.0},
{2151, 1186.0638, -1415.7212, -1.9193, 0.0000, 0.0000, 91.9597, 500.0},
{2151, 1186.0302, -1414.4768, -1.9193, 0.0000, 0.0000, 91.1003, 500.0},
{1523, 1185.8207, -1413.5044, -1.9300, 0.0000, 0.0000, 92.8192, 500.0},
{1523, 1185.8365, -1399.7157, -1.9308, 0.0000, 0.0000, 91.1003, 500.0},
{1523, 1167.2792, -1389.2056, -1.9951, 0.0000, 0.0000, 93.6787, 500.0},
{638, 1180.4081, -1402.5724, -1.2144, 0.0000, 0.0000, 0.0000, 500.0},
{638, 1180.5485, -1408.8470, -1.2213, 0.0000, 0.0000, 0.0000, 500.0},
{949, 1193.5863, -1404.4174, -1.2752, 0.0000, 0.0000, 0.0000, 500.0},
{949, 1194.2183, -1415.8677, -1.2820, 0.0000, 0.0000, 0.0000, 500.0},
{949, 1179.8464, -1379.8613, -1.2820, 0.0000, 0.0000, 0.0000, 500.0},
{950, 1160.5620, -1395.7889, -1.3684, 0.0000, 0.0000, 0.0000, 500.0},
{949, 1162.6851, -1386.9240, -1.2820, 0.0000, 0.0000, 0.0000, 500.0},
{2001, 1174.0809, -1386.0237, -1.9183, 0.0000, 0.0000, 0.0000, 500.0},
{2011, 1185.6136, -1391.1293, -1.8932, 0.0000, 0.0000, 0.0000, 500.0},
{1210, 1180.8293, -1381.4364, -0.9046, 0.0000, 0.0000, 0.0000, 500.0},
{1241, 1186.0205, -1414.6628, -0.6692, 0.0000, 0.0000, 0.0000, 500.0},
{1241, 1186.3981, -1403.8136, -0.6692, 0.0000, 0.0000, 0.0000, 500.0},
{1318, 1191.9076, -1385.2864, -0.5944, 0.0000, 0.0000, 92.8192, 500.0}//100
};

enum player_info
{
	objid[sizeof(Objects)],
	bool:view[sizeof(Objects)]
}
new Player[MAX_PLAYERS][player_info];

//------------------------------------------------------------------------------

bool:IsInReach(Float:x,Float:y,Float:z,Float:x2,Float:y2,Float:z2,Float:dist)
{
	x = (x > x2) ? x - x2 : x2 - x;
	if(x > dist) return false;
	y = (y > y2) ? y - y2 : y2 - y;
	if(y > dist) return false;
	z = (z > z2) ? z - z2 : z2 - z;
	if(z > dist) return false;
	return true;
}

//------------------------------------------------------------------------------

new timer;

public OnFilterScriptInit()
{
	print("---\nOBjects 4 Hospital\n---");
	timer = SetTimer("Timer",500,1);

	

	return 1;
}

public OnFilterScriptExit()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
	{
		for(new o = 0; o < sizeof(Objects); o++)
		{
			if(Player[i][view][o])
			{
				Player[i][view][o] = false;
				DestroyPlayerObject(i,Player[i][objid][o]);
			}
		}
	}
	
	KillTimer(timer);
}

//------------------------------------------------------------------------------

public OnPlayerConnect(playerid)
{
	for(new i = 0; i < sizeof(Objects); i++) Player[playerid][view][i] = false;
}

public OnPlayerDisconnect(playerid)
{
	for(new i = 0; i < sizeof(Objects); i++)
	{
		if(Player[playerid][view][i])
		{
			Player[playerid][view][i] = false;
			DestroyPlayerObject(playerid,Player[playerid][objid][i]);
		}
	}
}

//------------------------------------------------------------------------------

public Timer()
{
	for(new i = 0; i < MAX_PLAYERS; i++)
		if(IsPlayerConnected(i))
		    PlayerObjectUpdate(i);
}

PlayerObjectUpdate(playerid)
{
	new Float:pos[3];
	GetPlayerPos(playerid,pos[0],pos[1],pos[2]);
	for(new i = 0; i < sizeof(Objects); i++)
	{
	    if(!Player[playerid][view][i])
	    {
	        if(IsInReach(pos[0],pos[1],pos[2],Objects[i][ox],Objects[i][oy],Objects[i][oz],Objects[i][viewdist]))
	        {
	            Player[playerid][view][i] = true;
	            Player[playerid][objid][i] = CreatePlayerObject(playerid,Objects[i][modelid],Objects[i][ox],Objects[i][oy],Objects[i][oz],Objects[i][orx],Objects[i][ory],Objects[i][orz]);
	        }
	    } else if(!IsInReach(pos[0],pos[1],pos[2],Objects[i][ox],Objects[i][oy],Objects[i][oz],Objects[i][viewdist]))
	    {
            Player[playerid][view][i] = false;
            DestroyPlayerObject(playerid,Player[playerid][objid][i]);
	    }
	}
}

public SetPlayerPosWithObjects(playerid,Float:x,Float:y,Float:z)
{
	for(new i = 0; i < sizeof(Objects); i++)
	{
	    if(!Player[playerid][view][i])
	    {
	        if(IsInReach(x,y,z,Objects[i][ox],Objects[i][oy],Objects[i][oz],Objects[i][viewdist]))
	        {
	            Player[playerid][view][i] = true;
	            Player[playerid][objid][i] = CreatePlayerObject(playerid,Objects[i][modelid],Objects[i][ox],Objects[i][oy],Objects[i][oz],Objects[i][orx],Objects[i][ory],Objects[i][orz]);
	        }
	    } else if(!IsInReach(x,y,z,Objects[i][ox],Objects[i][oy],Objects[i][oz],Objects[i][viewdist]))
	    {
            Player[playerid][view][i] = false;
            DestroyPlayerObject(playerid,Player[playerid][objid][i]);
	    }
	}
	SetPlayerPos(playerid,Float:x,Float:y,Float:z);
}


public OnPlayerSpawn(playerid)
	PlayerObjectUpdate(playerid);