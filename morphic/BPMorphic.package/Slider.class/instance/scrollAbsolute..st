scrolling
scrollAbsolute: event 
	| _gsSqueakTemp_r _gsSqueakTemp_p |
	_gsSqueakTemp_r := self roomToMove.
	self orientation == #horizontal
		ifTrue: [_gsSqueakTemp_r width = 0
				ifTrue: [^ self]]
		ifFalse: [_gsSqueakTemp_r height = 0
				ifTrue: [^ self]].
	_gsSqueakTemp_p := event targetPoint adhereTo: _gsSqueakTemp_r.
	self descending
		ifTrue: [self
				setValueFraction: (self orientation == #horizontal
						ifTrue: [(_gsSqueakTemp_r right - _gsSqueakTemp_p x) asFloat / _gsSqueakTemp_r width]
						ifFalse: [(_gsSqueakTemp_r bottom - _gsSqueakTemp_p y) asFloat / _gsSqueakTemp_r height])]
		ifFalse: [self
				setValueFraction: (self orientation == #horizontal
						ifTrue: [(_gsSqueakTemp_p x - _gsSqueakTemp_r left) asFloat / _gsSqueakTemp_r width]
						ifFalse: [(_gsSqueakTemp_p y - _gsSqueakTemp_r top) asFloat / _gsSqueakTemp_r height])]