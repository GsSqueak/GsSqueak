change reporting
addHandles
	| handle colorRamp |
	rampMorphs := OrderedCollection new.
	colorRamp := gradientDisplay colorRamp asOrderedCollection.
	handle := self handle.
	colorRamp
		do: [:i | 
			self addHandleForColor: i value position: i key
			].
	
	self changed.