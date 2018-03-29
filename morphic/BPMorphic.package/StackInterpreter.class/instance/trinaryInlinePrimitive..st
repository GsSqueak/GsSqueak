sista bytecodes
trinaryInlinePrimitive: primIndex 
	"Bulk comment, each sub method has its own comment
	3000	pointerAt:put:
	Mutable pointer object (Fixed sized or not) and not a context, Smi,
	Anything => arg2 (1-based, optimised if arg1 is a constant)
	3001	storeCheckPointerAt:put:
	Mutable pointer object (Fixed sized or not) and not a context, Smi,
	Anything => arg2 (1-based, optimised if arg1 is a constant)
	3002	maybeContextPointerAt:put:
	Mutable pointer object (Fixed sized or not), Smi, Anything => arg2
	(1-based, optimised if arg1 is a constant)
	3003	maybeContextStoreCheckPointerAt:put:
	Mutable pointer object (Fixed sized or not), Smi, Anything => arg2
	(1-based, optimised if arg1 is a constant)
	3004	byteAt:put:
	Mutable byte object, Smi, 8 bits unsigned Smi => arg2 (1-based,
	optimised if arg1 is a constant)
	3005	shortAt:put:
	Mutable short object, Smi, 16 bits unsigned Smi => arg2 (1-based,
	optimised if arg1 is a constant)
	3006	wordAt:put:
	Mutable word object, Smi, 32 bits unsigned Smi => arg2 (1-based,
	optimised if arg1 is a constant)
	3007	doubleWordAt:put:
	Mutable double word object, Smi, 64 bits unsigned Smi or
	LargePositiveInteger => arg2 (1-based, optimised if arg1 is a
	constant) 3021 is deprecated."
	primIndex <= 7
		ifTrue: [^ self trinaryAtPutInlinePrimitive: primIndex].
	"21 is deprecated, now this can be handled at Scorch level"
	primIndex = 21
		ifTrue: [| str1 str2 word1 word2 len |
			len := objectMemory integerValueOf: self internalStackTop.
			len = 0
				ifTrue: [^ self internalPop: 2;
						 internalStackTopPut: objectMemory trueObject].
			str1 := self internalStackValue: 2.
			str2 := self internalStackValue: 1.
			0
				to: len - 1 >> objectMemory shiftForWord
				do: [:i | 
					word1 := objectMemory fetchPointer: i ofObject: str1.
					word2 := objectMemory fetchPointer: i ofObject: str2.
					word1 = word2
						ifFalse: [^ self internalPop: 2;
								 internalStackTopPut: objectMemory falseObject]].
			^ self internalPop: 2;
				 internalStackTopPut: objectMemory trueObject].
	self unknownInlinePrimitive