event handling
mouseMove: evt

	ignoreNextUp == true ifTrue: [^self].
	^super mouseMove: evt
