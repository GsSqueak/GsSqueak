private
scanOrderFor: anObject

	1 to: tally do: [ :index |
		(order at: index) key = anObject ifTrue: [ ^index ] ].
	^nil