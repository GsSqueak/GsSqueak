testing
knownName
	"If a formal name has been handed out for this object, answer it, else nil"
	
	^ Preferences capitalizedReferences
		ifTrue:
			[References keyAtValue: self ifAbsent: [nil]]
		ifFalse:
			[nil]