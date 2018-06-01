removing
removeFirst
	"Remove the root element and make sure the sorting order is okay. Optimized version for the most common use case."

	| removed |
	tally = 0 ifTrue: [ self errorSubscriptBounds: 1 ].
	removed := array at: 1.
	array 
		at: 1 put: (array at: tally);
		at: tally put: nil.
	(tally := tally - 1) > 1 ifTrue: [
		"Root node has at least one child."
		self downHeapSingle: 1 ].
	^removed