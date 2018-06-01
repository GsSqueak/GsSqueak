pen
trailStyle
	"Answer the receiver's trailStyle. For backward compatibility, if the old
	penArrowheads slot is in found to be set, use it as a guide for
	initialization "
	^ trailStyle
		ifNil: [trailStyle := penArrowheads == true
						ifTrue: [#arrows]
						ifFalse: [#lines]]