#Persistent
Random, delay, 5000,15000
SetTimer, PerformSwipe, %delay%
SetTimer, CheckForWin, 50000
return

CheckForWin:
Random, chance2, 0, 100
if(chance >= 75)
{
	Random, delay2, 1000,4000
	Sleep, delay2
} 
if(chance = 100)
{
	Random, delay4, 1800000,3600000
	Sleep, delay4
} 
Random, delay3, 1, 1000
Sleep, delay3
Click, down
Sleep, 100
Click, up
return

PerformSwipe:
if WinExist("BlueStacks")
{
	WinGetPos, startx, starty, wwidth, wheight, BlueStacks
	
	rnd1start := startx + (wwidth/2) + 80
	rnd1end := startx + (wwidth/2) + 160
	
	rnd2start := starty + 350
	rnd2end := starty + 400
	
	rnd3start := startx + (wwidth/2) +80
	rnd3end := startx + (wwidth/2) + 160
	
	rnd4start := starty + (wheight - 500)
	rnd4end := starty + (wheight - 400)
	
	rnd5start := starty + (wheight - 300)
	rnd5end := starty + (wheight - 250)
	
	Random, rnd1, rnd1start, rnd1end 
	Random, rnd2, rnd2start, rnd2end 
	Random, rnd3, rnd3start, rnd3end 
	Random, rnd4, rnd4start, rnd4end
	Random, rnd5, rnd5start, rnd5end
	
	sizex := startx + wwidth
	sizey := starty + wheight
	
	Random, chance, 0, 100
	if(chance >= 95)
	{
		Random, afktime, 10000,120000
		Sleep, afktime
	}
	Random, r1, 18, 22
	Random, r2, 0, 2
	Random, r3, 38, 42
	Random, r4, 0, 2
	Random, r5, 47, 53
	Random, r6, 117, 123
	Random, r7, 147, 153
	Random, r8, 246, 254
	MouseMove, rnd1, rnd2 - r1, 1
	Click, down
	MouseMove, rnd1, rnd2 + r2, 3
	MouseMove, rnd1, rnd2 + r3, 2
	MouseMove, rnd3, rnd4 + r4, 2
	MouseMove, rnd3, rnd4 + r5, 1
	MouseMove, rnd3, rnd4 + r6, 2
	MouseMove, rnd3, rnd4 + r7, 1
	MouseMove, rnd3, rnd4 + r8, 1
	Click, up
	Random, sleeptime, 5000, 12000
	Sleep, sleeptime
	Click, down
	Sleep, 200
	Click, up
	return
}
