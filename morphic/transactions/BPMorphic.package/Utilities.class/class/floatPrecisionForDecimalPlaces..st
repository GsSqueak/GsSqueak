miscellaneous
floatPrecisionForDecimalPlaces: places 
	"Answer the floatPrecision that corresponds to the given number of
	decimal places"
	^ places caseOf: {
		[0] -> [1].
		[1] -> [0.1].
		[2] -> [0.01].
		[3] -> [0.001].
		[4] -> [0.0001].
		[5] -> [1.0e-5].
		[6] -> [1.0e-6].
		[7] -> [1.0e-7].
		[8] -> [1.0e-8].
		[9] -> [1.0e-9].
		[10] -> [1.0e-10]}
		 otherwise: [(10.0 raisedTo: places negated) asFloat
		"
		(0 to: 6) collect: [:i | Utilities floatPrecisionForDecimalPlaces: i]
		(-10 to: 20) collect: [:i | Utilities floatPrecisionForDecimalPlaces: i
		"]