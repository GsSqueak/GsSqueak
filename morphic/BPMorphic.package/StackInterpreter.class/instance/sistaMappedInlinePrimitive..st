sista bytecodes
sistaMappedInlinePrimitive: primIndex 
	"SistaV1:	236		11101100	iiiiiiii		callMappedInlinedPrimitive"
	"Number of arguments:
	0-49 nullary
	50-99 unary
	100-149 binary
	150-199 trinary
	200-249 variable
	250-255 mapped jumps"
	"Specification:
	50	EnsureEnoughWords
	literal which is a Smi => ret value is receiver
	150	immCheckPointerAt:put:
	pointer object (Fixed sized or not) and not a context, Smi, Anything
	=> arg2 (1-based, optimised if arg1 is a constant)
	151	immCheckStoreCheckPointerAt:put:
	pointer object (Fixed sized or not) and not a context, Smi, Anything
	=> arg2 (1-based, optimised if arg1 is a constant)
	152	immCheckMaybeContextPointerAt:put:
	pointer object (Fixed sized or not), Smi, Anything => arg2 (1-based,
	optimised if arg1 is a constant)
	153	immCheckMaybeContextStoreCheckPointerAt:put:
	pointer object (Fixed sized or not), Smi, Anything => arg2 (1-based,
	optimised if arg1 is a constant)
	154	immcheckByteAt:put:
	byte object, Smi, 8 bits unsigned Smi => arg2 (1-based, optimised if
	arg1 is a constant)
	155	immCheckShortAt:put:
	short object, Smi, 16 bits unsigned Smi => arg2 (1-based, optimised
	if arg1 is a constant)
	156	immCheckWordAt:put:
	word object, Smi, 32 bits unsigned Smi => arg2 (1-based, optimised
	if arg1 is a constant)
	157	immCheckDoubleWordAt:put:
	double word object, Smi, 64 bits unsigned Smi or
	LargePositiveInteger => arg2 (1-based, optimised if arg1 is a
	constant) 200	directCall
	method to call on top of stack => (variable number of parameters)
	250 backjumpAlwaysInterrupt
	literal which is a Smi"
	(primIndex between: 154 and: 157)
		ifTrue: [^ self mappedImmcheckDataAtPut: primIndex].
	primIndex caseOf: {
		[50] -> [self mappedEnsureEnoughWords].
		[150] -> ["150	immCheckPointerAt:put:
		pointer object (Fixed sized or not) and not a context, Smi,
		Anything => arg2 (1-based, optimised if arg1 is a constant)"
		"We could ignore the store check but we don't care in the
		interpreter "
		self mappedImmcheckStoreCheckPointerAtPut].
		[151] -> [self mappedImmcheckStoreCheckPointerAtPut].
		[152] -> ["152	immCheckMaybeContextPointerAt:put:
		pointer object (Fixed sized or not), Smi, Anything => arg2
		(1-based, optimised if arg1 is a constant)"
		"We could ignore the store check but we don't care in the
		interpreter "
		self mappedImmcheckMaybeContextStoreCheckPointerAtPut].
		[153] -> [self mappedImmcheckMaybeContextStoreCheckPointerAtPut].
		[200] -> [self mappedDirectCall].
		[250] -> [self mappedBackjumpAlwaysInterrupt]}
		 otherwise: [self unknownInlinePrimitive]