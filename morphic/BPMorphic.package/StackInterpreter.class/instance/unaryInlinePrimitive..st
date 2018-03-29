sista inline primitives - unary
unaryInlinePrimitive: primIndex 
	"Bulk comments: each sub-method has its own comment with the
	specific case.
	1000	rawClass
	not a forwarder => Behavior (Same as class special send, but receiver
	is not a forwarder)
	1001	numSlots
	pointer object => Smi between 0 and SmallInteger maxVal // 4 - 1
	(Answers total size in pointer-sized slots)
	1002	numBytes
	byte object => Smi between 0 and SmallInteger maxVal - 9 (Includes
	compiled code)
	1003	numShorts
	short object => Smi between 0 and SmallInteger maxVal - 9
	1004	numWords
	word object => Smi between 0 and SmallInteger maxVal - 9
	1005	numDoubleWords
	double word object => Smi between 0 and SmallInteger maxVal - 9
	1011	RawNew
	literal which is a fixed-sized behavior => instance of the receiver with
	fields nilled out
	1012	RawNewNoInit
	literal which is a fixed-sized behavior => instance of the receiver
	(Fields of returned value contain undefined data)
	1020	objectIdentityHash
	non-immediate and non-behavior => 22 bits strictly positive Smi
	1021	smiIdentityHash
	Smi => Smi
	1022	charIdentityHash
	Character => 22 bits strictly positive Smi
	1023	smallfloatIdentityHash
	SmallFloat => Smi
	1024	behaviorIdentityHash
	Behavior => 22 bits strictly positive Smi
	1030	characterAsInteger
	Character => 22 bits strictly positive Smi (Unicode)
	1031	smallFloatAsInteger
	SmallFloat => Smi
	1032	smiAsFloat
	Smi => SmallFloat
	1039	unforwardNonImmediate
	non immediate => Not a forwarder
	1040	unforward
	Anything => Not a forwarder
	1041	possibleRoot
	non-immediate, not a forwarder => receiver is returned (should be
	effect-only) (If old, becomes gray and remembered to allow many
	unchecked stores in a row afterwards)"
	primIndex = 0
		ifTrue: [^ self unaryClassPrimitive].
	primIndex <= 6
		ifTrue: [^ self unarySizeInlinePrimitive: primIndex].
	primIndex < 11
		ifTrue: [^ self unknownInlinePrimitive].
	primIndex <= 12
		ifTrue: [^ self unaryNewInlinePrimitive: primIndex].
	primIndex < 20
		ifTrue: [^ self unknownInlinePrimitive].
	primIndex <= 24
		ifTrue: [^ self unaryHashInlinePrimitive: primIndex].
	primIndex < 30
		ifTrue: [^ self unknownInlinePrimitive].
	primIndex <= 32
		ifTrue: [^ self unaryConvertInlinePrimitive: primIndex].
	primIndex < 39
		ifTrue: [^ self unknownInlinePrimitive].
	primIndex <= 40
		ifTrue: [^ self unaryUnforwardInlinePrimitive: primIndex].
	primIndex = 41
		ifTrue: [^ self unaryPossibleRootInlinePrimitive].
	self unknownInlinePrimitive