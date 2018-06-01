support
doBubblingForFocusEvent: anEvent with: focusMorph
	"Simulate real event bubbling up to the focused morph's outermost owner. Applies event bubble filters via Morph >> #handleEvent:. Watch out for coordinate transformations and some globals (ActiveWorld, ...)."

	| currentEvent filteredEvent localEvent referenceMorph |
	currentEvent := anEvent.
	referenceMorph := anEvent hand.

	focusMorph allOwnersDo: [:ownerMorph |
		ownerMorph == anEvent hand ifFalse: [ "Never bubble up to the hand morph but only up to the world."
			localEvent := currentEvent transformedBy: (ownerMorph transformedFrom: referenceMorph).
			filteredEvent := ownerMorph handleEvent: localEvent.
			currentEvent := self nextFromOriginal: currentEvent local: localEvent filtered: filteredEvent.
			currentEvent wasIgnored ifTrue: [^ currentEvent]]].

	^ currentEvent