private
setScaledValue: aNumber
	| denom |
	(denom := maxVal - minVal) > 0
		ifTrue:
			[self setValue: (aNumber - minVal) / denom]
		ifFalse:
			[self setValue: maxVal]
	"If minVal = maxVal, that value is the only one this (rather unuseful!) slider can bear"