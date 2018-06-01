support
doProcessingForFocusEvent: currentEvent with: focusMorph
	"Sub-tree processing (including capturing from focus morph down to something and bubbling up back to focus morph). Never reject in the end."
	
	| localEvent filteredEvent |
	localEvent := currentEvent transformedBy: (focusMorph transformedFrom: currentEvent hand).
	filteredEvent := focusMorph processEvent: localEvent using: self.
	^ filteredEvent == #rejected
		ifTrue: [currentEvent] "Can happen if you click, e.g., outside the bounds of the focus morph"
		ifFalse: [self nextFromOriginal: currentEvent local: localEvent filtered: filteredEvent]