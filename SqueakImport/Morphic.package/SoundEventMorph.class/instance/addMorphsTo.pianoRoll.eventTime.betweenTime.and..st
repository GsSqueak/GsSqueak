piano rolls
addMorphsTo: morphList pianoRoll: pianoRoll eventTime: t betweenTime: leftTime and: rightTime

	| startX lengthInTicks endX |

	startTimeInScore > rightTime ifTrue: [^ self].  
	lengthInTicks := pianoRoll scorePlayer ticksForMSecs: sound duration * 1000.0.
	startTimeInScore + lengthInTicks < leftTime ifTrue: [^ self].
	startX := pianoRoll xForTime: startTimeInScore.
	endX := pianoRoll xForTime: startTimeInScore + lengthInTicks.
	morphList add: 
		(self left: startX; width: endX - startX).

