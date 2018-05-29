image, changes names
locateSourcesEntry
	| sourcesFilename |
	sourcesFilename := SourceFileVersionString , FileDirectory dot , 'sources'.
	^ {Smalltalk vmPath. 
	FileDirectory default fullName, FileDirectory slash}
		detect: [ : each | (each , sourcesFilename) asDirectoryEntry notNil ]
		ifFound: [ : foundPath | (foundPath , sourcesFilename) asDirectoryEntry ]
		ifNone: [ nil ]
