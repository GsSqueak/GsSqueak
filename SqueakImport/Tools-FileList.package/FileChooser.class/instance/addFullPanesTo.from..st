ui creation
addFullPanesTo: aMorph from: aCollection
	aCollection do: [ :each |
		| frame |
		frame := LayoutFrame 
			fractions: each second 
			offsets: each third.
		aMorph addMorph: each first fullFrame: frame.
	]