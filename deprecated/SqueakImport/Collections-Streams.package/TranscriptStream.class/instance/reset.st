positioning
reset
	"Override to set lastChar"
	position > 0 ifTrue:
		[lastChar := collection at: position].
	^super reset