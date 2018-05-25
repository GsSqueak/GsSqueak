*SqClasses-*SqClasses-*SqClasses-sources, changes log
writeRecentCharacters: nCharacters toFileNamed: aFilename
	"Schedule an editable text view on the last n characters of changes."
	| changes |
	changes := SourceFiles at: 2.
	changes setToEnd; skip: nCharacters negated.
	(FileStream newFileNamed: aFilename) nextPutAll: (changes next: nCharacters); close; open; edit
