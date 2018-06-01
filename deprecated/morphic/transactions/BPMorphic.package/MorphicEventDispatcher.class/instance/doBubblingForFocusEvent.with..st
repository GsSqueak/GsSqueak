support
doBubblingForFocusEvent: anEvent with: focusMorph 
	"Simulate real event bubbling up to the focused morph's outermost
	owner. Applies event bubble filters via Morph >> #handleEvent:.
	Watch out for coordinate transformations and some globals
	(ActiveWorld, ...)."
	| _gsSqueakTemp_currentEvent _gsSqueakTemp_filteredEvent _gsSqueakTemp_localEvent _gsSqueakTemp_referenceMorph |
	_gsSqueakTemp_currentEvent := anEvent.
	_gsSqueakTemp_referenceMorph := anEvent hand.
	focusMorph
		allOwnersDo: [:ownerMorph | ownerMorph == anEvent hand
				ifFalse: ["Never bubble up to the hand morph but only up to
					the world."
					_gsSqueakTemp_localEvent := _gsSqueakTemp_currentEvent
								transformedBy: (ownerMorph transformedFrom: _gsSqueakTemp_referenceMorph).
					_gsSqueakTemp_filteredEvent := ownerMorph handleEvent: _gsSqueakTemp_localEvent.
					_gsSqueakTemp_currentEvent := self
								nextFromOriginal: _gsSqueakTemp_currentEvent
								local: _gsSqueakTemp_localEvent
								filtered: _gsSqueakTemp_filteredEvent.
					_gsSqueakTemp_currentEvent wasIgnored
						ifTrue: [^ _gsSqueakTemp_currentEvent]]].
	^ _gsSqueakTemp_currentEvent