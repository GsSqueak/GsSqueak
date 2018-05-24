events-processing
mouseDown: evt

	(self fullContainsPoint: evt position) ifFalse: [
		self selectItem: nil event: evt.
		self deleteIfPopUp: evt ]