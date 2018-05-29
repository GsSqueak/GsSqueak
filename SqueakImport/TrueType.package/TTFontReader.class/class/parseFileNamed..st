instance creation
parseFileNamed: aString
	"TTFontReader parseFileNamed:'c:\windows\fonts\arial.ttf'"
	"TTFontReader parseFileNamed:'c:\windows\times.ttf'"
	| contents |
	contents := (FileStream readOnlyFileNamed: aString) binary contentsOfEntireFile.
	^self readFrom: (ReadStream on: contents)