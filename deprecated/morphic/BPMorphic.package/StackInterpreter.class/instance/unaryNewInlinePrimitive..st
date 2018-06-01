sista inline primitives - unary
unaryNewInlinePrimitive: primIndex 
	"1011	RawNew
	literal which is a fixed-sized behavior => instance of the receiver with
	fields nilled out
	1012	RawNewNoInit
	literal which is a fixed-sized behavior => instance of the receiver
	(Fields of returned value contain undefined data)
	
	WARNING: In the interpreter version, fields are always initialized."
	| _gsSqueakTemp_classObj _gsSqueakTemp_result |
	self
		assert: (primIndex between: 11 and: 12).
	_gsSqueakTemp_classObj := self internalStackTop.
	self
		assert: ((objectMemory isNonImmediate: _gsSqueakTemp_classObj)
				and: [self objCouldBeClassObj: _gsSqueakTemp_classObj]).
	_gsSqueakTemp_result := objectMemory instantiateClass: _gsSqueakTemp_classObj.
	self internalStackTopPut: _gsSqueakTemp_result