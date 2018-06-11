instance creation
forGemStoneVersion: aString wordSize: bytes
	"e.g. self forGemStoneVersion: '3.5.0' wordSize: 8"
	| libraryClass |
	libraryClass := (GciTsLibrary libraryClassForWordSize: bytes)
						libraryClassForGemStoneVersion: aString.
	^ libraryClass new
		gemStoneVersion: aString;
		yourself