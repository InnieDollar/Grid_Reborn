#Include SendCHP.ahk
#NoTrayIcon
Thread_Label = DeBuff
SendCHP(True, "ReceiveData1")
	;msgbox Hello World`n`nThread_Label:%Thread_Label%
CFle = %A_AppData%\Advanced Combat Tracker\FFXIVLogs\Network_%A_Year%%A_Mon%%A_DD%.log
LineRead = 8
PrAy := array("Restart","Player 2","Player 3","Player 4","Player 5","Player 6","Player 7","Player 8")
PrAy_Txt := "Restart|Player 2|Player 3|Player 4|Player 5|Player 6|Player 7|Player 8"
DebuffS1 := "suffers the effect of "
DebuffS2 := "You suffer the effect of "
DebuffR1 := "recovers from the effect of "
DebuffR2 := "You recover from the effect of "
;Sleep, 50
TpPray := array()

;														Dispellable Debuffs - Gain
DBf_A := array()
TPAdd = Y%DebuffS1%Bleeding
DBf_A.insert(TPAdd) 
TPAdd = Y%DebuffS2%Bleeding
DBf_A.insert(TPAdd)
TPAdd = Y%DebuffS1%Aetherochemical Bomb
DBf_A.insert(TPAdd)
TPAdd = Y%DebuffS2%Aetherochemical Bomb
DBf_A.insert(TPAdd)
TPAdd = Y%DebuffS1%Paralysis
DBf_A.insert(TPAdd)
TPAdd = Y%DebuffS2%Paralysis
DBf_A.insert(TPAdd)
TPAdd = Y%DebuffS1%Poison
DBf_A.insert(TPAdd)
TPAdd = Y%DebuffS2%Poison
DBf_A.insert(TPAdd)
TPAdd = Y%DebuffS1%Petrification
DBf_A.insert(TPAdd)
TPAdd = Y%DebuffS2%Petrification
DBf_A.insert(TPAdd)
TPAdd = Y%DebuffS1%Stun
DBf_A.insert(TPAdd)
TPAdd = Y%DebuffS2%Stun
DBf_A.insert(TPAdd)
TPAdd = Y%DebuffS1%Sleep
DBf_A.insert(TPAdd)
TPAdd = Y%DebuffS2%Sleep
DBf_A.insert(TPAdd)
TPAdd = Y%DebuffS1%Disease
DBf_A.insert(TPAdd)
TPAdd = Y%DebuffS2%Disease
DBf_A.insert(TPAdd)
;-----------------------------------------------------------------------------------------------------
;													Non Dispellable Debuffs
TPAdd = N%DebuffS1%Decree Nisi A
DBf_A.insert(TPAdd)
TPAdd = N%DebuffS2%Decree Nisi A
DBf_A.insert(TPAdd)
TPAdd = N%DebuffS1%Decree Nisi B
DBf_A.insert(TPAdd)
TPAdd = N%DebuffS2%Decree Nisi B
DBf_A.insert(TPAdd)
TPAdd = N%DebuffS1%Prey
DBf_A.insert(TPAdd)
TPAdd = N%DebuffS2%Prey
DBf_A.insert(TPAdd)
;-----------------------------------------------------------------------------------------------------
;														Dispellable Debuffs - Lose
DBfR_A := array()
TPAdd = Y%DebuffR1%Bleeding
DBfR_A.insert(TPAdd) 
TPAdd = Y%DebuffR2%Bleeding
DBfR_A.insert(TPAdd)
TPAdd = Y%DebuffR1%Aetherochemical Bomb
DBfR_A.insert(TPAdd)
TPAdd = Y%DebuffR2%Aetherochemical Bomb
DBfR_A.insert(TPAdd)
TPAdd = Y%DebuffR1%Paralysis
DBfR_A.insert(TPAdd)
TPAdd = Y%DebuffR2%Paralysis
DBfR_A.insert(TPAdd)
TPAdd = Y%DebuffR1%Poison
DBfR_A.insert(TPAdd)
TPAdd = Y%DebuffR2%Poison
DBfR_A.insert(TPAdd)
TPAdd = Y%DebuffR1%Petrification
DBfR_A.insert(TPAdd)
TPAdd = Y%DebuffR2%Petrification
DBfR_A.insert(TPAdd)
TPAdd = Y%DebuffR1%Stun
DBfR_A.insert(TPAdd)
TPAdd = Y%DebuffR2%Stun
DBfR_A.insert(TPAdd)
TPAdd = Y%DebuffR1%Sleep
DBfR_A.insert(TPAdd)
TPAdd = Y%DebuffR2%Sleep
DBfR_A.insert(TPAdd)
TPAdd = Y%DebuffR1%Disease
DBfR_A.insert(TPAdd)
TPAdd = Y%DebuffR2%Disease
DBfR_A.insert(TPAdd)
;-----------------------------------------------------------------------------------------------------
;													Non Dispellable Debuffs
TPAdd = N%DebuffR1%Decree Nisi A
DBfR_A.insert(TPAdd)
TPAdd = N%DebuffR2%Decree Nisi A
DBfR_A.insert(TPAdd)
TPAdd = N%DebuffR1%Decree Nisi B
DBfR_A.insert(TPAdd)
TPAdd = N%DebuffR2%Decree Nisi B
DBfR_A.insert(TPAdd)
TPAdd = N%DebuffR1%Prey
DBfR_A.insert(TPAdd)
TPAdd = N%DebuffR2%Prey
DBfR_A.insert(TPAdd)
;-----------------------------------------------------------------------------------------------------
GoSub, EndLs_DBff
return

EndLs_DBff:
SendCHP("Grid_Reborn", "GrabHP," Nothing)
Forever = 1
While Forever = 1
{
	DBf_FLe =
	FileReadLine, DBf_FLe, %CFle%, %LineRead%
	;msgbox %CFLE%`n`nLine:%LineRead%
	If DBf_FLe <>
	{
		StringLeft, HdrChk2, DBf_FLe, 2
		;msgbox ,4096,,%DBF_Fle%,1
		If HdrChk2 = 00
		{
			GoSub 00_Check
		}
		else
		{
			If HdrChk2 = 21
			{
				;GoSub 21_Check
			}
			;Where are the debuffs?????
		}
		LineRead += 1
	}
	Sleep, 2
}
;SetTimer, EndLs_DBff, 0
return

ReceiveData1:
PrAy := array()
Loop, Parse, PrAy_Txt, |
{
	PrAy.insert(A_Loopfield)
}
return

00_Check:
;msgbox start
TpPray := array("You ")
For Ix, Ele in PrAy
{
	If Ix > 1
	{
		TpPray.Insert(Ele)
	}
}
;MSGBOX,4096,,%dbf_fle%,1
DFnd = 0
Ifinstring, DBf_Fle, suffer
{
	For 00IDX, DBf_X in DBf_A
	{
		StringLeft, HdrCk1, DBf_X, 1
		StringtrimLeft,DBf_Tp, DBf_X, 1
		;msgbox HdrCk1:%HdrCk1%`n`nDBf_Tp:%DBf_Tp%
		Ifinstring, DBf_Fle, %DBf_Tp%
		{
			;Found a suffers debuff
			;msgbox,4096,,This Far 00`n`nDBf_Tp:%DBf_Tp%,1
			For NIDX, Nme in TpPrAy
			{
				;msgbox,4096,,Nme:%Nme%,1
				Ifinstring, DBf_Fle, %Nme%			;Found a matching name
				{
					;msgbox,4096,,Nme:%Nme%,1
					DFnd = 1
					If HdrCk1 = Y
					{
						;Matches a player, is dispellable
						DPX = DP%NIDX%`,
						SendCHP("Grid_Reborn", DPX 1)
						GoSub, Play_Debuff
						break
					}
					else
					{
						If HdrCk1 = N
						{
							;Matches a player, is NOT dispellable
							NDPX = NDP%NIDX%`,
							SendCHP("Grid_Reborn", NDPX 1)
							break
						}
					}
					break
				}
			}
		}
		If DFnd = 1
		{
			break
		}
	}
}
Ifinstring, DBf_Fle, recover
{
	;msgbox Nope
	For 00IDXX, DBf_XX in DBfR_A
	{
		StringLeft, HdrCk1, DBf_XX, 1
		StringtrimLeft,DBf_Tp, DBf_XX, 1
		Ifinstring, DBf_Fle, %DBf_Tp%
		{
			;msgbox DBf_Fle:%DBf_Fle%`n`n%DBf_Tp%
			For NIDX, Nme in TpPrAy
			{
				;msgbox,4096,,Nme:%Nme%|,1
				Ifinstring, DBf_Fle, %Nme%			;Found a matching name
				{
					;msgbox,4096,,Matched Nme:%Nme%,1
					If HdrCk1 = Y
					{
						;Matches a player, is dispellable
						DPX = DP%NIDX%`,
						SendCHP("Grid_Reborn", DPX 0)
						break
					}
					else
					{
						If HdrCk1 = N
						{
							;Matches a player, is NOT dispellable
							NDPX = NDP%NIDX%`,
							SendCHP("Grid_Reborn", NDPX 0)
							break
						}
					}
					break
				}
			}
		}
	}
}
return

Play_Debuff:
Pname := PrAy[NIDX]
;Pname := PrAy[1]
Loop, Parse, DBf_Tp, %A_Space%
{
	DBff_Nme = %A_Loopfield%
}
ComObjCreate("SAPI.SpVoice").Speak(Pname DBff_Nme)
return


