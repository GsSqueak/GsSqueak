focus events
dispatchFocusEvent: anEventWithGlobalPosition with: focusMorph 
	"Dispatch the given event to the given morph. Simulate capturing
	phase, handle the event, then do bubbling."
	"1) Capturing phase."
	| _gsSqueakTemp_currentEvent |
	_gsSqueakTemp_currentEvent := self doCapturingForFocusEvent: anEventWithGlobalPosition with: focusMorph.
	_gsSqueakTemp_currentEvent == #rejected
		ifTrue: [^ #rejected].
	_gsSqueakTemp_currentEvent wasIgnored
		ifTrue: [^ _gsSqueakTemp_currentEvent].
	"2) No sub-tree processing here. Use #dispatchFocusEventFully:with: if
	you want that, too."
	"3) Let the focus morph handle the event."
	_gsSqueakTemp_currentEvent := self doHandlingForFocusEvent: _gsSqueakTemp_currentEvent with: focusMorph.
	_gsSqueakTemp_currentEvent wasIgnored
		ifTrue: [^ _gsSqueakTemp_currentEvent].
	"4) Bubbling phase"
	^ self doBubblingForFocusEvent: _gsSqueakTemp_currentEvent with: focusMorph