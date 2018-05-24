events-processing
sendFilterEventCaptureAgain: anEvent for: anObjectOrNil
	"Apply keyboard-specific and mouse-specific capturing filters. If a filter changes the event type, filter again. WARNING: This is a powerful mechanism. Filters can create endless loops, which are difficult to debug.
	
	Overwritten to provide keyboard and mouse focus holders to event filters. Note that hence the event target in such global filters can be nil."

	| filteredEvent |
	filteredEvent := anEvent.
	
	filteredEvent isKeyboard ifTrue: [
		filteredEvent := self sendFilterEvent: filteredEvent for: self keyboardFocus to: self keyboardCaptureFilters.
		filteredEvent isKeyboard not ifTrue: [^ self sendFilterEventCaptureAgain: filteredEvent for: anObjectOrNil]].
		
	filteredEvent isMouse ifTrue: [
		filteredEvent := self sendFilterEvent: filteredEvent for: self mouseFocus to: self mouseCaptureFilters.
		filteredEvent isMouse not ifTrue: [^ self sendFilterEventCaptureAgain: filteredEvent for: anObjectOrNil]].

	^ filteredEvent