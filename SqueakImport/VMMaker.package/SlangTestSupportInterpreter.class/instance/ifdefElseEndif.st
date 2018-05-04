preprocessor directives
ifdefElseEndif

	self isDefined: 'HAVE_FOO'
		inSmalltalk: [ ^ #defaultBlockForSimulation ]
		comment: 'some platforms do not support foo properly'
		ifTrue: [ ^true ]
		ifFalse: [ ^false ].
	^nil
