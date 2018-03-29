memory space primitives
primitiveSetGCBiasToGrow
	"Primitive. Indicate if the GC logic should have bias to grow"
	| _gsSqueakTemp_flag |
	"for now..."
	_gsSqueakTemp_flag := self stackIntegerValue: 0.
	self successful
		ifTrue: [objectMemory gcBiasToGrow: _gsSqueakTemp_flag.
			self pop: argumentCount]