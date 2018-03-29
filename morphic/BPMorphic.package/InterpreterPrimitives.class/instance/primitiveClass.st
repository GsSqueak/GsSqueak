object access primitives
primitiveClass
	| _gsSqueakTemp_instance |
	_gsSqueakTemp_instance := self stackTop.
	(argumentCount > 0
			and: [objectMemory isOopForwarded: _gsSqueakTemp_instance])
		ifTrue: [self primitiveFail]
		ifFalse: [self
				pop: argumentCount + 1
				thenPush: (objectMemory fetchClassOf: _gsSqueakTemp_instance)]