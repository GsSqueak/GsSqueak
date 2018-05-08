tests - converting
testAsIntegerSignedUsingRandomNumbers

	| random digitCharactersByValue |
	random := Random seed: 36rSqueak.
	digitCharactersByValue := (((0 to: 65535) collect: #asCharacter as: String) select: #isDigit)
		groupBy: #digitValue.
	1 to: 100 do: [ :digitLength |
		50 timesRepeat: [
			| number inputString |
			number := ((2 atRandom: random) = 1
				ifTrue: [ LargePositiveInteger ]
				ifFalse: [ LargeNegativeInteger ])
					new: digitLength.
			1 to: digitLength do: [ :index | number at: index put: (256 atRandom: random) - 1 ].
			number := number normalize.
			inputString := number asString asWideString.
			inputString replace: [ :each |
				each == $-
					ifTrue: [ each ]
					ifFalse: [ (digitCharactersByValue at: each digitValue) atRandom: random ] ].
			self
				assert: number equals: (inputString asIntegerSigned: true);
				assert: number abs equals: (inputString asIntegerSigned: false) ] ]