event handling
mouseDown: evt

	ignoreNextUp := false.
	evt yellowButtonPressed ifTrue: [
		^self doYellowButtonPress: evt
	].
	^super mouseDown: evt
