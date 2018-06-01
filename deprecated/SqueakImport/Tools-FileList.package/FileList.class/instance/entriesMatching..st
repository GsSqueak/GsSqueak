private
entriesMatching: patternString
	"Answer a list of directory entries which match the patternString.
	The patternString may consist of multiple patterns separated by ';'.
	Each pattern can include a '*' or '#' as wildcards - see String>>match:"

	| entries patterns |
	entries := directory entries reject:[:e| Smalltalk isMorphic and: [e isDirectory]].
	patterns := patternString findTokens: ';'.
	(patterns anySatisfy: [:each | each = '*'])
		ifTrue: [^ entries].
	^ entries select: [:entry | patterns anySatisfy: [:each | each match: entry name]]