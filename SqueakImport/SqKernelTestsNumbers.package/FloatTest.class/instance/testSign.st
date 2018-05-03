testing
testSign

	"Set up"
	| negatives negz positives strictNegatives strictPositives zero |
	strictPositives := {2. 2.5. Float infinity}.
	strictNegatives := {-3. -3.25. Float negativeInfinity}.
	zero := 0.0.
	negz := Float negativeZero.
	positives := strictPositives copyWith: zero.
	negatives := strictNegatives copyWith: negz.
	
	"The sign of non zeros"
	strictPositives do: [:aPositive | self assert: aPositive sign = 1].
	strictNegatives do: [:aNegative | self assert: aNegative sign = -1].
	
	"The sign of zeros"
	self assert: zero sign = 0.
	self assert: negz sign = 0. "remark that negz can't be distinguished from zero and is thus considered positive..."
	self assert: negz signBit = 1. "but we can differentiate"
	
	"Test the copy sign functions"
	positives do: [:aPositiveSign |
		positives do: [:aPositive | 
			self assert: (aPositive sign: aPositiveSign) = aPositive].
		negatives do: [:aNegative | 
			self assert: (aNegative sign: aPositiveSign) = aNegative negated].
		(zero sign: aPositiveSign) signBit = 0.
		(negz sign: aPositiveSign) signBit = 0].
	
	negatives do: [:aNegativeSign |
		positives do: [:aPositive | 
			self assert: (aPositive sign: aNegativeSign) = aPositive negated].
		negatives do: [:aNegative | 
			self assert: (aNegative sign: aNegativeSign) = aNegative].
		(zero sign: aNegativeSign) signBit = 1.
		(negz sign: aNegativeSign) signBit = 1].