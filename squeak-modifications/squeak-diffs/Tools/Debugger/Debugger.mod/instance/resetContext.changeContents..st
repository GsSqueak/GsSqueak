private
resetContext: aContext changeContents: aBoolean
	"Used when a new context becomes top-of-stack, for instance when the
	method of the selected context is re-compiled, or the simulator steps or
	returns to a new method. There is room for much optimization here, first
	to save recomputing the whole stack list (and text), and secondly to avoid
	recomposing all that text (by editing the paragraph instead of recreating it)."

	| oldContext |
	oldContext := self selectedContext.
	self newStack: (aContext ifNil: [oldContext]) contextStack.
	self changed: #contextStackList; changed: #interruptedProcessIsActive.
	self contextStackIndex: 1 oldContextWas: oldContext.
	aBoolean ifTrue: [self contentsChanged].
