selection
setSelectedMorph: aMorph 
	super setSelectedMorph: aMorph.
self owner isNil ifFalse:[self owner delete]