accessing
at: index 	"Return the element at the given position within the receiver"	index > tally		ifTrue: [^ self errorSubscriptBounds: index].	^ array at: index