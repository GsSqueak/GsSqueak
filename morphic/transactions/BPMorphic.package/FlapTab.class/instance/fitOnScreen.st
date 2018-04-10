positioning
fitOnScreen
	"19 sept 2000 - allow flaps in any paste up"
	| _gsSqueakTemp_constrainer _gsSqueakTemp_t _gsSqueakTemp_l |
	_gsSqueakTemp_constrainer := (owner
				ifNil: [self]) clearArea.
	self flapShowing
		ifTrue: ["otherwise no point in doing this"
			self spanWorld].
	self orientation == #vertical
		ifTrue: [_gsSqueakTemp_t := (self top min: _gsSqueakTemp_constrainer bottom - self height)
						max: _gsSqueakTemp_constrainer top.
			_gsSqueakTemp_t = self top
				ifFalse: [self top: _gsSqueakTemp_t]]
		ifFalse: [_gsSqueakTemp_l := (self left min: _gsSqueakTemp_constrainer right - self width)
						max: _gsSqueakTemp_constrainer left.
			_gsSqueakTemp_l = self left
				ifFalse: [self left: _gsSqueakTemp_l]].
	self flapShowing
		ifFalse: [self positionObject: self atEdgeOf: _gsSqueakTemp_constrainer]