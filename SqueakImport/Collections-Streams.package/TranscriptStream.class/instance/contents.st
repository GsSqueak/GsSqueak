accessing
contents
	"Override to update lastChar."
	position > 0 ifTrue:
		[lastChar := collection at: position].
	^super contents