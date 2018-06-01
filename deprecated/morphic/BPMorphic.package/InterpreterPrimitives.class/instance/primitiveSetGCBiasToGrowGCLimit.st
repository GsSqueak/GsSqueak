memory space primitives
primitiveSetGCBiasToGrowGCLimit
	"Primitive. If the GC logic has bias to grow, set growth limit"
	| _gsSqueakTemp_value |
	"for now..."
	_gsSqueakTemp_value := self stackIntegerValue: 0.
	self successful
		ifTrue: [objectMemory gcBiasToGrowGCLimit: _gsSqueakTemp_value.
			objectMemory gcBiasToGrowThreshold: objectMemory youngStart - objectMemory startOfMemory asInteger.
			self pop: argumentCount]