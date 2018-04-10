focus events
dispatchFocusEventFully: anEventWithGlobalPosition with: focusMorph 
	"Dispatch the given event to the given morph. Do capturing,
	processing in sub-tree, and bubbling."
	"1) Capturing phase."
	| _gsSqueakTemp_currentEvent |
	_gsSqueakTemp_currentEvent := self doCapturingForFocusEvent: anEventWithGlobalPosition with: focusMorph.
	_gsSqueakTemp_currentEvent == #rejected
		ifTrue: [^ #rejected].
	_gsSqueakTemp_currentEvent wasIgnored
		ifTrue: [^ _gsSqueakTemp_currentEvent].
	"2) Sub-tree processing."
	_gsSqueakTemp_currentEvent := self doProcessingForFocusEvent: _gsSqueakTemp_currentEvent with: focusMorph.
	_gsSqueakTemp_currentEvent wasIgnored
		ifTrue: [^ _gsSqueakTemp_currentEvent].
	"3) Let the focus morph handle the event. Usually no effect because
	previous sub-tree processing involved the focus morph already -- at
	least in the bubbling phase. Skip it?"
	_gsSqueakTemp_currentEvent := self doHandlingForFocusEvent: _gsSqueakTemp_currentEvent with: focusMorph.
	_gsSqueakTemp_currentEvent wasIgnored
		ifTrue: [^ _gsSqueakTemp_currentEvent].
	"4) Bubbling phase."
	^ self doBubblingForFocusEvent: _gsSqueakTemp_currentEvent with: focusMorph