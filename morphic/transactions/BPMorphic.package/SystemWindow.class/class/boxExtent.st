preferences
boxExtent
	"answer the extent to use in all the buttons"
	^ Preferences alternativeWindowBoxesLook
		ifTrue: [18 @ 18]
		ifFalse: [16 @ 16]