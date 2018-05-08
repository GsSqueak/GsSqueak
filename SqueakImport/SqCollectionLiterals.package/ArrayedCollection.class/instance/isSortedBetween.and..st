sorting
isSortedBetween: startIndex and: endIndex
	"Return true if the receiver is sorted by #<= between startIndex and endIndex."

	| previousElement |
	endIndex < startIndex ifTrue: [ ^true ].
	previousElement := self at: startIndex.
	startIndex + 1 to: endIndex do: [ :index |
		| element |
		element := self at: index.
		previousElement <= element ifFalse: [ ^false ].
		previousElement := element ].
	^true
