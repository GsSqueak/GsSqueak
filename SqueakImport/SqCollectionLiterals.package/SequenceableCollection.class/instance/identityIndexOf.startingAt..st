accessing
identityIndexOf: anElement startingAt: startIndex
	"Answer the index of anElement within the receiver starting at startIndex.
	If the receiver does not contain anElement, answer 0."

	startIndex to: self size do: [ :index |
		(self at: index) == anElement ifTrue: [ ^index ] ].
	^0