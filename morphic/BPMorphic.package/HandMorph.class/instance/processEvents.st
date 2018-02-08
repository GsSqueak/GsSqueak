event handling
processEvents
	"Process user input events from the local input devices."
	| _gsSqueakTemp_evt _gsSqueakTemp_evtBuf _gsSqueakTemp_type _gsSqueakTemp_hadAny |
	ActiveEvent
		ifNotNil: ["Meaning that we were invoked from within an event response.
			Make sure z-order is up to date"
			self mouseOverHandler processMouseOver: lastMouseEvent].
	_gsSqueakTemp_hadAny := false.
	[(_gsSqueakTemp_evtBuf := Sensor nextEvent) isNil]
		whileFalse: [_gsSqueakTemp_evt := nil.
			"for unknown event types"
			_gsSqueakTemp_type := _gsSqueakTemp_evtBuf first.
			_gsSqueakTemp_type = EventTypeMouse
				ifTrue: [_gsSqueakTemp_evt := self generateMouseEvent: _gsSqueakTemp_evtBuf].
			_gsSqueakTemp_type = EventTypeMouseWheel
				ifTrue: [_gsSqueakTemp_evt := self generateMouseWheelEvent: _gsSqueakTemp_evtBuf].
			_gsSqueakTemp_type = EventTypeKeyboard
				ifTrue: [_gsSqueakTemp_evt := self generateKeyboardEvent: _gsSqueakTemp_evtBuf].
			_gsSqueakTemp_type = EventTypeDragDropFiles
				ifTrue: [_gsSqueakTemp_evt := self generateDropFilesEvent: _gsSqueakTemp_evtBuf].
			_gsSqueakTemp_type = EventTypeWindow
				ifTrue: [_gsSqueakTemp_evt := self generateWindowEvent: _gsSqueakTemp_evtBuf].
			"All other events are ignored"
			(_gsSqueakTemp_type ~= EventTypeDragDropFiles
					and: [_gsSqueakTemp_evt isNil])
				ifTrue: [^ self].
			_gsSqueakTemp_evt isNil
				ifFalse: ["Finally, handle it"
					self handleEvent: _gsSqueakTemp_evt.
					_gsSqueakTemp_hadAny := true.
					"For better user feedback, return immediately after a
					mouse event has been processed."
					_gsSqueakTemp_evt isMouse
						ifTrue: [^ self]]].
	"note: if we come here we didn't have any mouse events"
	mouseClickState notNil
		ifTrue: ["No mouse events during this cycle. Make sure click states
			time out accordingly"
			mouseClickState handleEvent: lastMouseEvent asMouseMove from: self].
	_gsSqueakTemp_hadAny
		ifFalse: ["No pending events. Make sure z-order is up to date"
			self mouseOverHandler processMouseOver: lastMouseEvent]