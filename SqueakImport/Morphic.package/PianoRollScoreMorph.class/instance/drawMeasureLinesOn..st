drawing
drawMeasureLinesOn: aCanvas

	| ticksPerMeas x measureLineColor inner |
	showBeatLines ifNil: [showBeatLines := false].
	showMeasureLines ifNil: [showMeasureLines := true].
	notePerBeat ifNil: [self timeSignature: 4 over: 4].
	showBeatLines ifTrue:
		[measureLineColor := Color gray: 0.8.
		ticksPerMeas := score ticksPerQuarterNote.
		inner := self innerBounds.
		(leftEdgeTime + ticksPerMeas truncateTo: ticksPerMeas)
			to: ((self timeForX: self right - borderWidth) truncateTo: ticksPerMeas)
			by: ticksPerMeas
			do: [:tickTime | x := self xForTime: tickTime.
				aCanvas fillRectangle: (x @ inner top extent: 1 @ inner height)
					color: measureLineColor]].

	showMeasureLines ifTrue:
		[measureLineColor := Color gray: 0.7.
		ticksPerMeas := beatsPerMeasure*score ticksPerQuarterNote*4//notePerBeat.
		inner := self innerBounds.
		(leftEdgeTime + ticksPerMeas truncateTo: ticksPerMeas)
			to: ((self timeForX: self right - borderWidth) truncateTo: ticksPerMeas)
			by: ticksPerMeas
			do: [:tickTime | x := self xForTime: tickTime.
				aCanvas fillRectangle: (x @ inner top extent: 1 @ inner height)
						color: (tickTime = 0 ifTrue: [Color black] ifFalse: [measureLineColor])]].
