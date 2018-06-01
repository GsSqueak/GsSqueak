change reporting
limitHandleMove: association event: evt from: handle
	| p  newBounds |
	rampMorphs do:[ : i | i color: (Color white darker)].
	newBounds := gradientDisplay bounds.
	newBounds := (newBounds left: (newBounds left - 10)).
	newBounds := (newBounds right: (newBounds right - 10)). 
	p := (evt cursorPoint - (10@0)) adhereTo: newBounds.
	handle position: (p x )@ (handle position y).
	handle color: Color black.
	self updateColorRamp