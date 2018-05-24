identifier testing
resolve: aString

	aString = #self ifTrue: [ ^#self ].
	aString = #true ifTrue: [ ^#true ].
	aString = #false ifTrue: [ ^#false ].
	aString = #nil ifTrue: [ ^#nil ].
	aString = #super ifTrue: [ ^#super ].
	aString = #thisContext ifTrue: [ ^#thisContext ].
	(self isBlockTempName: aString) ifTrue: [^#blockTempVar].
	(self isBlockArgName: aString) ifTrue: [^#blockArg].
	(self isMethodTempName: aString) ifTrue: [^#tempVar].
	(self isMethodArgName: aString) ifTrue: [^#methodArg].
	^ aString first isUppercase "Very prone to mistakes, but less chatty"
		ifTrue: [#globalVar]
		ifFalse: [#instVar]