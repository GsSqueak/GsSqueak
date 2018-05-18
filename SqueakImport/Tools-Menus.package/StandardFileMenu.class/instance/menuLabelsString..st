menu building
menuLabelsString: aDirectory
"Answer a menu labels object corresponding to aDirectory"

	^ String streamContents: 
		[:s | 
			canTypeFileName ifTrue: 
				[s nextPutAll: 'Enter File Name...'; cr].
			s nextPutAll: (self pathPartsString: aDirectory).
			s nextPutAll: (self directoryNamesString: aDirectory).
			s nextPutAll: (self fileNamesString: aDirectory).
			s skip: -1]