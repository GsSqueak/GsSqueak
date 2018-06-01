file primitives
fileValueOf: integerPointer
	"Convert the (integer) fileID to the actual fileStream it uses"
	self success: (objectMemory isIntegerObject: integerPointer).
	self successful
		ifTrue: [^ filesOpen at: (objectMemory integerValueOf: integerPointer)]
		ifFalse: [^ nil]