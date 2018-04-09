*SqCollectionLiterals-testing
isAllDigits
	"whether the receiver is composed entirely of digits"
	self do: [:c | c isDigit ifFalse: [^ false]].
	^ true
