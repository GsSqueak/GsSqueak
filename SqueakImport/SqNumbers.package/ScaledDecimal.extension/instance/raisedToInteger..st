*SqNumbers-mathematical functions
raisedToInteger: aNumber
	^self class newFromNumber: (fraction raisedToInteger: aNumber) scale: scale
