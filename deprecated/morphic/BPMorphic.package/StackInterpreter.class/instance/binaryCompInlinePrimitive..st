sista inline primitives - binary
binaryCompInlinePrimitive: primIndex 
	| _gsSqueakTemp_result |
	self
		assert: (primIndex between: 38 and: 39).
	primIndex caseOf: {
		["2038	rawEqualsEquals:
		not a forwarder, not a forwarder => Boolean (optimised if one
		operand is a constant, Pipelined with ifTrue:ifFalse:)"
		38] -> [_gsSqueakTemp_result := (self internalStackValue: 1)
					= self internalStackTop].
		["2039	rawNotEqualsEquals:
		not a forwarder, not a forwarder => Boolean (optimised if one
		operand is a constant, Pipelined with ifTrue:ifFalse:)"
		39] -> [_gsSqueakTemp_result := (self internalStackValue: 1)
					~= self internalStackTop]}.
	self internalPop: 1;
		
		internalStackTopPut: (objectMemory booleanObjectOf: _gsSqueakTemp_result)