event handling
mouseDown: evt

	evt shiftPressed ifTrue: [^self].
	self isSticky ifTrue: [^self].
	evt hand grabMorph: self.