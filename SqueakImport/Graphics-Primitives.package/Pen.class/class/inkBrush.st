tablet drawing examples
inkBrush
	"Similar to simplePressurePen, but this example uses the average of the recent pen pressure values. The effect is that of a Japanese ink brush that comes up gradually off the paper as the brush is lifted, causing end (and beginning) of each stroke to taper. Requires the optional tablet support primitives which may not be supported on all platforms. Works best in full screen mode. Shift-mouse to exit." 
	"Pen inkBrush"

	| tabletScale historyMSecs pressureHistory pen |
	tabletScale := self tabletScaleFactor.
	historyMSecs := 120.
	pressureHistory := OrderedCollection new.
	pen := Pen newOnForm: Display.
	pen color: Color black.
	Display fillColor: Color white.
	Display restoreAfter: [ | sum p averagePressure now currentPressure |
		[Sensor shiftPressed and: [Sensor anyButtonPressed]] whileFalse: [
			"compute the average pressure over last historyMSecs milliseconds"
			now := Time millisecondClockValue.
			currentPressure := (20.0 * Sensor tabletPressure) rounded.
			pressureHistory addLast: (Array with: now with: currentPressure).
			[pressureHistory size > 0 and:
			 [(pressureHistory first first + historyMSecs) < now]]
				whileTrue: [pressureHistory removeFirst].  "prune old entries"
			sum := pressureHistory inject: 0 into: [:t :e | t + e last].
			averagePressure := sum // pressureHistory size.

			p := (Sensor tabletPoint * tabletScale) rounded.
		     averagePressure > 0
				ifTrue: [
					pen roundNib: averagePressure.
					pen goto: p]
				ifFalse: [
					pen place: p]]].
