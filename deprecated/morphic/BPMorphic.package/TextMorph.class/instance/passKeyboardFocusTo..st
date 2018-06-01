editing
passKeyboardFocusTo: otherMorph 
	| _gsSqueakTemp_w |
	self flag: #arNote.
	"Do we need this?!"
	(_gsSqueakTemp_w := self world) isNil
		ifFalse: [_gsSqueakTemp_w
				handsDo: [:h | h keyboardFocus == self
						ifTrue: [h newKeyboardFocus: otherMorph]]]