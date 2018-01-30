scripting
authoringPrototype
	"Answer an instance of the receiver suitable for placing in a parts bin
	for authors"
	| proto |
	proto := self new markAsPartsDonor.
	proto color: Color green muchLighter;
		 extent: 100 @ 80;
		
		borderColor: (Color
				r: 0.645
				g: 0.935
				b: 0.161).
	proto extent: 300 @ 240.
	proto beSticky.
	^ proto