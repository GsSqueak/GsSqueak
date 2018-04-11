events-processing
sendFilterEventCaptureAgain: anEvent for: anObject 
	"Apply keyboard-specific and mouse-specific capturing filters. If a filter
	changes the event type, filter again. WARNING: This is a powerful
	mechanism. Filters can create endless loops, which are difficult to
	debug. "
	| filteredEvent |
	filteredEvent := anEvent.
	filteredEvent isKeyboard
		ifTrue: [filteredEvent := self
						sendFilterEvent: filteredEvent
						for: anObject
						to: self keyboardCaptureFilters.
			filteredEvent isKeyboard not
				ifTrue: [^ self sendFilterEventCaptureAgain: filteredEvent for: anObject]].
	filteredEvent isMouse
		ifTrue: [filteredEvent := self
						sendFilterEvent: filteredEvent
						for: anObject
						to: self mouseCaptureFilters.
			filteredEvent isMouse not
				ifTrue: [^ self sendFilterEventCaptureAgain: filteredEvent for: anObject]].
	^ filteredEvent