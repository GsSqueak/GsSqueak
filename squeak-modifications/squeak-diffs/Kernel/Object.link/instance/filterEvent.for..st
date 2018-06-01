*Morphic-Events-Filtering
filterEvent: anEvent for: aMorphOrNil
	"Get the chance to intercept the event. Note that global event filters might not be provided with the actual target. Returns the event that should be processed any further. If you want to ignore them, call #ignore on them."
	
	^ anEvent "no change"