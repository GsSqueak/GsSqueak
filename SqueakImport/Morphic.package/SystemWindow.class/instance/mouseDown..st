events
mouseDown: evt

	evt hand 
		waitForClicksOrDrag: self 
		event: evt 
		selectors: { nil. nil. nil. #startDragFromLabel: }
		threshold: HandMorph dragThreshold.