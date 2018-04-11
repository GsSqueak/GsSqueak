support
doHandlingForFocusEvent: currentEvent with: focusMorph 
	| _gsSqueakTemp_localEvent _gsSqueakTemp_filteredEvent |
	_gsSqueakTemp_localEvent := currentEvent
				transformedBy: (focusMorph transformedFrom: currentEvent hand).
	_gsSqueakTemp_filteredEvent := focusMorph handleFocusEvent: _gsSqueakTemp_localEvent.
	^ self
		nextFromOriginal: currentEvent
		local: _gsSqueakTemp_localEvent
		filtered: _gsSqueakTemp_filteredEvent