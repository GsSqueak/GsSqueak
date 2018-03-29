frame access
marryFrame: theFP SP: theSP 
	"Marry an unmarried frame. This means creating a spouse context
	initialized with a subset of the frame's state (state through the last
	argument) that references the frame."
	^ self
		marryFrame: theFP
		SP: theSP
		copyTemps: false