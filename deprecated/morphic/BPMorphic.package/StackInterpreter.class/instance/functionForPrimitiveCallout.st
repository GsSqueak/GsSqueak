plugin primitive support
functionForPrimitiveCallout
	"Answer the function primitiveCallout from the FFI plugin or nil if it
	can't be found. Cache it for performance. We use this circumlocution
	so that
	Squeak can be deployed without the FFI plugin for security reasons."
	| _gsSqueakTemp_function |
	self
		cCode: ''
		inSmalltalk: [_gsSqueakTemp_function := -1].
	_gsSqueakTemp_function asInteger = -1
		ifTrue: [_gsSqueakTemp_function := self ioLoadFunction: 'primitiveCallout' From: 'SqueakFFIPrims'].
	^ self cCoerceSimple: _gsSqueakTemp_function to: #'void (*)(void)'