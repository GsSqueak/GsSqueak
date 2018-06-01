primitive support
positive32BitIntegerFor: integerValue 
	"integerValue is interpreted as POSITIVE, e.g. as the result of
	Bitmap>at:. N.B. Returning in each arm separately enables Slang
	inlining. /Don't/ return the ifTrue:ifFalse: unless Slang inlining of
	conditionals is fixed."
	objectMemory hasSixtyFourBitImmediates
		ifTrue: [^ objectMemory
				integerObjectOf: (integerValue asUnsignedInteger bitAnd: 4294967295)]
		ifFalse: [^ self maybeInlinePositive32BitIntegerFor: integerValue]