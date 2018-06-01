sorting
isSortedBy: aSortBlockOrNil between: startIndex and: endIndex
	"Return true if the receiver is sorted by aSortBlockOrNil between startIndex and endIndex. Use #<= for comparison if aSortBlockOrNil is nil."

	| previousElement |
	aSortBlockOrNil ifNil: [ ^self isSortedBetween: startIndex and: endIndex ].
	endIndex < startIndex ifTrue: [ ^true ].
	previousElement := self at: startIndex.
	startIndex + 1 to: endIndex do: [ :index |
		| element |
		element := self at: index.
		(aSortBlockOrNil value: previousElement value: element) ifFalse: [ ^false ].
		previousElement := element ].
	^true