message sending
canContextSwitchIfActivating: methodHeader
	"Context switch should not be allowed on every method activation.  In particular
	 the implementation of ensure: and ifCurtailed: depends on there being no
	 suspension point on failing primitive 198 (primitiveMarkUnwindMethod).
	 slowPrimitiveResponse states
		``N.B.  This means there is no suspension point on primitive failure
		    which methods such as ensure: and ifCurtailed: rely on.''
	 Rather than prevent context switch on all primitives but the ones we really need
	 to be suspension points (primitiveSignal et al) we choose to allow context switch
	 for all but primitiveMarkUnwindMethod."
	| primitiveIndex |
	<inline: true>
	primitiveIndex := self primitiveIndexOfMethodHeader: methodHeader.
	true ifTrue:
		[^primitiveIndex ~= 198]."primitiveMarkUnwindMethod"
	^primitiveIndex = 0
	  or: [(primitiveIndex between: 85 and: 88) "primitiveSignal primitiveWait primitiveResume primitiveSuspend"
	  or: [primitiveIndex = 167]] "primitiveYield"