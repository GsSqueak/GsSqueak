private
privateRemoveAt: index
	"Remove the element at the given index and make sure the sorting order is okay. The value of index must not be larger than tally."

	| removed |
	removed := array at: index.
	index = tally ifTrue: [
		array at: index put: nil.
		tally := tally - 1.
		^removed ].
	array 
		at: index put: (array at: tally);
		at: tally put: nil.
	tally := tally - 1.
	2 * index <= tally "The node at index has at least one child."
		ifTrue: [ self downHeapSingle: index ]
		ifFalse: [ self upHeap: index ].
	^removed