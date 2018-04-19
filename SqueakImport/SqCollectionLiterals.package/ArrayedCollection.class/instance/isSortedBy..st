*SqCollectionLiterals-*SqCollectionLiterals-sorting
isSortedBy: aSortBlockOrNil
	"Return true if the receiver is sorted by aSortBlockOrNil. Use #<= for comparison if aSortBlockOrNil is nil."

	^self isSortedBy: aSortBlockOrNil between: 1 and: self size
