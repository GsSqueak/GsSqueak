initialization
showTransitionFrom: startingMorph to: endingMorph in: containingMorph whenStart: firstBlock whenDone: doneBlock 
	effect == #none
		ifTrue: [firstBlock value.
			^ doneBlock value].
	self
		startMorph: startingMorph
		endMorph: endingMorph
		startBlock: firstBlock
		completionBlock: doneBlock.
	stepNumber := 0.
	self bounds: startingMorph bounds.
	endingMorph privateOwner: self.
	"Allows test of transition in progress"
	containingMorph owner
		privateAddMorph: self
		atIndex: (containingMorph owner submorphs indexOf: containingMorph).
	self initiateReplacement