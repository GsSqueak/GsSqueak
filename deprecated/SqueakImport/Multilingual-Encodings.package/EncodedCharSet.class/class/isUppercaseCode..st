character classification
isUppercaseCode: anInteger
	"Answer whether anInteger is the code of an uppercase letter."

	^ 8r101 <= anInteger and: [anInteger <= 8r132].
