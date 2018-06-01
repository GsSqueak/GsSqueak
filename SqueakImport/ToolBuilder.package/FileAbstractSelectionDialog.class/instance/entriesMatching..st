file list
entriesMatching: patternList
	"Answer a list of directory entries which match any of the patterns.
	See #parsePatternString for the pattern rules"

	| entries  |
	"This odd clause helps supports MVC projects; the file list & directory views are built from a list that includes directories. In Morphic we filter out the directories because they are entirely handled by the direcctory tree morph"
	entries := Smalltalk isMorphic 
		ifTrue:[self directory fileEntries ]
		ifFalse:[self directory entries].

	(patternList anySatisfy: [:each | each = '*'])
		ifTrue: [^ entries].

	^ entries select: [:entry | patternList anySatisfy: [:each | each match: entry name]]