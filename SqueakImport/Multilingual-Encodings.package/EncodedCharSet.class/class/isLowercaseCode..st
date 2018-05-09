character classification
isLowercaseCode: anInteger
	"Answer whether anInteger is the code of a lowercase letter."

	^ 8r141 <= anInteger and: [anInteger <= 8r172].
