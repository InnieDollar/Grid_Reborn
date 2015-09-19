#Include SendCHP.ahk
#NoTrayIcon
Thread_Label = Misc
SendCHP(True, "ReceiveData1")
	;msgbox Hello World`n`nThread_Label:%Thread_Label%`n`nLineRead:%LineRead%
CFle = %A_AppData%\Advanced Combat Tracker\FFXIVLogs\Network_%A_Year%%A_Mon%%A_DD%.log
LineRead = 8
PrAy := array("Restart","Player 2","Player 3","Player 4","Player 5","Player 6","Player 7","Player 8")
PrAy_Txt := "Restart|Player 2|Player 3|Player 4|Player 5|Player 6|Player 7|Player 8"
	
Alive1 := " suffers the effect of Weakness"
Alive2 := "You suffer the effect of Weakness"
;Alive3 := "is revived"
;Alive4 := "You are revived"
Dead1 := " is defeated"
Dead2 := "You are defeated"

EndLs_Dead:
SendCHP("Grid_Reborn", "GrabHP," Nothing)
Forever = 1

While Forever = 1
{
	Dead_FLe =
	FileReadLine, Dead_FLe, %CFle%, %LineRead%
	If Dead_FLe <>
	{
		;msgbox This Far`n`n%Dead_Fle%
		stringleft,HdrCheckDD, Dead_FLe, 2
		If HdrCheckDD = 00
		{
			;msgbox,4096,,This Far`n`n%Dead_Fle%`n`n|%Dead2%|,1
			Ifinstring, Dead_Fle, %Dead1%
			{
				GoSub, MakeDead
			}
			else
			{
				Ifinstring, Dead_Fle, %Dead2%
				{
					Loop 2
					{
						;TCHP1 = 0
						SendCHP("Grid_Reborn", "TCHP1," 0)
						Sleep, 100
						;msgbox,4096,,Changed Via Dead Thread,2
					}
				}
				else
				{
					ifinstring, Dead_Fle, %Alive1%
					{
						GoSub, MakeAlive
					}
					else
					{
						ifinstring, Dead_Fle, %Alive2%
						{
							SendCHP("Grid_Reborn", "TCHP1," 1000)
							;TCHP1 = 1000
							;msgbox ,4096,,Changed Via Dead Thread,2
						}
					}
				}
			}
		}
			LineRead += 1
	}
	;settimer, EndLs_Dead, 0
	Sleep, 2
}
return

ReceiveData1:
PrAy := array()
Loop, Parse, PrAy_Txt, |
{
	PrAy.insert(A_Loopfield)
}
;msgbox updated Misc
Return

MakeDead:
DeadNme:= DeadNameGet(Dead_Fle)
For DIdx, PMem in PrAy
{
	If DeadNme = %PMem%
	{
		Loop 2
		{
			TCHPX = TCHP%DIdx%`,
			SendCHP("Grid_Reborn", TCHPX 0)
			;TCHP%DIdx% = 0
			sleep, 100
		}
	}
}

return

MakeAlive:
DeadNme:= DeadNameGet(Dead_Fle)
For DIdx, PMem in PrAy
{
	If DeadNme = %PMem%
	{
		TCHPX = TCHP%DIdx%`,
		SendCHP("Grid_Reborn", TCHPX 1000)
		;TCHP%DIdx% = 1000
	}
}
return

DeadNameGet(Var)
{
	Stringgetpos,SH, Var, 
	SH += 2
	Stringgetpos,EH, Var, ,L2
	LenX := 1 + (EH - SH)
	FName := substr(Var, SH, LenX)
	return % FName
}
