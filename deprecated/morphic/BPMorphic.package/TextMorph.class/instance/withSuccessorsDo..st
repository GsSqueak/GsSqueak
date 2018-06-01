linked frames
withSuccessorsDo: aBlock 
	"Evaluate aBlock for each morph in my successor chain"
	| _gsSqueakTemp_each |
	_gsSqueakTemp_each := self.
	[_gsSqueakTemp_each isNil]
		whileFalse: [aBlock value: _gsSqueakTemp_each.
			_gsSqueakTemp_each := _gsSqueakTemp_each successor]