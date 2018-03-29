I/O primitives
primitiveMouseButtons
	"Obsolete on virtually all platforms; old style input polling code.
	Return the mouse button state. The low three bits encode the state of
	the <red><yellow><blue> mouse buttons. The next four bits encode
	the Smalltalk modifier bits <cmd><option><ctrl><shift>."
	| _gsSqueakTemp_buttonWord |
	self pop: 1.
	_gsSqueakTemp_buttonWord := self ioGetButtonState.
	self pushInteger: _gsSqueakTemp_buttonWord