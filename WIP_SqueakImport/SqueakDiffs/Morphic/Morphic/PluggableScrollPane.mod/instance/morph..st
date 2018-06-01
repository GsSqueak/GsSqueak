accessing
morph: morphToScroll

	morph ifNotNil: [:m | m removeDependent: self].

	morphToScroll topLeft: 0@0.
	morph := morphToScroll.
	morphClass := morphToScroll class.

	morph addDependent: self.

	self scroller
		removeAllMorphs;
		addMorph: morph.
	
	self updateMorph.