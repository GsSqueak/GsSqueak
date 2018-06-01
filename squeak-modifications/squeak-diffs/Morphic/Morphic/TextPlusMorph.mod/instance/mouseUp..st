event handling
mouseUp: evt

	ignoreNextUp == true ifTrue: [ignoreNextUp := false. ^self].
	^super mouseUp: evt
