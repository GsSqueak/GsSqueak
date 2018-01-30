comparing
= anObject 
	"Heap are considered to be equal when they have the same sortBlock
	and the same elements. This method is expensive due to the sorted
	copies of the arrays. Try not to use it."
	self == anObject
		ifTrue: [^ true].
	anObject isHeap
		ifFalse: [^ false].
	anObject size = tally
		ifFalse: [^ false].
	anObject sortBlock = sortBlock
		ifFalse: [^ false].
	^ ((array first: tally)
		sort: sortBlock)
		= ((anObject array first: tally)
				sort: sortBlock)