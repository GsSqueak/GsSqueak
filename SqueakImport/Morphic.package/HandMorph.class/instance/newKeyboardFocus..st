focus handling
newKeyboardFocus: aMorphOrNil
	"Make the given morph the new keyboard focus, canceling the previous keyboard focus if any. If the argument is nil, the current keyboard focus is cancelled."
	
	| oldFocus newFocus |
	oldFocus := self keyboardFocus.
	newFocus := aMorphOrNil ifNotNil: [:m | m keyboardFocusDelegate].
	
	self keyboardFocus: newFocus.
	
	oldFocus == newFocus ifFalse: [
		oldFocus ifNotNil: [:m | m keyboardFocusChange: false].
		newFocus ifNotNil: [:m | m keyboardFocusChange: true]].
	
	newFocus ifNotNil: [:m |
		self compositionWindowManager keyboardFocusForAMorph: m].

	^ newFocus
