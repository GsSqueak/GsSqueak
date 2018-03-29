message sending
canContextSwitchIfActivating: theMethod header: methodHeader 
	"Context switch should not be allowed on every method activation. In
	particular the implementation of ensure: and ifCurtailed: depends on
	there being no
	suspension point on failing primitive 198
	(primitiveMarkUnwindMethod). slowPrimitiveResponse states
	``N.B. This means there is no suspension point on primitive failure
	which methods such as ensure: and ifCurtailed: rely on.''
	Rather than prevent context switch on all primitives but the ones we
	really need
	to be suspension points (primitiveSignal et al) we choose to allow
	context switch
	for all but primitiveMarkUnwindMethod."
	| _gsSqueakTemp_primitiveIndex |
	_gsSqueakTemp_primitiveIndex := self primitiveIndexOfMethod: theMethod header: methodHeader.
	^ self
		cppIf: true
		ifTrue: [_gsSqueakTemp_primitiveIndex ~= 198
			"primitiveMarkUnwindMethod"]
		ifFalse: [_gsSqueakTemp_primitiveIndex = 0
				or: [(_gsSqueakTemp_primitiveIndex between: 85 and: 88)
						or: ["primitiveSignal primitiveWait primitiveResume
							primitiveSuspend "
							_gsSqueakTemp_primitiveIndex = 167]]
			"primitiveYield"]