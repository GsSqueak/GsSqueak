testing - arithmetic
testTimesTwoPowerGradualUnderflow
	"Here is a vicious case where timesTwoPower is inexact because it underflows.
	And two consecutive inexact operations lead to a different result than a single one.
	Typically expressed as multiple of Float fmin in base 2,
	2r1011*Float fmin shifted by -3 with round to nearest, tie to even mode:
	-> round(1.011) -> 1.0 = fmin
	But if first shifted by -2 then by -1:
	-> round(10.11) -> 11.0 = 3*fmin
	-> round(1.1) -> 10.0 = 2*fmin
	Or first shifted by -1 then by -2:
	-> round(101.1) -> 110.0 = 6*fmin
	-> round(1.1) -> 10.0 = 2*fmin
	A naive implementation that split the shift uncarefully might fail to handle such case correctly."
	| f |
	f := 2r1011 asFloat.
	"scan the whole range of possible exponents for this significand"
	Float fmin exponent + f exponent to: Float fmax exponent - f exponent
		do:
			[:exp |
			| g |
			g := f timesTwoPower: exp.
			self assert: (g timesTwoPower: Float fmin exponent - g exponent) = Float fmin]