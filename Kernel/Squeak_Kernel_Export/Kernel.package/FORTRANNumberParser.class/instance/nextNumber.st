parsing-public
nextNumber
	"main method for reading a number with FORTRAN syntax.
	This one can read Real and Integer (not complex)"

	| numberOfTrailingZeroInIntegerPart numberOfNonZeroFractionDigits mantissa value numberOfTrailingZeroInFractionPart noInt |
	base := 10.
	(self nextMatchAll: 'NaN') ifTrue: [^Float nan].
	neg := self peekSignIsMinus.
	(self nextMatchAll: 'Infinity') 
		ifTrue: [^neg ifTrue: [Float negativeInfinity] ifFalse: [Float infinity]].
	(noInt := sourceStream peekFor: $.) 
		ifTrue: 
			[integerPart := 0.
			numberOfTrailingZeroInIntegerPart := 0]
		ifFalse: 
			[integerPart := self nextUnsignedIntegerBase: base.
			numberOfTrailingZeroInIntegerPart := nDigits - lastNonZero].
	(noInt or: [sourceStream peekFor: $.]) 
		ifTrue: 
			[fractionPart := self nextUnsignedIntegerBase: base ifFail: [nil].
			fractionPart isNil 
				ifTrue: 
					[noInt 
						ifTrue: 
							["no interger part, no fraction part..."
							self expected: 'a digit 0 to 9'.
							^nil].
					fractionPart := 0]
				ifFalse: 
					[numberOfNonZeroFractionDigits := lastNonZero.
					numberOfTrailingZeroInFractionPart := nDigits - lastNonZero].
			self readExponent]
		ifFalse: 
			[self readExponent ifFalse: [^neg ifTrue: [integerPart negated] ifFalse: [integerPart]].
			fractionPart := 0].
	fractionPart isZero 
		ifTrue: 
			[mantissa := integerPart // (base raisedTo: numberOfTrailingZeroInIntegerPart).
			exponent := exponent + numberOfTrailingZeroInIntegerPart]
		ifFalse: 
			[mantissa := integerPart * (base raisedTo: numberOfNonZeroFractionDigits) 
						+ (fractionPart // (base raisedTo: numberOfTrailingZeroInFractionPart)).
			exponent := exponent - numberOfNonZeroFractionDigits].
	value := self 
				makeFloatFromMantissa: mantissa
				exponent: exponent
				base: base.
	^neg ifTrue: [value isZero ifTrue: [Float negativeZero] ifFalse: [value negated]] ifFalse: [value]