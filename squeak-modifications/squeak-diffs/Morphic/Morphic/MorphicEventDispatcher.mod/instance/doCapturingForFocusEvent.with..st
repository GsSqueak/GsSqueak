support
doCapturingForFocusEvent: anEvent with: focusMorph
	"Simulate real event capturing down to the focused morph. Apply event capture filters. Watch out for coordinate transformations. Keep the filter-ignore-reject order like in Morph >> #processEvent:using:."

	| currentEvent filteredEvent localEvent referenceMorph |
	currentEvent := anEvent.
	referenceMorph := anEvent hand.

	"Event capturing. Filters only because the capturing phase was bypassed by using the keyboard/mouse focus."
	focusMorph withAllOwners reverseDo: [:ownerMorph | "reverse order to comply with regular dispatching"
		ownerMorph == anEvent hand ifFalse: [ "Never dispatch the hand morph. It already did so."
			localEvent := currentEvent transformedBy: (ownerMorph transformedFrom: referenceMorph).
			
			filteredEvent := ownerMorph sendFilterEventCapture: localEvent for: ownerMorph.
			
			"Ignoring has higher priority but the reject-check must be with local event coodinates."
			(filteredEvent wasIgnored not and: [ownerMorph rejectsEvent: filteredEvent])
				ifTrue: [^ #rejected].
			
			currentEvent := self nextFromOriginal: currentEvent local: localEvent filtered: filteredEvent.
			currentEvent wasIgnored ifTrue: [^ currentEvent]]].
	
	^ currentEvent