*SqNumbers-mathematical functions
raisedToInteger: aNumber
	^self class newFromNumber: (mantissa raisedToInteger: aNumber) scale: scale
