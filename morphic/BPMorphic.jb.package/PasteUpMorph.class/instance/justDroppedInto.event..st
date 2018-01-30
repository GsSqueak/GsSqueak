dropping/grabbing
justDroppedInto: aMorph event: anEvent 
	"This message is sent to a dropped morph after it has been dropped
	on--and been accepted by--a drop-sensitive morph"
	super justDroppedInto: aMorph event: anEvent.
	self isPartsBin
		ifTrue: [self setPartsBinStatusTo: true
			"gets some things right about the subtle case of dropping a
			parts bin"]