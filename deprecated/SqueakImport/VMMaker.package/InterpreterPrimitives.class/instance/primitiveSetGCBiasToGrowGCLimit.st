memory space primitives
primitiveSetGCBiasToGrowGCLimit
	"Primitive. If the GC logic has  bias to grow, set growth limit"
	| value |
	<export: true>
	value := self stackIntegerValue: 0.
	self successful
		ifTrue: [objectMemory setGCBiasToGrowGCLimit: value.
			self pop: argumentCount.].