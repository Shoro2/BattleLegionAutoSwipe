#Persistent
Random, delay, 3000,6000
Random, chance, 0, 100
if chance >= 90
{
	Random, afktime, 10000,120000
}
if chance < 90
{
	afktime = 0
}
fulltime := afktime + delay
SetTimer, PerformSwipe, %fulltime%
return

PerformSwipe:
Random, rnd1, 1400, 1450 
Random, rnd2, 330, 380 
Random, rnd3, 1400, 1450 
Random, rnd4, 500, 600
MouseClickDrag, Left, rnd1, rnd2, rnd3, rnd4
if(chance >= 90)
{
	Random, afktime, 10000,120000
}
if chance < 90
{
	afktime = 0
}
Random, chance, 0, 100
return