event handling
mouseStillDown: evt
	(mouseDownTime isNil or: [(Time millisecondClockValue - mouseDownTime) abs < 1000]) ifTrue: [
		^super mouseStillDown: evt
	].
	didMenu ifNotNil: [^super mouseStillDown: evt].
	self color: oldColor.		"in case menu never returns"
	didMenu := target showMenuFor: actionSelector event: evt.
