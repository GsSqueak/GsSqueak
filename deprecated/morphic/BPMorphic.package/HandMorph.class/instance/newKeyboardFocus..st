focus handling
newKeyboardFocus: aMorphOrNil 
	"Make the given morph the new keyboard focus, canceling the
	previous keyboard focus if any. If the argument is nil, the current
	keyboard focus is cancelled."
	| _gsSqueakTemp_oldFocus _gsSqueakTemp_newFocus |
	_gsSqueakTemp_oldFocus := self keyboardFocus.
	_gsSqueakTemp_newFocus := aMorphOrNil
				ifNotNil: [:m | m keyboardFocusDelegate].
	self keyboardFocus: _gsSqueakTemp_newFocus.
	_gsSqueakTemp_oldFocus == _gsSqueakTemp_newFocus
		ifFalse: [_gsSqueakTemp_oldFocus
				ifNotNil: [:m | m keyboardFocusChange: false].
			_gsSqueakTemp_newFocus
				ifNotNil: [:m | m keyboardFocusChange: true]].
	_gsSqueakTemp_newFocus
		ifNotNil: [:m | self compositionWindowManager keyboardFocusForAMorph: m].
	^ _gsSqueakTemp_newFocus