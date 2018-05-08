enumerating
findLast: aBlock startingAt: i
	"Return the index of my last element with index >= i for which aBlock evaluates as true."

	| index |
	index := self size + 1.
	[(index := index - 1) >= i] whileTrue:
		[(aBlock value: (self at: index)) ifTrue: [^index]].
	^ 0
