character classification
isLetterCode: anInteger
	"Answer whether anInteger is the code of a letter."

	^ (8r141 <= anInteger and: [anInteger <= 8r172]) or: [8r101 <= anInteger and: [anInteger <= 8r132]].
