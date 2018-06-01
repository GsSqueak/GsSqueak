fileIn/Out
serviceFileIn
	"Answer a service for filing in an entire file"

	^ SimpleServiceEntry 
		provider: self 
		label: 'fileIn entire file' translatedNoop
		selector: #fileIn:
		description: 'file in the entire decompressed contents of the file, which is expected to contain Smalltalk code in fileout ("chunk") format' translatedNoop
		buttonLabel: 'filein' translatedNoop

