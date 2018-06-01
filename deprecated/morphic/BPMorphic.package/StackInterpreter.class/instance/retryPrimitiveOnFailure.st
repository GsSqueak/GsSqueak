primitive support
retryPrimitiveOnFailure
	"In Spur two cases of primitive failure are handled specially. A primitive
	may fail due to validation
	encountering a forwarder. On failure, check the accessorDepth for the
	primitive and if non-negative
	scan the args to the depth, following any forwarders. Retry the
	primitive if any are found. Hence
	lazily and transparently following forwarders on primtiive failure.
	Additionally a prmitive might fail
	due to an allocation failing. Retry if external primitives have failed with
	PrimErrNoMemory after running
	first the scavenger and then on a subsequent failure, the global
	mark-sweep collector. Hence lazily
	and transparently GC on memory exhaustion."
	| _gsSqueakTemp_gcDone _gsSqueakTemp_followDone _gsSqueakTemp_canRetry _gsSqueakTemp_retry _gsSqueakTemp_retried |
	_gsSqueakTemp_gcDone := 0.
	_gsSqueakTemp_followDone := _gsSqueakTemp_canRetry := _gsSqueakTemp_retried := false.
	[_gsSqueakTemp_retry := false.
	primFailCode = PrimErrNoMemory
		ifTrue: [(_gsSqueakTemp_gcDone := _gsSqueakTemp_gcDone + 1) = 1
				ifTrue: [_gsSqueakTemp_canRetry := self isExternalPrimitiveCall: newMethod].
			_gsSqueakTemp_canRetry
				ifTrue: [_gsSqueakTemp_gcDone = 1
						ifTrue: [objectMemory scavengingGC].
					_gsSqueakTemp_gcDone = 2
						ifTrue: [objectMemory fullGC].
					_gsSqueakTemp_retry := _gsSqueakTemp_gcDone <= 2]]
		ifFalse: [_gsSqueakTemp_followDone
				ifFalse: [_gsSqueakTemp_followDone := true.
					_gsSqueakTemp_retry := self checkForAndFollowForwardedPrimitiveState]].
	_gsSqueakTemp_retry]
		whileTrue: [self assert: primFailCode ~= 0.
			_gsSqueakTemp_retried := true.
			self initPrimCall.
			self
				cCode: []
				inSmalltalk: [self maybeMapPrimitiveFunctionPointerBackToSomethingEvaluable].
			self dispatchFunctionPointer: primitiveFunctionPointer].
	^ _gsSqueakTemp_retried