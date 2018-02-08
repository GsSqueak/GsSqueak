private events
generateMouseEvent: evtBuf 
	"Generate the appropriate mouse event for the given raw event buffer"
	| _gsSqueakTemp_position _gsSqueakTemp_buttons _gsSqueakTemp_modifiers _gsSqueakTemp_type _gsSqueakTemp_trail _gsSqueakTemp_stamp _gsSqueakTemp_oldButtons _gsSqueakTemp_evtChanged |
	evtBuf first = lastEventBuffer first
		ifTrue: ["Workaround for Mac VM bug, *always* generating 3 events on
			clicks "
			_gsSqueakTemp_evtChanged := false.
			3
				to: evtBuf size
				do: [:i | (lastEventBuffer at: i)
							= (evtBuf at: i)
						ifFalse: [_gsSqueakTemp_evtChanged := true]].
			_gsSqueakTemp_evtChanged
				ifFalse: [^ nil]].
	_gsSqueakTemp_stamp := evtBuf second.
	_gsSqueakTemp_stamp = 0
		ifTrue: [_gsSqueakTemp_stamp := Time eventMillisecondClock].
	_gsSqueakTemp_position := evtBuf third @ evtBuf fourth.
	_gsSqueakTemp_buttons := evtBuf fifth.
	_gsSqueakTemp_modifiers := evtBuf sixth.
	_gsSqueakTemp_type := _gsSqueakTemp_buttons = 0
				ifTrue: [lastEventBuffer fifth = 0
						ifTrue: [#mouseMove
							"button states are the same .. now and past ..
							therfore a mouse movement"]
						ifFalse: [#mouseUp]]
				ifFalse: [_gsSqueakTemp_buttons = lastEventBuffer fifth
						ifTrue: [#mouseMove
							"button states are the same .. now and past ..
							therfore a mouse movement"]
						ifFalse: ["button states are different .. button was
							pressed or released"
							_gsSqueakTemp_buttons > lastEventBuffer fifth
								ifTrue: [#mouseDown]
								ifFalse: [#mouseUp]]].
	_gsSqueakTemp_buttons := _gsSqueakTemp_buttons
				bitOr: (_gsSqueakTemp_modifiers bitShift: 3).
	_gsSqueakTemp_oldButtons := lastEventBuffer fifth
				bitOr: (lastEventBuffer sixth bitShift: 3).
	lastEventBuffer := evtBuf.
	_gsSqueakTemp_type == #mouseMove
		ifTrue: [_gsSqueakTemp_trail := self mouseTrailFrom: evtBuf.
			^ MouseMoveEvent new
				setType: _gsSqueakTemp_type
				startPoint: self position
				endPoint: _gsSqueakTemp_trail last
				trail: _gsSqueakTemp_trail
				buttons: _gsSqueakTemp_buttons
				hand: self
				stamp: _gsSqueakTemp_stamp].
	^ MouseButtonEvent new
		setType: _gsSqueakTemp_type
		position: _gsSqueakTemp_position
		which: (_gsSqueakTemp_oldButtons bitXor: _gsSqueakTemp_buttons)
		buttons: _gsSqueakTemp_buttons
		hand: self
		stamp: _gsSqueakTemp_stamp