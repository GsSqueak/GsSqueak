button commands
trim
	"Show my samples in a GraphMorph."
	
	recorder verifyExistenceOfRecordedSound ifFalse: [^ self].
	recorder pause.
	recorder trim: 1400 normalizedVolume: 80.0.
