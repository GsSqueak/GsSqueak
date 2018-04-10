-Etoys-geometry
wrap
	| _gsSqueakTemp_myBox _gsSqueakTemp_box _gsSqueakTemp_newX _gsSqueakTemp_newY _gsSqueakTemp_wrapped |
	owner
		ifNil: [^ self].
	_gsSqueakTemp_myBox := self fullBounds.
	_gsSqueakTemp_myBox corner < (50000 @ 50000)
		ifFalse: [self inform: 'Who is trying to wrap a hidden object?'.
			^ self].
	_gsSqueakTemp_box := owner bounds.
	_gsSqueakTemp_newX := self position x.
	_gsSqueakTemp_newY := self position y.
	_gsSqueakTemp_wrapped := false.
	(_gsSqueakTemp_myBox right < _gsSqueakTemp_box left
			or: [_gsSqueakTemp_myBox left > _gsSqueakTemp_box right])
		ifTrue: [_gsSqueakTemp_newX := _gsSqueakTemp_box left + (self position x - _gsSqueakTemp_box left \\ _gsSqueakTemp_box width).
			_gsSqueakTemp_wrapped := true].
	(_gsSqueakTemp_myBox bottom < _gsSqueakTemp_box top
			or: [_gsSqueakTemp_myBox top > _gsSqueakTemp_box bottom])
		ifTrue: [_gsSqueakTemp_newY := _gsSqueakTemp_box top + (self position y - _gsSqueakTemp_box top \\ _gsSqueakTemp_box height).
			_gsSqueakTemp_wrapped := true].
	self position: _gsSqueakTemp_newX @ _gsSqueakTemp_newY.
	(_gsSqueakTemp_wrapped
			and: [owner isPlayfieldLike])
		ifTrue: [owner changed]