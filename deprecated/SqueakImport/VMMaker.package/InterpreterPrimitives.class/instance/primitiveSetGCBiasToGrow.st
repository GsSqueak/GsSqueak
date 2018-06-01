memory space primitives
primitiveSetGCBiasToGrow
	"Primitive. Indicate if the GC logic should have bias to grow"
	| flag |
	<export: true>
	flag := self stackIntegerValue: 0.
	self successful ifTrue:[
		objectMemory setGcBiasToGrow: flag.
		self pop: argumentCount.
	].