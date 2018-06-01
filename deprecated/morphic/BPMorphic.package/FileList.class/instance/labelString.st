initialization
labelString
	^ directory
		ifNil: ['File List']
		ifNotNil: [fileName
				ifNil: [directory fullName]
				ifNotNil: [directory fullNameFor: fileName]]