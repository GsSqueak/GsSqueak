sound-piano rolls
justDroppedIntoPianoRoll: newOwner event: evt
	
	| startX lengthInTicks endX startTimeInScore endTimeInScore |

	super justDroppedIntoPianoRoll: newOwner event: evt.

	startTimeInScore := newOwner timeForX: self left.
	lengthInTicks := newOwner scorePlayer ticksForMSecs: self myDurationInMS.
	endTimeInScore := startTimeInScore + lengthInTicks.

	endTimeInScore > newOwner scorePlayer durationInTicks ifTrue:
		[newOwner scorePlayer updateDuration].

	startX := newOwner xForTime: startTimeInScore.
	endX := newOwner xForTime: endTimeInScore.
	self width: endX - startX.
