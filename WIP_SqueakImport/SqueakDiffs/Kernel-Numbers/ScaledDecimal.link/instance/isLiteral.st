testing
isLiteral
	"Answer if this number could be a well behaved literal.
	Well, it would only if evaluating back to self.
	This is not the case of all ScaledDecimals.
	Some has an infinite precision and would need an infinite number of digits to print literally.
	Try for example (3.00s2 reciprocal)."
	
	^mantissa denominator = 1 "first test trivial case before engaging arithmetic"
	
		or: ["Exactly we should test:
			(mantissa numerator * (10 raisedTo; scale)) \\ mantissa denominator = 0.
			But since we can assume mantissa is reduced already this will be simply:"
			
			(10 raisedTo: scale) \\ mantissa denominator = 0]
	
	
