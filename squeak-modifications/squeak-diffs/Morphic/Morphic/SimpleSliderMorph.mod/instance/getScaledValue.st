private
getScaledValue
	| aValue |
	aValue := (value * (maxVal - minVal)) + minVal.
	^ truncate ifTrue: [aValue truncated] ifFalse: [aValue]