*SqClasses-*SqClasses-*SqClasses-command line
argumentAt: argumentIndex 
	"Answer the i-th argument of the command line, or nil if not so many argument."
	^ self getSystemAttribute:
		argumentIndex +
			(Preferences readDocumentAtStartup
				ifTrue: [ 2 ]
				ifFalse: [ 1 ])
