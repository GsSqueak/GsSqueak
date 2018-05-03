debugging traps
moveFramesIn: thePage through: frameAbove toPage: newPage
	"| thisPage |
	(self checkIsStillMarriedContext: 22189568 currentFP: framePointer) ifTrue:
		[thisPage := stackPages stackPageFor: (self frameOfMarriedContext: 22189568).
		 (thePage == thisPage or: [newPage == thisPage]) ifTrue:
			[self halt]]."
	^super moveFramesIn: thePage through: frameAbove toPage: newPage