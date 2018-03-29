I/O primitives
primitiveKbdPeek
	"Obsolete on virtually all platforms; old style input polling code.
	Return the next keycode and without removing it from the input
	buffer. The low byte is the 8-bit ISO character. The next four bits are
	the Smalltalk modifier bits <cmd><option><ctrl><shift>."
	| _gsSqueakTemp_keystrokeWord |
	self pop: 1.
	_gsSqueakTemp_keystrokeWord := self ioPeekKeystroke.
	_gsSqueakTemp_keystrokeWord >= 0
		ifTrue: [self pushInteger: _gsSqueakTemp_keystrokeWord]
		ifFalse: [self push: objectMemory nilObject]