support
doProcessingForFocusEvent: currentEvent with: focusMorph 
	"Sub-tree processing (including capturing from focus morph down to
	something and bubbling up back to focus morph). Never reject in the
	end. "
	| _gsSqueakTemp_localEvent _gsSqueakTemp_filteredEvent |
	_gsSqueakTemp_localEvent := currentEvent
				transformedBy: (focusMorph transformedFrom: currentEvent hand).
	_gsSqueakTemp_filteredEvent := focusMorph processEvent: _gsSqueakTemp_localEvent using: self.
	^ _gsSqueakTemp_filteredEvent == #rejected
		ifTrue: [currentEvent
			"Can happen if you click, e.g., outside the bounds of the focus
			morph "]
		ifFalse: [self
				nextFromOriginal: currentEvent
				local: _gsSqueakTemp_localEvent
				filtered: _gsSqueakTemp_filteredEvent]