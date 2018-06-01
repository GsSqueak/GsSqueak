accessing
descentKern
	"Return the kern delta for descenders."

	self depth > 1 ifTrue: [^ 0].

	"Optimization for traditional 1-bit fonts."
	^ (emphasis allMask: 2)
		ifFalse: [0]
		ifTrue: [(self height-1-self ascent+4)//4 max: 0]  "See makeItalicGlyphs"

