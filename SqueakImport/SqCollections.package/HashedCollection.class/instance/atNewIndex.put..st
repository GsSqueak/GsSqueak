*SqCollectionLiterals-*SqCollectionLiterals-private
atNewIndex: index put: anObject

	array at: index put: anObject.
	tally := tally + 1.
	"Keep array at least 1/4 free for decent hash behavior"
	array size * 3 < (tally * 4) ifTrue: [ self grow ]
