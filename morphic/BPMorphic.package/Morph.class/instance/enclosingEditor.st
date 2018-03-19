-Etoys-support
enclosingEditor
	"Return the next editor around the receiver"
	| _gsSqueakTemp_tested |
	_gsSqueakTemp_tested := owner.
	[_gsSqueakTemp_tested isNil]
		whileFalse: [_gsSqueakTemp_tested isTileEditor
				ifTrue: [^ _gsSqueakTemp_tested].
			_gsSqueakTemp_tested := _gsSqueakTemp_tested owner].
	^ nil