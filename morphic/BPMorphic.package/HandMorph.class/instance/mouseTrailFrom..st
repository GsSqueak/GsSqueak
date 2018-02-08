private events
mouseTrailFrom: currentBuf 
	"Current event, a mouse event buffer, is about to be processed. If
	there are other similar mouse events queued up, then drop them
	from the queue, and report the positions inbetween."
	| _gsSqueakTemp_nextEvent _gsSqueakTemp_trail |
	_gsSqueakTemp_trail := WriteStream
				on: (Array new: 1).
	_gsSqueakTemp_trail nextPut: currentBuf third @ currentBuf fourth.
	[(_gsSqueakTemp_nextEvent := Sensor peekEvent) isNil]
		whileFalse: [_gsSqueakTemp_nextEvent first = currentBuf first
				ifFalse: [^ _gsSqueakTemp_trail contents"different event type"].
			_gsSqueakTemp_nextEvent fifth = currentBuf fifth
				ifFalse: [^ _gsSqueakTemp_trail contents"buttons changed"].
			_gsSqueakTemp_nextEvent sixth = currentBuf sixth
				ifFalse: [^ _gsSqueakTemp_trail contents"modifiers changed"].
			"nextEvent is similar. Remove it from the queue, and check
			the next."
			_gsSqueakTemp_nextEvent := Sensor nextEvent.
			_gsSqueakTemp_trail nextPut: _gsSqueakTemp_nextEvent third @ _gsSqueakTemp_nextEvent fourth].
	^ _gsSqueakTemp_trail contents