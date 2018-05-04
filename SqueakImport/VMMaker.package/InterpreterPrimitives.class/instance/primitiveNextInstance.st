object access primitives
primitiveNextInstance
	| object instance |
	object := self stackTop.
	instance := objectMemory instanceAfter: object.
	instance = objectMemory getNilObj
		ifTrue: [self primitiveFail]
		ifFalse: [self pop: argumentCount+1 thenPush: instance]