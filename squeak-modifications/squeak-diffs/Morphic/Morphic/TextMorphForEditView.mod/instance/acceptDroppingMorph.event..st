dropping/grabbing
acceptDroppingMorph: aTransferMorph event: evt
	"Accept a text to be inserted at the event/cursor position. Either remove or keep the source text depending on the transfer morph's copy state."
	
	| sourceEditor |
	sourceEditor := (aTransferMorph source respondsTo: #editor)
		ifTrue: [aTransferMorph source editor]
		ifFalse: [nil].

	self
		handleInteraction: [
			
			"1) Delete selection if it is a move operation."
			(aTransferMorph shouldCopy or: [sourceEditor isNil]) ifFalse: [
				sourceEditor destructiveBackWord.
				sourceEditor history previous isCompositeRedo: sourceEditor == self editor].
			
			"2) Insert selection at new place."
			self editor addText: aTransferMorph passenger asText event: evt.
			self editor history previous
				isCompositeUndo: (sourceEditor == self editor and: [aTransferMorph shouldCopy not])]

		fromEvent: evt.
	
	evt hand newKeyboardFocus: self.