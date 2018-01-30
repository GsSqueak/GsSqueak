naming
nameForFindWindowFeature
	"Answer the name to show in a list of windows-and-morphs to
	represent the receiver"
	^ self knownName
		ifNil: [self class name]