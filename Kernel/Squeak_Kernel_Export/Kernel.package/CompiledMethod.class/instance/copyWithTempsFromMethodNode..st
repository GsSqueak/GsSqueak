source code management
copyWithTempsFromMethodNode: aMethodNode
	^self copyWithTrailerBytes: (
		CompiledMethodTrailer new tempNames: aMethodNode schematicTempNamesString)