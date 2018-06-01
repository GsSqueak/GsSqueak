jump bytecodes
jumplfFalseBy: offset 
	| _gsSqueakTemp_boolean |
	_gsSqueakTemp_boolean := self internalStackTop.
	_gsSqueakTemp_boolean = objectMemory falseObject
		ifTrue: [self jump: offset]
		ifFalse: [_gsSqueakTemp_boolean = objectMemory trueObject
				ifFalse: [^ self internalMustBeBoolean].
			self fetchNextBytecode].
	self internalPop: 1