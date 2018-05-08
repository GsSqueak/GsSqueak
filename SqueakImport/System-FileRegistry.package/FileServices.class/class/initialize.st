accessing
initialize
	"FileServices initialize"
	Smalltalk allClassesDo:[:aClass|
		(aClass class includesSelector: #fileReaderServicesForFile:suffix:)
			ifTrue:[self registerFileReader: aClass]].