-Etoys-support
topEditor
	"Return the top-most editor around the receiver"
	| _gsSqueakTemp_found _gsSqueakTemp_tested |
	_gsSqueakTemp_tested := self.
	[_gsSqueakTemp_tested isNil]
		whileFalse: [_gsSqueakTemp_tested isTileEditor
				ifTrue: [_gsSqueakTemp_found := _gsSqueakTemp_tested].
			_gsSqueakTemp_tested := _gsSqueakTemp_tested owner].
	^ _gsSqueakTemp_found