instance creation
forGemStoneVersion: aString wordSize: bits
	"e.g. self forGemStoneVersion: '3.5.0' wordSize: 64"
	| libraryClass |
	libraryClass := (GciLibrary libraryClassForWordSize: bits)
						libraryClassForGemStoneVersion: aString.
	^ libraryClass new
		gemStoneVersion: aString;
		yourself