events
mouseDown: event
	"Transfer the halo to the next likely recipient"

	((self containsPoint: event position) not or: [event blueButtonPressed not])
		ifTrue: [
			"Close this halo and give another morph the chance to react."
			event hand removeHalo.
			event resetHandlerFields.
			event hand world processEvent: event.
			^ self].

	self target ifNil: [^self delete].
	event hand obtainHalo: self.

	self positionOffset: (event position - (self target point: self target position in: self owner)).

	"wait for drags or transfer"
	event hand 
		waitForClicksOrDrag: self 
		event: event
		selectors: { #transferHalo:. nil. nil. #startDragTarget:. }
		threshold: HandMorph dragThreshold.