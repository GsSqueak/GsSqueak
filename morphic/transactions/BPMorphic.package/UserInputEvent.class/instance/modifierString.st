printing
modifierString
	"Return a string identifying the currently pressed modifiers"
	| _gsSqueakTemp_string |
	_gsSqueakTemp_string := ''.
	self commandKeyPressed
		ifTrue: [_gsSqueakTemp_string := _gsSqueakTemp_string , 'CMD '].
	self shiftPressed
		ifTrue: [_gsSqueakTemp_string := _gsSqueakTemp_string , 'SHIFT '].
	self controlKeyPressed
		ifTrue: [_gsSqueakTemp_string := _gsSqueakTemp_string , 'CTRL '].
	^ _gsSqueakTemp_string