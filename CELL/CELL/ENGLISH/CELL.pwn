//------------------------------------------------------------------------------
//
//   Celular call Filter Script v1.0
//   Designed for SA-MP v0.2.2
//
//   http://forum.sa-mp.com/index.php?topic=42009.0
//
//   Created by zeruel_angel
//   Dutch version by StyleNL

//   With the colaboration of eldiablo1337, Luxeon[P7] & lorfirewall
//------------------------------------------------------------------------------
#include <a_samp>

#define COLOR_CALL 0xBFC0C2FF
#define COLOR_YELLOW 0xFFFF00AA

#define DEAD_TIMER_ID -666

#define LIBRE 0
#define ESTA_LLAMANDO 1
#define LO_ESTAN_LLAMANDO 2
#define ESTA_HABLANDO 3
//------------------------------------------------------------------------------
//               HOW MUCH MONEY COST A SECOND
#define PRECIO_FICHA 2
#define COSTO_SMS 50
//This is the distance from where ppl can here what you say to the phone, set it
//to -1 if you don't want ppl to hear phone calls (NON REALISTIC)
#define DIST 20.0
//------------------------------------------------------------------------------
new CellState[MAX_PLAYERS];
new AuxiliarTel[MAX_PLAYERS];
new CellTime[MAX_PLAYERS];
new TimerLLamando[MAX_PLAYERS]={DEAD_TIMER_ID,...};
new TimerCaidaFicha[MAX_PLAYERS]={DEAD_TIMER_ID,...};
new Numero_Tel[MAX_PLAYERS];
//Memoria telefono -------------------------------------------------------------
enum Memory_slot_salida{
	numero_telefono,
	Nombre[MAX_PLAYER_NAME],
	costo
	};
new MemorySalida[MAX_PLAYERS][5][Memory_slot_salida];

enum Memory_slot_entrada{
	numero_telefono2,
	Nombre2[MAX_PLAYER_NAME]
	};
new MemoryEntrada[MAX_PLAYERS][5][Memory_slot_entrada];
//Memoria SMS ------------------------------------------------------------------
enum sms_slot_enviados{
	numeroSMS1,
	NombreSMS1[MAX_PLAYER_NAME],
	SMS1[120]
	};
new SMSEnviados[MAX_PLAYERS][5][sms_slot_enviados];
enum sms_slot_recibidos{
	numeroSMS2,
	NombreSMS2[MAX_PLAYER_NAME],
	SMS2[120]
	};
new SMSRecibidos[MAX_PLAYERS][5][sms_slot_recibidos];
//------------------------------------------------------------------------------
forward ColgarTelefonino(playerid);
forward Llamando(callerid,receiverid);
forward CaidaDeFicha(playerid);
//------------------------------------------------------------------------------
public CaidaDeFicha(playerid)
{
    CellTime[playerid]++;
    if (CellTime[playerid]*PRECIO_FICHA>GetPlayerMoney(playerid))
    {
        OnPlayerCommandText(playerid,"/h");
        msgInfo(playerid,"You don't have money left$$$$");
    }
}
//------------------------------------------------------------------------------
msgInfo(playerid,text[])
{
	new msg[255];
    format(msg,255,"   %s",text);
    SendClientMessage(playerid, COLOR_YELLOW, msg);
    return 1;
}
//------------------------------------------------------------------------------------------------------
Float:GetDistanceToPoint(playerid,Float:x2,Float:y2,Float:z2)
{
	if (IsPlayerConnected(playerid))
	{
		new Float:x1,Float:y1,Float:z1;
		GetPlayerPos(playerid,x1,y1,z1);
		return floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
	}
	return 9999.9;
}
//------------------------------------------------------------------------------
AlTelefono(playerid,text[])
{
    new msg[255];
    format(msg,255,"   (cellphone)%s",text);
    SendClientMessage(playerid, COLOR_CALL, msg);
    return 1;
}
//------------------------------------------------------------------------------
public OnFilterScriptInit()
{
	print(" Celular FS zeruel_angel");
	return 1;
}
//------------------------------------------------------------------------------
public Llamando(callerid,receiverid)
{
	if ((!IsPlayerConnected(receiverid))&&(IsPlayerConnected(callerid)))
	{
	    msgInfo(callerid,"The player you were calling is not connected anymore.");
	    if  (TimerLLamando[callerid]!=DEAD_TIMER_ID)
	    {
	    	KillTimer(TimerLLamando[callerid]);
	    	TimerLLamando[callerid]=DEAD_TIMER_ID;
	    	TimerLLamando[receiverid]=DEAD_TIMER_ID;
	    	CellState[callerid]=LIBRE;
	    	CellState[receiverid]=LIBRE;
		}
		return 1;
	}
	if ((IsPlayerConnected(receiverid))&&(!IsPlayerConnected(callerid)))
	{
	    msgInfo(receiverid,"The player who were calling you is not connected anymore.");
	    if  (TimerLLamando[receiverid]!=DEAD_TIMER_ID)
	    {
	    	KillTimer(TimerLLamando[receiverid]);
	    	TimerLLamando[callerid]=DEAD_TIMER_ID;
	    	TimerLLamando[receiverid]=DEAD_TIMER_ID;
	    	CellState[callerid]=LIBRE;
	    	CellState[receiverid]=LIBRE;
		}
		return 1;
	}
	if ((!IsPlayerConnected(receiverid))&&(!IsPlayerConnected(callerid)))
	{
	    if  (TimerLLamando[callerid]!=DEAD_TIMER_ID)
	    {
	    	KillTimer(TimerLLamando[callerid]);
		}
  		if  (TimerLLamando[receiverid]!=DEAD_TIMER_ID)
	    {
	    	KillTimer(TimerLLamando[receiverid]);
		}
		TimerLLamando[callerid]=DEAD_TIMER_ID;
 		TimerLLamando[receiverid]=DEAD_TIMER_ID;
 		CellState[callerid]=LIBRE;
  		CellState[receiverid]=LIBRE;
  		return 1;
	}
	if  ((CellState[callerid] == ESTA_LLAMANDO)&&(CellState[receiverid] == LO_ESTAN_LLAMANDO))
	{
		new msg[256];
		new callerName[MAX_PLAYER_NAME];
		msgInfo(callerid,"Calling...");
	    GetPlayerName(callerid, callerName, sizeof(callerName));
	    format(msg, sizeof(msg), "RING! RING! (cellphone).pickup(/p) hangup(/h). caller: %s (N�%d)", callerName,Numero_Tel[callerid]);
		msgInfo(receiverid, msg);
		new Float:x1,Float:y1,Float:z1;
		GetPlayerPos(receiverid,x1,y1,z1);
  		for (new i=0;i<MAX_PLAYERS;i++)
	    {
	        if  ((GetDistanceToPoint(i,x1,y1,z1)<7.0)&&(i!=receiverid))
	        {
	        	msgInfo(i, "RING! RING! (someones cellphone is ringing)");
	        }
	    }
		return 1;
	}
	return 1;
}

//------------------------------------------------------------------------------
public ColgarTelefonino(playerid)
{
    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_STOPUSECELLPHONE);
	return 1;
}
//------------------------------------------------------------------------------
public OnPlayerText(playerid, text[])
{
	if (CellState[playerid]==ESTA_HABLANDO)
 	{
	 	new msg[255];
	 	new pName[MAX_PLAYER_NAME];
	 	GetPlayerName(playerid,pName,sizeof(pName));
      	format(msg,sizeof(msg),"(%s): %s",pName,text);
	 	AlTelefono(AuxiliarTel[playerid],msg);
	 	format(msg,sizeof(msg),"(by cellphone): %s",text);
   		new Float:x1,Float:y1,Float:z1;
		GetPlayerPos(playerid,x1,y1,z1);
		
		if  (DIST!=-1)
	    for (new i=0;i<MAX_PLAYERS;i++)
	    {
	        if  (GetDistanceToPoint(i,x1,y1,z1)<DIST)
	        {
	        	SendPlayerMessageToPlayer(i,playerid,msg);
	        }
	    }
	 	return 0;
 	}
	return 1;
}
//------------------------------------------------------------------------------
public OnPlayerConnect(playerid)
{
	CellState[playerid]=LIBRE;
	AuxiliarTel[playerid]=-1;
	CellTime[playerid]=0;
	TimerLLamando[playerid]=DEAD_TIMER_ID;
	TimerCaidaFicha[playerid]=DEAD_TIMER_ID;
	Numero_Tel[playerid]=random(8998)+1000;
	msgInfo(playerid, "Use: /CellHelp to get help using cellphones");
	borrarMemorias(playerid);
	return 1;
}
//------------------------------------------------------------------------------
public OnPlayerDisconnect(playerid)
{
    OnPlayerCommandText(playerid,"/h");
	return 1;
}
//------------------------------------------------------------------------------
public OnPlayerCommandText(playerid,cmdtext[])
{
	new cmd[256];
	new tmp[256];
	new idx;
    cmd = strtok(cmdtext, idx);
    if(strcmp(cmd, "/CellHelp", true) == 0 )
	{
	    msgInfo(playerid, "");
	    msgInfo(playerid, "       <[CELLPHONE SYSTEM COMMANDS]>");
	    msgInfo(playerid, "/mynumber or /mn (in order to know your cellphone number)");
	    msgInfo(playerid, "/memory1 o /mm1(call outs) /memory2 o /mm2 (call ins)");
	    msgInfo(playerid, "/sms [phone number] [text] (send a SMS)");
	    msgInfo(playerid, "/smsIN (IN BOX) /smsOUT(SEND BOX)");
	    msgInfo(playerid, "/CALL [phone number] (to call someone)");
	    msgInfo(playerid, "/Hangup o /h (to hangup the phone)");
	    msgInfo(playerid, "/pickup o /p (to pick up a call)");
	    msgInfo(playerid, "");
	    return 1;
	}
    if( (strcmp(cmd, "/mynumber", true) == 0) || (strcmp(cmd, "/mn", true) == 0) )
    {
		format(tmp,sizeof(tmp),"Your phone number is: %d",Numero_Tel[playerid]);
		msgInfo(playerid, tmp);
		return 1;
    }
    if( (strcmp(cmd, "/memory1", true) == 0) || (strcmp(cmd, "/mm1", true) == 0) )
    {
        msgInfo(playerid, "    Calls made:");
        for (new i=0;i<5;i++)
		{
		    if (MemorySalida[playerid][i][numero_telefono]!=0)
		    {
				format(tmp,sizeof(tmp),"(%d) %s Number:%d  Cost:$%d ",i,
				MemorySalida[playerid][i][Nombre],MemorySalida[playerid][i][numero_telefono],MemorySalida[playerid][i][costo]);
				msgInfo(playerid, tmp);
			}
		}
		if (MemorySalida[playerid][0][numero_telefono]==0)
  		{
  		msgInfo(playerid, "registry is empty.");
		}
		return 1;
    }
    if( (strcmp(cmd, "/memory2", true) == 0) || (strcmp(cmd, "/mm2", true) == 0) )
    {
        msgInfo(playerid, "    Calls recibed:");
        for (new i=0;i<5;i++)
		{
		    if (MemoryEntrada[playerid][i][numero_telefono2]!=0)
		    {
				format(tmp,sizeof(tmp),"(%d) %s Number:%d ",i,
				MemoryEntrada[playerid][i][Nombre2], MemoryEntrada[playerid][i][numero_telefono2]);
				msgInfo(playerid, tmp);
			}
		}
		if (MemoryEntrada[playerid][0][numero_telefono2]==0)
  		{
  		msgInfo(playerid, "registry is empty.");
		}
		return 1;
    }
    if (strcmp(cmd, "/smsIN", true) == 0)
    {
    	msgInfo(playerid, "    IN BOX:");
        for (new i=0;i<5;i++)
		{
		    if (SMSRecibidos[playerid][i][numeroSMS2]!=0)
		    {
				format(tmp,sizeof(tmp),"(%d)(%s)(%d): %s ",i,
				SMSRecibidos[playerid][i][NombreSMS2],
				SMSRecibidos[playerid][i][numeroSMS2],
				SMSRecibidos[playerid][i][SMS2]);
				msgInfo(playerid, tmp);
			}
		}
		if (SMSRecibidos[playerid][0][numeroSMS2]==0)
  		{
  		msgInfo(playerid, "BOX IS EMPTY");
		}
        return 1;
    }
    if (strcmp(cmd, "/smsOUT", true) == 0)
    {
        msgInfo(playerid, "    SEND BOX:");
        for (new i=0;i<5;i++)
		{
		    if (SMSEnviados[playerid][i][numeroSMS1]!=0)
		    {
				format(tmp,sizeof(tmp),"(%d)(%s)(%d): %s",i,
				SMSEnviados[playerid][i][NombreSMS1],
				SMSEnviados[playerid][i][numeroSMS1],
				SMSEnviados[playerid][i][SMS1]);
				msgInfo(playerid, tmp);
			}
		}
		if (SMSEnviados[playerid][0][numeroSMS1]==0)
  		{
  		msgInfo(playerid, "BOX IS EMPTY");
		}
        return 1;
    }
   	if(strcmp(cmd, "/sms", true) == 0 )
	{
		tmp = strtok(cmdtext, idx);
		if	(!strlen(tmp))
		{
			msgInfo(playerid, "USO: /sms [phone number] [text]");
			return 1;
		}
	    new numTel = strval(tmp);
		new texto[255];
		strcpy(texto,cmdtext,0,idx);
		GivePlayerMoney(playerid,-COSTO_SMS);
		msgInfo(playerid, "SMS SEND!");
		SMSIN(numTel,playerid,texto);
		SMSOUT(playerid,numTel,texto);
	    return 1;
	}
	if(strcmp(cmd, "/call", true) == 0 )
	{
	    if(IsPlayerConnected(playerid))
		{
			if(CellState[playerid]==ESTA_LLAMANDO)
			{
				msgInfo(playerid, "You are already making a call... to cancell the call use(/h).");
				return 1;
			}
			if(CellState[playerid]==LO_ESTAN_LLAMANDO)
			{
				msgInfo(playerid, "Some is calling you, pickup(/p) hangup(/h)...");
				return 1;
			}
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
   			if(GetPlayerMoney(playerid)<PRECIO_FICHA)
		    {
		        msgInfo(playerid, "You don't have enought money.");
		        SetTimerEx("ColgarTelefonino",2000,0,"d",playerid);
				return 1;
		    }
			tmp = strtok(cmdtext, idx);
			if	(!strlen(tmp))
			{
				msgInfo(playerid, "USE: /call [phone number]");
				SetTimerEx("ColgarTelefonino",2000,0,"d",playerid);
				return 1;
			}
			new numTel = strval(tmp);
			numTel=ConectarLLamada(numTel);
			if (playerid == numTel)
			{
				msgInfo(playerid,"busy tone...");
				SetTimerEx("ColgarTelefonino",2000,0,"d",playerid);
				return 1;
			}
			if	(!IsPlayerConnected(numTel))
			    {
	    			msgInfo(playerid, "Player is disconected!");
	      			SetTimerEx("ColgarTelefonino",2000,0,"d",playerid);
	      			return 1;
			    }
			if (CellState[numTel]==LIBRE)
			{
			    CellState[numTel] = LO_ESTAN_LLAMANDO;
			    CellState[playerid] = ESTA_LLAMANDO;
			    AuxiliarTel[playerid] = numTel;
			    AuxiliarTel[numTel] = playerid;
				TimerLLamando[playerid]=SetTimerEx("Calling",2000,true,"ii",playerid,numTel);
				TimerLLamando[numTel]=TimerLLamando[playerid];
				return 1;
			}
			else
			{
				msgInfo(playerid, "Busy tone...");
				SetTimerEx("ColgarTelefonino",2000,0,"d",playerid);
				return 1;
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/pickup", true) == 0 || strcmp(cmd, "/p", true) == 0)
	{
        if(IsPlayerConnected(playerid))
		{
			if(CellState[playerid] != LO_ESTAN_LLAMANDO)
			{
				SendClientMessage(playerid, COLOR_CALL, "Nobody is calling you...");
				return 1;
			}
			SetPlayerSpecialAction(playerid,SPECIAL_ACTION_USECELLPHONE);
			msgInfo(playerid, "You picked up...");
			msgInfo(AuxiliarTel[playerid],"Someone picked up...");
			CellTime[AuxiliarTel[playerid]]=0;
			TimerCaidaFicha[AuxiliarTel[playerid]]=SetTimerEx("CaidaDeFicha",1000,true,"i",AuxiliarTel[playerid]);
			CellState[playerid]=ESTA_HABLANDO;
			CellState[AuxiliarTel[playerid]]=ESTA_HABLANDO;
			return 1;
		}
		return 1;
	}
	if(strcmp(cmd, "/hangup", true) == 0 || strcmp(cmd, "/h", true) == 0)
	{
		if  (CellState[playerid] == LIBRE)
		{
		    msgInfo(playerid, "You can't hang up your cellphone if you are not using it!");
		    return 1;
		}
		if  (CellState[playerid] == ESTA_LLAMANDO)
		{
		    msgInfo(playerid, "You hanged up! you cancelled the call.");
			msgInfo(AuxiliarTel[playerid], "The cellPhone stoped ringing");
			SetTimerEx("ColgarTelefonino",500,0,"d",playerid);
	    	KillTimer(TimerLLamando[playerid]);
	    	TimerLLamando[playerid]=DEAD_TIMER_ID;
	    	TimerLLamando[AuxiliarTel[playerid]]=DEAD_TIMER_ID;
	    	CellState[playerid]=LIBRE;
	    	CellState[AuxiliarTel[playerid]]=LIBRE;
		    return 1;
		}
		if  (CellState[playerid] == LO_ESTAN_LLAMANDO)
		{
		    msgInfo(playerid, "You hanged up! you cancelled the call.");
			msgInfo(AuxiliarTel[playerid], "The phone was hanged up.");
			SetTimerEx("ColgarTelefonino",500,0,"d",AuxiliarTel[playerid]);
	    	KillTimer(TimerLLamando[playerid]);
	    	TimerLLamando[playerid]=DEAD_TIMER_ID;
	    	TimerLLamando[AuxiliarTel[playerid]]=DEAD_TIMER_ID;
	    	CellState[playerid]=LIBRE;
	    	CellState[AuxiliarTel[playerid]]=LIBRE;
		    return 1;
		}
		if  (CellState[playerid] == ESTA_HABLANDO)
		{
		    msgInfo(playerid, "You hanged up! you cut the call.");
			msgInfo(AuxiliarTel[playerid], "The call was cut.");
			SetTimerEx("ColgarTelefonino",500,0,"d",playerid);
			SetTimerEx("ColgarTelefonino",500,0,"d",AuxiliarTel[playerid]);
   			if  (TimerCaidaFicha[playerid]!=DEAD_TIMER_ID)
	    	{
	    		KillTimer(TimerCaidaFicha[playerid]);
	    		TimerCaidaFicha[playerid]=DEAD_TIMER_ID;
	    		new msg[255];
	    		format(msg,sizeof(msg),"The call costed: $%d",CellTime[playerid]*PRECIO_FICHA);
	    		GivePlayerMoney(playerid,CellTime[playerid]*PRECIO_FICHA*-1);
	    		msgInfo(playerid, msg);
	    		ActualizarMemoriaSalida(playerid,AuxiliarTel[playerid]);
	    		ActualizarMemoriaEntrada(AuxiliarTel[playerid],playerid);
			}
			if  (TimerCaidaFicha[AuxiliarTel[playerid]]!=DEAD_TIMER_ID)
	    	{
	    		KillTimer(TimerCaidaFicha[AuxiliarTel[playerid]]);
	    		TimerCaidaFicha[AuxiliarTel[playerid]]=DEAD_TIMER_ID;
	    		new msg[255];
	    		format(msg,sizeof(msg),"The call costed: $%d",CellTime[AuxiliarTel[playerid]]*PRECIO_FICHA);
	    		GivePlayerMoney(playerid,CellTime[AuxiliarTel[playerid]]*PRECIO_FICHA*-1);
	    		msgInfo(AuxiliarTel[playerid], msg);
	    		ActualizarMemoriaSalida(AuxiliarTel[playerid],playerid);
	    		ActualizarMemoriaEntrada(playerid,AuxiliarTel[playerid]);
			}
			CellState[playerid]=LIBRE;
	    	CellState[AuxiliarTel[playerid]]=LIBRE;
		}
		return 1;
	}
	return 0;
}
//------------------------------------------------------------------------------
ConectarLLamada(numTel)
{
	for (new i=0;i<MAX_PLAYERS;i++)
	    {
	        if (Numero_Tel[i] == numTel)
	        {
	            return i;
	        }
	    }
	return -1;
}
//------------------------------------------------------------------------------
ActualizarMemoriaSalida(playerid,otroplayerid)
{
	for (new i=4;i>0;i--)
	{
	    MemorySalida[playerid][i][numero_telefono]=MemorySalida[playerid][i-1][numero_telefono];
	    format(MemorySalida[playerid][i][Nombre],MAX_PLAYER_NAME,"%s",MemorySalida[playerid][i-1][Nombre]);
		MemorySalida[playerid][i][costo]=MemorySalida[playerid][i-1][costo];
	}
	MemorySalida[playerid][0][numero_telefono]=Numero_Tel[otroplayerid];
	GetPlayerName(otroplayerid,MemorySalida[playerid][0][Nombre],MAX_PLAYER_NAME);
	MemorySalida[playerid][0][costo]=CellTime[playerid]*PRECIO_FICHA;
	return 1;
}
//------------------------------------------------------------------------------
ActualizarMemoriaEntrada(playerid,otroplayerid)
{
	for (new i=4;i>0;i--)
	{
	    MemoryEntrada[playerid][i][numero_telefono2]=MemoryEntrada[playerid][i-1][numero_telefono2];
		format(MemoryEntrada[playerid][i][Nombre2],MAX_PLAYER_NAME,"%s",MemoryEntrada[playerid][i-1][Nombre2]);
	}
	MemoryEntrada[playerid][0][numero_telefono2]=Numero_Tel[otroplayerid];
	GetPlayerName(otroplayerid,MemoryEntrada[playerid][0][Nombre2],MAX_PLAYER_NAME);
	return 1;
}
//------------------------------------------------------------------------------
SMSIN(numTel,otroplayerid,texto[])
{
	new playerid = ConectarLLamada(numTel);
	if (IsPlayerConnected(playerid))
	{
	    msgInfo(playerid, "You have 1 new SMS ( /smsIN )");
		for (new i=4;i>0;i--)
		{
		    SMSRecibidos[playerid][i][numeroSMS2]=SMSRecibidos[playerid][i-1][numeroSMS2];
			format(SMSRecibidos[playerid][i][NombreSMS2],MAX_PLAYER_NAME,"%s",SMSRecibidos[playerid][i-1][NombreSMS2]);
			format(SMSRecibidos[playerid][i][SMS2],120,"%s",SMSRecibidos[playerid][i-1][SMS2]);
		}
		SMSRecibidos[playerid][0][numeroSMS2]=Numero_Tel[otroplayerid];
		GetPlayerName(otroplayerid,SMSRecibidos[playerid][0][NombreSMS2],MAX_PLAYER_NAME);
		format(SMSRecibidos[playerid][0][SMS2],120,"%s",texto);
	}
	return 1;
}
//------------------------------------------------------------------------------
SMSOUT(playerid,numTel,texto[])
{
	new otroplayerid = ConectarLLamada(numTel);
	for (new i=4;i>0;i--)
	{
	    SMSEnviados[playerid][i][numeroSMS1]=SMSEnviados[playerid][i-1][numeroSMS1];
		format(SMSEnviados[playerid][i][NombreSMS1],MAX_PLAYER_NAME,"%s",SMSEnviados[playerid][i-1][NombreSMS1]);
		format(SMSEnviados[playerid][i][SMS1],120,"%s",SMSEnviados[playerid][i-1][SMS1]);
	}
	if (IsPlayerConnected(otroplayerid)) GetPlayerName(otroplayerid,SMSEnviados[playerid][0][NombreSMS1],MAX_PLAYER_NAME);
	else format(SMSEnviados[playerid][0][NombreSMS1],MAX_PLAYER_NAME,"%s"," FAILURE ");
 	SMSEnviados[playerid][0][numeroSMS1]=numTel;
	format(SMSEnviados[playerid][0][SMS1],120,"%s",texto);
	return 1;
}
//------------------------------------------------------------------------------
borrarMemorias(playerid)
{
	for (new i=0;i<5;i++)
	{
	    MemoryEntrada[playerid][i][numero_telefono2]=0;
	    MemorySalida[playerid][i][numero_telefono]=0;
	    SMSRecibidos[playerid][i][numeroSMS2]=0;
	    SMSEnviados[playerid][i][numeroSMS1]=0;
	}
	return 1;
}
//=====================================================================================================
 strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[20];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}
//------------------------------------------------------------------------------
stock strcpy( dest[ ], src[ ], startdest = 0, startsrc = 0 )
{
        // Made by Peter.

        for ( new i = startsrc, j = strlen( src ); i < j; i++ )
        {
                dest[ startdest++ ] = src[ i ];
        }
        dest[ startdest ] = 0;
}