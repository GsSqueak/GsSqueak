reading
maybeBeginReference: internalObject
	"See if need to record a reference.  In case in the file twice"

	(self isAReferenceType: (self typeIDFor: internalObject))
			ifTrue: [self beginReference: internalObject].
			"save the final object and give it out next time."
	^ internalObject