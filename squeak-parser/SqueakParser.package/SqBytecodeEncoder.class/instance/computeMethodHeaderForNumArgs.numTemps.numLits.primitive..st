method generation
computeMethodHeaderForNumArgs: numArgs numTemps: numTemps numLits: numLits primitive: primitiveIndex 
	numArgs > 15
		ifTrue: [^ self error: 'Cannot compile -- too many arguments'].
	numTemps > 63
		ifTrue: [^ self error: 'Cannot compile -- too many temporary variables'].
	numLits > self maxNumLiterals
		ifTrue: [^ self error: 'Cannot compile -- too many literals'].
	^ (SqCompiledCode headerFlagForEncoder: self)
		+ (numArgs bitShift: 24)
		+ (numTemps bitShift: 18)
		+ (primitiveIndex > 0
				ifTrue: ["+ (largeBit bitShift: 17)"
					"largeBit gets filled in later"
					1 bitShift: 16]
				ifFalse: [0]) + numLits"+ (optimizedBit bitShift: 15)"
	"Sista marker may get filled in later"