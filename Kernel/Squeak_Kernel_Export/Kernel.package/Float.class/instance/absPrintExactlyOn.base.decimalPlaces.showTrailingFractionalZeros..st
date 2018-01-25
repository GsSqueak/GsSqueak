printing
absPrintExactlyOn: aStream base: base decimalPlaces: placesDesired showTrailingFractionalZeros: showtrailingZeros
	"Print my value on a stream in the given base with fixed number of digits after floating point.
	When placesDesired are beyond Float precision, zeroes are appended.
	When showtrailingZeros is false, the trailing zeroes after decimal point will be omitted.
	If all fractional digits are zeros, the decimal point is omitted too.
	Assumes that my value is strictly positive; negative numbers, zero, and NaNs have already been handled elsewhere.
	Based upon the algorithm outlined in:
	Robert G. Burger and R. Kent Dybvig
	Printing Floating Point Numbers Quickly and Accurately
	ACM SIGPLAN 1996 Conference on Programming Language Design and Implementation
	June 1996.."

	| significand exp baseExpEstimate r s mPlus mMinus scale roundingLowIncludesLimits roundingHighIncludesLimits d tc1 tc2 decPointCount slowbit shead delta |
	self isInfinite ifTrue: [aStream nextPutAll: 'Infinity'. ^ self].
	significand := self significandAsInteger.
	exp := (self exponent - 52) max: MinValLogBase2.
	exp >= 0
		ifTrue:
			[significand ~= 16r10000000000000
				ifTrue:
					[r := significand bitShift: 1 + exp.
					s := 2.
					mPlus := mMinus := 1 bitShift: exp]
				ifFalse:
					[r := significand bitShift: 2 + exp.
					s := 4.
					mPlus := 2 * (mMinus := 1 bitShift: exp)]]
		ifFalse:
			[(exp = MinValLogBase2 or: [significand ~= 16r10000000000000])
				ifTrue:
					[r := significand bitShift: 1.
					s := 1 bitShift: 1 - exp.
					mPlus := mMinus := 1]
				ifFalse:
					[r := significand bitShift: 2.
					s := 1 bitShift: 2 - exp.
					mPlus := 2.
					mMinus := 1]].
	delta := s / 2 / (base raisedTo: placesDesired).
	roundingLowIncludesLimits :=  (mMinus < delta and: [mMinus := delta. true]) or: [significand even].
	roundingHighIncludesLimits := (mPlus < delta and: [mPlus := delta. true]) or: [significand even].
	baseExpEstimate := (self exponent * base asFloat reciprocalLogBase2 - 1.0e-10) ceiling.
	baseExpEstimate >= 0
		ifTrue: [s := s * (base raisedToInteger: baseExpEstimate)]
		ifFalse:
			[scale := base raisedToInteger: baseExpEstimate negated.
			r := r * scale.
			mPlus := mPlus * scale.
			mMinus := mMinus * scale].
	((r + mPlus >= s) and: [roundingHighIncludesLimits or: [r + mPlus > s]])
		ifTrue: [baseExpEstimate := baseExpEstimate + 1]
		ifFalse:
			[r := r * base.
			mPlus := mPlus * base.
			mMinus := mMinus * base].
	decPointCount := baseExpEstimate.
	baseExpEstimate <= 0
		ifTrue:
			[placesDesired + baseExpEstimate <= 0
				ifTrue:
					[aStream nextPut: $0.
					(showtrailingZeros and: [placesDesired > 0]) ifTrue: [aStream nextPut: $.; nextPutAll: (String new: placesDesired withAll: $0)].
					^self].
			aStream nextPutAll: '0.'; nextPutAll: (String new: 0 - baseExpEstimate withAll: $0)].
	slowbit := 1 - s lowBit .
	shead := s bitShift: slowbit.
	[d := (r bitShift: slowbit) // shead.
	r := r - (d * s).
	(tc1 := (r <= mMinus) and: [roundingLowIncludesLimits or: [r < mMinus]]) |
	(tc2 := (r + mPlus >= s) and: [roundingHighIncludesLimits or: [r + mPlus > s]])] whileFalse:
		[aStream nextPut: (Character digitValue: d).
		r := r * base.
		mPlus := mPlus * base.
		mMinus := mMinus * base.
		(decPointCount := decPointCount - 1) = 0 ifTrue: [aStream nextPut: $.]].
	tc2 ifTrue:
		[(tc1 not or: [r * 2 >= s]) ifTrue: [d := d + 1]].
	aStream nextPut: (Character digitValue: d).
	decPointCount > 0
		ifTrue:
			[decPointCount - 1 to: 1 by: -1 do: [:i | aStream nextPut: $0].
			(showtrailingZeros and: [placesDesired > 0]) ifTrue: [aStream nextPut: $.; nextPutAll: (String new: placesDesired withAll: $0)]]
		ifFalse:
			[(showtrailingZeros and: [placesDesired + decPointCount > 1]) ifTrue: [aStream nextPutAll: (String new: placesDesired + decPointCount - 1 withAll: $0)]].