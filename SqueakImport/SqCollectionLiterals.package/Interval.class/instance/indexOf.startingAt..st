*SqCollectionLiterals-*SqCollectionLiterals-accessing
indexOf: anElement startingAt: startIndex
	"startIndex is an positive integer, the collection index where the search is started."
	"during the computation of val , floats are only used when the receiver	contains floats"

	| index val |
	(self rangeIncludes: anElement) ifFalse: [ ^0 ].
	val := anElement - self first / self increment.
	val isFloat
		ifTrue: [
			(val - val rounded) abs * 100000000 < 1 ifFalse: [ ^0 ].
			index := val rounded + 1 ]
		ifFalse: [
			val isInteger ifFalse: [ ^0 ].
			index := val + 1 ].
	"finally, the value of startIndex comes into play:"
	(index between: startIndex and: self size) ifFalse: [ ^0 ].
	^index
