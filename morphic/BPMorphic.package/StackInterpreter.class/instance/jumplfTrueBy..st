jump bytecodes
jumplfTrueBy: offset 
	| _gsSqueakTemp_boolean |
	_gsSqueakTemp_boolean := self internalStackTop.
	_gsSqueakTemp_boolean = objectMemory trueObject
		ifTrue: [self jump: offset]
		ifFalse: [_gsSqueakTemp_boolean = objectMemory falseObject
				ifFalse: [^ self internalMustBeBoolean].
			self fetchNextBytecode].
	self internalPop: 1