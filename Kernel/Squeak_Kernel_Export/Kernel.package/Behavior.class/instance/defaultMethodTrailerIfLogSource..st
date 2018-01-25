compiling
defaultMethodTrailerIfLogSource: logSource

	logSource ifFalse: [ ^self defaultMethodTrailer ].
	^CompiledMethodTrailer sourcePointerInFile: 2