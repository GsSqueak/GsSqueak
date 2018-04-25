accessing
indexOf: anElement startingAt: start
	"Optimized version."

	firstIndex + start - 1 to: lastIndex do: [ :index |
		(array at: index) = anElement ifTrue: [ ^index - firstIndex + 1 ] ].
	^0