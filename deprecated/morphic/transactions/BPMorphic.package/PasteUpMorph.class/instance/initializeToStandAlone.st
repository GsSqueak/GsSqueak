parts bin
initializeToStandAlone
	"Answer an instance of the receiver suitable for placing in a parts bin
	for authors"
	self initialize.
	self color: Color green muchLighter;
		 extent: 100 @ 80;
		
		borderColor: (Color
				r: 0.645
				g: 0.935
				b: 0.161).
	self extent: 300 @ 240.
	self beSticky