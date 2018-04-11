positioning
adjustPositionVisAVisFlap
	| _gsSqueakTemp_sideToAlignTo _gsSqueakTemp_opposite |
	_gsSqueakTemp_opposite := Utilities oppositeSideTo: edgeToAdhereTo.
	_gsSqueakTemp_sideToAlignTo := inboard
				ifTrue: [_gsSqueakTemp_opposite]
				ifFalse: [edgeToAdhereTo].
	self
		perform: _gsSqueakTemp_sideToAlignTo asSimpleSetter
		with: (referent perform: _gsSqueakTemp_opposite)