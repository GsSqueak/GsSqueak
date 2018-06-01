accessing
showPointer: aBoolean
	"If aBoolean is true, display the current pointer position as a small square in the center of the lens."

	showPointer == aBoolean ifTrue: [ ^self ].
	showPointer := aBoolean.
	self changed.