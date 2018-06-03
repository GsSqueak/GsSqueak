instance creation
libraryClassForGemStoneVersion: aString

	^ self withAllSubclasses detect: [:libraryClass |
		libraryClass isClassForVersion: aString]