support
doHandlingForFocusEvent: currentEvent with: focusMorph

	| localEvent filteredEvent |
	localEvent := currentEvent transformedBy: (focusMorph transformedFrom: currentEvent hand).
	filteredEvent := focusMorph handleFocusEvent: localEvent.
	^ self nextFromOriginal: currentEvent local: localEvent filtered: filteredEvent.