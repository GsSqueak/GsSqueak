fileIn/Out
fileIntoNewChangeSet: fullFileName
	"FileIn the contents of a gzipped file"
	| zipped unzipped cs |
	cs := Smalltalk at: #ChangesOrganizer ifAbsent: [ ^self ].
	zipped := self on: (FileStream readOnlyFileNamed: fullFileName).
	unzipped := MultiByteBinaryOrTextStream with: zipped contents asString.
	unzipped reset.
	cs newChangesFromStream: unzipped named: (FileDirectory localNameFor: fullFileName)
