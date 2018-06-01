linked frames
firstInChain
	"Return the first morph in a chain of textMorphs"
	| _gsSqueakTemp_first |
	_gsSqueakTemp_first := self.
	[_gsSqueakTemp_first predecessor isNil]
		whileFalse: [_gsSqueakTemp_first := _gsSqueakTemp_first predecessor].
	^ _gsSqueakTemp_first