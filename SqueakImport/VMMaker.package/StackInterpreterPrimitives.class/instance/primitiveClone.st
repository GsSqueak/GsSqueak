object access primitives
primitiveClone
	"Return a shallow copy of the receiver.
	 Special-case non-single contexts (because of context-to-stack mapping).
	 Can't fail for contexts cuz of image context instantiation code (sigh)."

	| recvr newCopy |
	recvr := self stackTop.
	(objectMemory isIntegerObject: recvr)
		ifTrue:
			[newCopy := recvr]
		ifFalse:
			[(self isContextNonInt: recvr)
				ifTrue:
					[newCopy := self cloneContext: recvr]
				ifFalse:
					[newCopy := objectMemory clone: recvr].
			newCopy = 0 ifTrue:
				[^self primitiveFailFor: PrimErrNoMemory]].
	self pop: 1 thenPush: newCopy