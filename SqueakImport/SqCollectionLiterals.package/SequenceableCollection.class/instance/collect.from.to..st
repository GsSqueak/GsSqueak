*SqCollectionLiterals-*SqCollectionLiterals-enumerating
collect: aBlock from: firstIndex to: lastIndex
	"Refer to the comment in Collection|collect:."

	| size result |
	size := lastIndex - firstIndex + 1.
	result := self species new: size.
	1 to: size do: [ :index |
		result at: index put: (aBlock value: (self at: index + firstIndex - 1)) ].
	^result
