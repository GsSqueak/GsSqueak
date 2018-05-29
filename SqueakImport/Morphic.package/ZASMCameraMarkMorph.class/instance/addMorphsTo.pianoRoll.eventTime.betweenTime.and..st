piano rolls
addMorphsTo: morphList pianoRoll: pianoRoll eventTime: t betweenTime: leftTime and: rightTime

	| startX pseudoEndTime |

	startX := pianoRoll xForTime: startTimeInScore.
	pseudoEndTime := pianoRoll timeForX: startX + self width.
	startTimeInScore > rightTime ifTrue: [^ self].  
	pseudoEndTime < leftTime ifTrue: [^ self].

	morphList add: 
		(self align: self bottomLeft
			with: startX @ self bottom).

