C library simulation
strlen: aCString 
	"Simulate strlen(3)"
	| _gsSqueakTemp_len |
	aCString isString
		ifTrue: [^ aCString size].
	_gsSqueakTemp_len := 0.
	[(self byteAt: aCString + _gsSqueakTemp_len)
			= 0
		ifTrue: [^ _gsSqueakTemp_len].
	_gsSqueakTemp_len := _gsSqueakTemp_len + 1] repeat