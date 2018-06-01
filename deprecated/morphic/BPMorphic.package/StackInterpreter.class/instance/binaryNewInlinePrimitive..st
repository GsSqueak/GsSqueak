sista inline primitives - binary
binaryNewInlinePrimitive: primIndex 
	"2048	rawNew:
	literal which is a variable-sized behavior, Smi => instance of receiver,
	fields nilled/zeroed out (optimised if arg1 is a constant)
	2049	rawNewNoInit:
	literal which is a variable-sized behavior, Smi => instance of receiver
	(Fields of returned value contain undefined data, optimised if arg1 is a
	constant) 
	WARNING: In the interpreter version, fields are always initialized."
	| _gsSqueakTemp_classObj _gsSqueakTemp_result _gsSqueakTemp_size _gsSqueakTemp_top |
	self
		assert: (primIndex between: 48 and: 49).
	_gsSqueakTemp_top := self internalStackTop.
	_gsSqueakTemp_classObj := self internalStackValue: 1.
	self
		assert: ((objectMemory isNonImmediate: _gsSqueakTemp_classObj)
				and: [self objCouldBeClassObj: _gsSqueakTemp_classObj]).
	self
		assert: (objectMemory isIntegerObject: _gsSqueakTemp_top).
	_gsSqueakTemp_size := self positiveMachineIntegerValueOf: _gsSqueakTemp_top.
	_gsSqueakTemp_result := objectMemory instantiateClass: _gsSqueakTemp_classObj indexableSize: _gsSqueakTemp_size.
	self internalPop: 1;
		 internalStackTopPut: _gsSqueakTemp_result