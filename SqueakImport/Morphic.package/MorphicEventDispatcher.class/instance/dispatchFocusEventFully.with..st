focus events
dispatchFocusEventFully: anEventWithGlobalPosition with: focusMorph
	"Dispatch the given event to the given morph. Do capturing, processing in sub-tree, and bubbling."
	
	| currentEvent |
	"1) Capturing phase."
	currentEvent := self doCapturingForFocusEvent: anEventWithGlobalPosition with: focusMorph.
	currentEvent == #rejected ifTrue: [
		"See implementors of #rejectsEvent:, which is usually based on receiver state and not event state. Thus, reset foci to avoid unresponsive environment."
		anEventWithGlobalPosition hand
			releaseKeyboardFocus: focusMorph;
			releaseMouseFocus: focusMorph.
		^ #rejected].
	"No need to reset foci here for ignored events because not all events might be ignored. Unlike #rejected."
	currentEvent wasIgnored ifTrue: [^ currentEvent].
	
	"2) Sub-tree processing."
	currentEvent := self doProcessingForFocusEvent: currentEvent with: focusMorph.
	currentEvent wasIgnored ifTrue: [^ currentEvent].

	"3) Let the focus morph handle the event. Usually no effect because previous sub-tree processing involved the focus morph already -- at least in the bubbling phase. Skip it?"
	currentEvent := self doHandlingForFocusEvent: currentEvent with: focusMorph.
	currentEvent wasIgnored ifTrue: [^ currentEvent].
	
	"4) Bubbling phase."
	^ self doBubblingForFocusEvent: currentEvent with: focusMorph