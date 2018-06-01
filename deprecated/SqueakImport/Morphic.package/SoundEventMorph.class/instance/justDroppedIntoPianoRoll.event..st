piano rolls
justDroppedIntoPianoRoll: newOwner event: evt
	
	| startX lengthInTicks endX |

	super justDroppedIntoPianoRoll: newOwner event: evt.

	startTimeInScore := newOwner timeForX: self left.
	lengthInTicks := newOwner scorePlayer ticksForMSecs: sound duration * 1000.0.
	endTimeInScore := startTimeInScore + lengthInTicks.

	endTimeInScore > newOwner scorePlayer durationInTicks ifTrue:
		[newOwner scorePlayer updateDuration].

	startX := newOwner xForTime: startTimeInScore.
	endX := newOwner xForTime: endTimeInScore.
	self width: endX - startX.

