private
adjustToValue: aNumber
	"Adjust the position of this slider to correspond to the given value in the range minVal..maxVal."
	"Details: Internal values are normalized to the range 0..1."

	| toUse |
	toUse := minVal = maxVal
		ifTrue:
			[minVal]
		ifFalse:
			[(aNumber - minVal) asFloat / (maxVal - minVal)].
	self value: toUse
