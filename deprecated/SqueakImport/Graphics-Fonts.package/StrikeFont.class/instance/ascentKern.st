accessing
ascentKern
	"Return the kern delta for ascenders."
	
	self depth > 1 ifTrue: [^ 0].
	
	"Optimization for traditional 1-bit fonts."
	^ (emphasis allMask: 2)
		ifFalse: [0]
		ifTrue: [(self ascent-5+4)//4 max: 0]  "See makeItalicGlyphs"

