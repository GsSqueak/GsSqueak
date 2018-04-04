characterization
testSignificandAsInteger
	| mantissaBits denormalPowersOfTwo denormals exceptionals normalPowersOfTwo normals |
	"There are 52 bits used for representing the mantissa (plus an eventual leading 1, see below)"
	mantissaBits := Float precision - 1.
	
	normals := {Float pi. Float pi * 100.0. Float pi/ -100.0. Float fmax. Float fminNormalized}.
	denormals := {0.0. Float negativeZero. Float fminNormalized predecessor. Float fmin negated}.
	exceptionals := {Float nan. Float infinity. Float negativeInfinity.}.
	normalPowersOfTwo := (-10 to: 10) collect: [:i | 1.0 timesTwoPower: i].
	denormalPowersOfTwo := (Float emin - mantissaBits to: Float emin - 1) collect: [:i | 1.0 timesTwoPower: i].
	
	normals do: [:aNormalFloat |
		"Assume the mantissa is written in least 52 bits of hex format, with an implied 1 on position 53"
		self
			assert: (((Integer readFrom: aNormalFloat hex base: 16) bitAnd: 1<<mantissaBits-1) bitOr: 1<<mantissaBits)
			equals: aNormalFloat significandAsInteger].
	
	denormals , exceptionals do: [:aDenormalOrExceptionalFloat |
		"For every other Float, zero, denormal or exceptional, no implied leading one"
		self
			assert: ((Integer readFrom: aDenormalOrExceptionalFloat hex base: 16) bitAnd: 1<<mantissaBits-1)
			equals: aDenormalOrExceptionalFloat significandAsInteger].

	normalPowersOfTwo do: [:aNormalPowerOfTwoFloat |
		"The significand of a power of two is a power of two, with high bit of expected precision"
		self assert: aNormalPowerOfTwoFloat significandAsInteger isPowerOfTwo.
		self assert: aNormalPowerOfTwoFloat significandAsInteger highBit equals: Float precision.
		self assert: aNormalPowerOfTwoFloat successor significandAsInteger equals: aNormalPowerOfTwoFloat significandAsInteger + 1.
		"The last one is not true for fminNormalized"
		aNormalPowerOfTwoFloat = Float fminNormalized or: [
			self assert: aNormalPowerOfTwoFloat predecessor significandAsInteger equals: aNormalPowerOfTwoFloat significandAsInteger * 2 - 1]].
	
	denormalPowersOfTwo do: [:aDenormalPowerOfTwoFloat |
		"The significand of a denormal power of two is a power of two, just with less bits"
		self assert: aDenormalPowerOfTwoFloat significandAsInteger isPowerOfTwo.
		self assert: aDenormalPowerOfTwoFloat significandAsInteger highBit equals: Float precision + aDenormalPowerOfTwoFloat exponent - Float emin.
		aDenormalPowerOfTwoFloat successor = Float fminNormalized or: [
			self assert: aDenormalPowerOfTwoFloat successor significandAsInteger equals: aDenormalPowerOfTwoFloat significandAsInteger + 1].
		self assert: aDenormalPowerOfTwoFloat predecessor significandAsInteger equals: aDenormalPowerOfTwoFloat significandAsInteger - 1.].
	
	"Well known value for a few extremal cases"
	self assert: Float fmax significandAsInteger equals: 1 << Float precision - 1.
	self assert: Float fmin significandAsInteger equals: 1.
	self assert: 0.0 significandAsInteger equals: 0.
	self assert: Float infinity significandAsInteger equals: 0.
	self assert: Float nan significandAsInteger > 0