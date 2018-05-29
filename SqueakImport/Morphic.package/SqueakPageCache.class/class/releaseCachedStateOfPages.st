housekeeping
releaseCachedStateOfPages
	"Note: This shouldn't be necessary if we are doing a good job of releasing cached state as we go. If running this doesn't do very much, we're doing well!"
	"SqueakPageCache releaseCachedStateOfPages"

	| memBytes |
	memBytes := Smalltalk garbageCollect.
	PageCache do: [:pg |
		pg contentsMorph allMorphsDo: [:m | m releaseCachedState]].
	^ (Smalltalk garbageCollect - memBytes) printString, ' bytes recovered'
