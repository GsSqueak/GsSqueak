I/O primitives
primitiveSetInterruptKey
	"Set the user interrupt keycode. The keycode is an integer whose
	encoding is described in the comment for primitiveKbdNext."
	| _gsSqueakTemp_keycode |
	_gsSqueakTemp_keycode := self stackIntegerValue: 0.
	self successful
		ifTrue: [self setInterruptKeycode: _gsSqueakTemp_keycode.
			self pop: argumentCount]