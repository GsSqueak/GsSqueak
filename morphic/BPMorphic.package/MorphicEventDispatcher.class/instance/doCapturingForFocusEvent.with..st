support
doCapturingForFocusEvent: anEvent with: focusMorph 
	"Simulate real event capturing down to the focused morph. Apply
	event capture filters. Watch out for coordinate transformations. Keep
	the filter-ignore-reject order like in Morph >> #processEvent:using:."
	| _gsSqueakTemp_currentEvent _gsSqueakTemp_filteredEvent _gsSqueakTemp_localEvent _gsSqueakTemp_referenceMorph |
	_gsSqueakTemp_currentEvent := anEvent.
	_gsSqueakTemp_referenceMorph := anEvent hand.
	"Event capturing. Filters only because the capturing phase was
	bypassed by using the keyboard/mouse focus."
	focusMorph withAllOwners
		reverseDo: [:ownerMorph | "reverse order to comply with regular dispatching"
			ownerMorph == anEvent hand
				ifFalse: ["Never dispatch the hand morph. It already did so."
					_gsSqueakTemp_localEvent := _gsSqueakTemp_currentEvent
								transformedBy: (ownerMorph transformedFrom: _gsSqueakTemp_referenceMorph).
					_gsSqueakTemp_filteredEvent := ownerMorph sendFilterEventCapture: _gsSqueakTemp_localEvent for: ownerMorph.
					"Ignoring has higher priority but the reject-check must
					be with local event coodinates."
					(_gsSqueakTemp_filteredEvent wasIgnored not
							and: [ownerMorph rejectsEvent: _gsSqueakTemp_filteredEvent])
						ifTrue: [^ #rejected].
					_gsSqueakTemp_currentEvent := self
								nextFromOriginal: _gsSqueakTemp_currentEvent
								local: _gsSqueakTemp_localEvent
								filtered: _gsSqueakTemp_filteredEvent.
					_gsSqueakTemp_currentEvent wasIgnored
						ifTrue: [^ _gsSqueakTemp_currentEvent]]].
	^ _gsSqueakTemp_currentEvent