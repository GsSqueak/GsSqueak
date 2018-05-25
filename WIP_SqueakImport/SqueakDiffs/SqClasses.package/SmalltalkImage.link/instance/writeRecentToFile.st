sources, changes log
writeRecentToFile
	"Smalltalk writeRecentToFile"
	| numChars aDirectory aFileName |
	aDirectory := FileDirectory default.
	aFileName := Utilities
				keyLike: 'squeak-recent.01'
				withTrailing: '.log'
				satisfying: [:aKey | (aDirectory includesKey: aKey) not].
	numChars := ChangeSet getRecentLocatorWithPrompt: 'copy logged source as far back as...'.
	numChars
		ifNotNil: [self writeRecentCharacters: numChars toFileNamed: aFileName]
