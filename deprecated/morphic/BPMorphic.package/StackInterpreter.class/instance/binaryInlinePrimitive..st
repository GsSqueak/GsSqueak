sista inline primitives - binary
binaryInlinePrimitive: primIndex 
	"Bulk comments: each sub-method has its own comment with the
	specific case.
	2000	+
	Smi, Smi => Smi (no overflow, optimised if one operand is a
	constant) 2001	-
	Smi, Smi => Smi (no overflow, optimised if one operand is a
	constant) 2002	*
	Smi, Smi => Smi (no overflow, optimised if one operand is a
	constant) 2003	/
	Smi, Smi => Smi (no overflow, optimised if one operand is a
	constant) 2004	//
	Smi, Smi => Smi (no overflow, optimised if one operand is a
	constant) 2005	\
	Smi, Smi => Smi (no overflow, optimised if one operand is a
	constant) 2006	quo:
	Smi, Smi => Smi (no overflow, optimised if one operand is a
	constant) 2016	bitAnd:
	Smi, Smi => Smi (optimised if one operand is a constant)
	2017	bitOr:
	Smi, Smi => Smi (optimised if one operand is a constant)
	2018	bitXor:
	Smi, Smi => Smi (optimised if one operand is a constant)
	2019	bitShiftLeft:
	Smi greater or equal to 0, Smi greater or equal to 0 => Smi (no
	overflow, optimised if arg1 is a constant)
	2020	bitShiftRight:
	Smi, Smi greater or equal to 0 => Smi (optimised if arg1 is a
	constant) 2032	>
	Smi, Smi => Boolean (optimised if one operand is a constant,
	Pipelined with ifTrue:ifFalse:)
	2033	<
	Smi, Smi => Boolean (optimised if one operand is a constant,
	Pipelined with ifTrue:ifFalse:)
	2034	>=
	Smi, Smi => Boolean (optimised if one operand is a constant,
	Pipelined with ifTrue:ifFalse:)
	2035	<=
	Smi, Smi => Boolean (optimised if one operand is a constant,
	Pipelined with ifTrue:ifFalse:)
	2036	=
	Smi, Smi => Boolean (optimised if one operand is a constant,
	Pipelined with ifTrue:ifFalse:)
	2037	~=
	Smi, Smi => Boolean (optimised if one operand is a constant,
	Pipelined with ifTrue:ifFalse:)
	2038	rawEqualsEquals:
	not a forwarder, not a forwarder => Boolean (optimised if one
	operand is a constant, Pipelined with ifTrue:ifFalse:)
	2039	rawNotEqualsEquals:
	not a forwarder, not a forwarder => Boolean (optimised if one
	operand is a constant, Pipelined with ifTrue:ifFalse:)
	2048	rawNew:
	literal which is a fixed-sized behavior, Smi => instance of receiver,
	fields nilled out (optimised if arg1 is a constant)
	2049	rawNewNoInit:
	literal which is a fixed-sized behavior, Smi => instance of receiver
	(Fields of returned value contain undefined data, optimised if arg1 is a
	constant) 2064	pointerAt:
	Pointer object (Fixed sized or not) and not a context, Smi =>
	(1-based, optimised if arg1 is a constant)
	2065	maybeContextPointerAt:
	Pointer object (Fixed sized or not), Smi => (1-based, optimised if arg1
	is a constant)
	2066	byteAt:
	byte object, Smi => 8 bits unsigned Smi (1-based, optimised if arg1
	is a constant)
	2067	shortAt:
	short object, Smi => 16 bits unsigned Smi (1-based, optimised if
	arg1 is a constant)
	2068	wordAt:
	word object, Smi => 32 bits unsigned Smi (1-based, optimised if arg1
	is a constant)
	2069	doubleWordAt:
	double word object, Smi => 64 bits unsigned Smi or
	LargePositiveInteger (1-based, optimised if arg1 is a constant)"
	primIndex <= 6
		ifTrue: [^ self binarySmiArithmeticInlinePrimitive: primIndex].
	primIndex < 16
		ifTrue: [^ self unknownInlinePrimitive].
	primIndex <= 20
		ifTrue: [^ self binarySmiBitInlinePrimitive: primIndex].
	primIndex < 32
		ifTrue: [^ self unknownInlinePrimitive].
	primIndex <= 37
		ifTrue: [^ self binarySmiCompInlinePrimitive: primIndex].
	primIndex <= 39
		ifTrue: [^ self binaryCompInlinePrimitive: primIndex].
	primIndex < 48
		ifTrue: [^ self unknownInlinePrimitive].
	primIndex <= 49
		ifTrue: [^ self binaryNewInlinePrimitive: primIndex].
	primIndex < 64
		ifTrue: [^ self unknownInlinePrimitive].
	primIndex <= 69
		ifTrue: [^ self binaryAtInlinePrimitive: primIndex].
	self unknownInlinePrimitive