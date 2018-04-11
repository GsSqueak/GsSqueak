private
entriesMatching: patternString 
	"Answer a list of directory entries which match the patternString.
	The patternString may consist of multiple patterns separated by ';'.
	Each pattern can include a '*' or '#' as wildcards - see
	String>>match: "
	| _gsSqueakTemp_entries _gsSqueakTemp_patterns |
	_gsSqueakTemp_entries := directory entries
				reject: [:e | Smalltalk isMorphic
						and: [e isDirectory]].
	_gsSqueakTemp_patterns := patternString findTokens: ';'.
	(_gsSqueakTemp_patterns
			anySatisfy: [:each | each = '*'])
		ifTrue: [^ _gsSqueakTemp_entries].
	^ _gsSqueakTemp_entries
		select: [:entry | _gsSqueakTemp_patterns
				anySatisfy: [:each | each match: entry name]]