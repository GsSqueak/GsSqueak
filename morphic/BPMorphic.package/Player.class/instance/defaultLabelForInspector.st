user interface
defaultLabelForInspector
	"Answer the default label to be used for an Inspector window on the
	receiver. "
	^ self knownName
		ifNil: ['An unaffiliated Player']
		ifNotNil: [self knownName]