#Persistent
Wait()
PerformSwipe()
Random, Pausenzeit, 180000, 360000
SetTimer, Pause, %Pausenzeit%
counter=0
return

CheckForGameEnd:
counter := counter + 1
WinGetPos, startx, starty, wwidth, wheight, BlueStacks
ImageSearch, FoundX, FoundY, startx,starty, startx + wwidth, starty + wheight, img/border.bmp
ImageSearch, FoundX2, FoundY2, startx,starty, startx + wwidth, starty + wheight, img/pokal.bmp
ImageSearch, FoundX3, FoundY3, startx,starty+ wheight/2, startx + wwidth/2, starty + wheight, img/background.bmp
if (FoundX > 0 || FoundX2 > 0 || FoundX3){
	Wait()
	PerformTap(startx + (wwidth/2) + 80, starty + (wheight/2))
	Wait()
	SetTimer, CheckForGameEnd, delete
	PerformSwipe()
	counter=0
}
if(counter>=40){
	counter=0
	PerformSwipe()
}
return

Pause:
Wait()
if(chance = 100)
{
	Random, delay4, 1800000,3600000
	Sleep, delay4
} 
Random, delay3, 1, 1000
Sleep, delay3
SetTimer, Pause, delete
Random, nextPause, 60000, 600000
SetTimer, Pause, %nextPause%
return

CheckForLoot()
{
	found = false
	WinGetPos, startx, starty, wwidth, wheight, BlueStacks
	FoundX = 0
	ImageSearch, FoundX, FoundY, startx,starty, startx + wwidth, starty + wheight, img/loot1.jpg
	if (FoundX > 0){
		found = 1
	}
	ImageSearch, FoundX, FoundY, startx,starty, startx + wwidth, starty + wheight, img/loot2.jpg
	if (FoundX > 0){
		found = 2
	}
	FoundX = 0
	ImageSearch, FoundX, FoundY, startx,starty, startx + wwidth, starty + wheight, img/loot3.jpg
	if (FoundX > 0){
		found = 3
	}
	switch found{
		case 1:
			PerformTap(FoundX, FoundY)
			Wait()
			PerformTap(FoundX, FoundY)
			Wait()
			return
		case 2:
			PerformTap(FoundX, FoundY)
			Wait()
			PerformTap(FoundX, FoundY)
			Wait()
			PerformTap(FoundX, FoundY)
			Wait()
			PerformTap(FoundX, FoundY)
			Wait()
			return
		case 3:
			PerformTap(FoundX, FoundY)
			Wait()
			PerformTap(FoundX, FoundY)
			Wait()
			PerformTap(FoundX, FoundY)
			Wait()
			PerformTap(FoundX, FoundY)
			Wait()
			PerformTap(FoundX, FoundY)
			Wait()
			return
		default:
			return
	}
	PerformSwipe()
}


Wait(){
	Random, delay, 1000,4000
	Sleep, delay
}

PerformTap(x,y){
	Random, offset1, -5, 5
	Random, offset2, -5, 5
	MouseMove, x+offset1, y+offset2, 1
	Click, down
	Sleep, 100
	Click, up
}

PerformSwipe()
{
	if WinExist("BlueStacks")
	{
		Wait()
		WinGetPos, startx, starty, wwidth, wheight, BlueStacks
		FoundX=0
		ImageSearch, FoundX, FoundY, startx + wwidth/2,starty, startx + wwidth, starty + wheight/2, img/fight.bmp
		if (FoundX > 0)
		{
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
			
			Wait()
			FoundX=0
			ImageSearch, FoundX, FoundY, startx + wwidth/2,starty, startx + wwidth, starty + wheight/2, img/fight.bmp
			if(FoundX>0){
				PerformSwipe()
			}
			else{
				SetTimer, CheckForGameEnd, 2000
			}
			
		}
		else{
			Wait()
			PerformSwipe()
			
		}
	}
	
}
