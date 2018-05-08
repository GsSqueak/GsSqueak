tests - converting
testAsIntegerSignedUsingRandomNumbers

	| random |
	random := Random seed: 36rSqueak.
	1 to: 100 do: [ :digitLength |
		50 timesRepeat: [
			| number inputString |
			number := ((2 atRandom: random) = 1
				ifTrue: [ LargePositiveInteger ]
				ifFalse: [ LargeNegativeInteger ])
					new: digitLength.
			1 to: digitLength do: [ :index | number at: index put: (256 atRandom: random) - 1 ].
			number := number normalize.
			inputString := number asString.
			self
				assert: number equals: (inputString asIntegerSigned: true);
				assert: number abs equals: (inputString asIntegerSigned: false) ] ]