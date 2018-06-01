events-processing
sendFilterEventCaptureAgain: anEvent for: anObjectOrNil 
	"Apply keyboard-specific and mouse-specific capturing filters. If a filter
	changes the event type, filter again. WARNING: This is a powerful
	mechanism. Filters can create endless loops, which are difficult to
	debug. 
	Overwritten to provide keyboard and mouse focus holders to event
	filters. Note that hence the event target in such global filters can be
	nil. "
	| _gsSqueakTemp_filteredEvent |
	_gsSqueakTemp_filteredEvent := anEvent.
	_gsSqueakTemp_filteredEvent isKeyboard
		ifTrue: [_gsSqueakTemp_filteredEvent := self
						sendFilterEvent: _gsSqueakTemp_filteredEvent
						for: self keyboardFocus
						to: self keyboardCaptureFilters.
			_gsSqueakTemp_filteredEvent isKeyboard not
				ifTrue: [^ self sendFilterEventCaptureAgain: _gsSqueakTemp_filteredEvent for: anObjectOrNil]].
	_gsSqueakTemp_filteredEvent isMouse
		ifTrue: [_gsSqueakTemp_filteredEvent := self
						sendFilterEvent: _gsSqueakTemp_filteredEvent
						for: self mouseFocus
						to: self mouseCaptureFilters.
			_gsSqueakTemp_filteredEvent isMouse not
				ifTrue: [^ self sendFilterEventCaptureAgain: _gsSqueakTemp_filteredEvent for: anObjectOrNil]].
	^ _gsSqueakTemp_filteredEvent