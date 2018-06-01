events
blueButtonDown: event 
	"Transfer the halo to the next likely recipient"
	self target
		ifNil: [^ self delete].
	event hand obtainHalo: self.
	self positionOffset: event position
			- (self target point: self target position in: self owner).
	"wait for drags or transfer"
	event hand
		waitForClicksOrDrag: self
		event: event
		selectors: {#transferHalo:. nil. nil. #startDragTarget:}
		threshold: HandMorph dragThreshold