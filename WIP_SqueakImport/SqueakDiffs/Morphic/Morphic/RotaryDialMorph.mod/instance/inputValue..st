updating
inputValue: aNumber 
	"move the needleMorph to display the value; we clamp it to the range
	[startValue, stopValue]"
	| input newDegrees |
	stopValue > startValue
		ifTrue: [input := aNumber min: stopValue max: startValue]
		ifFalse: [input := aNumber min: startValue max: stopValue].
	currentValue := input.
	newDegrees := currentValue - startValue / (stopValue - startValue) * ((stopAngle - startAngle)\\360) + startAngle.
	needleMorph rotationDegrees: newDegrees \\ 360