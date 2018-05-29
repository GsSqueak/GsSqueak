sound-piano rolls
addMorphsTo: morphList pianoRoll: pianoRoll eventTime: t betweenTime: leftTime and: rightTime

	| startX myDurationInTicks endX |

	startX := pianoRoll xForTime: t.
	myDurationInTicks := pianoRoll scorePlayer ticksForMSecs: self myDurationInMS.
	t > rightTime ifTrue: [^ self].  
	(t + myDurationInTicks) < leftTime ifTrue: [^ self].
	endX := pianoRoll xForTime: t + myDurationInTicks.

	morphList add: 
		(self hResizing: #spaceFill; left: startX; width: endX - startX).

