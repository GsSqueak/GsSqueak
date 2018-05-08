accessing
indexOfSubCollection: sub startingAt: start ifAbsent: exceptionBlock
	"Answer the index of the receiver's first element, such that that element 
	equals the first element of sub, and the next elements equal 
	the rest of the elements of sub. Begin the search at element 
	start of the receiver. If no such match is found, answer the result of 
	evaluating argument, exceptionBlock."

	| index |	
	(index := self indexOfSubCollection: sub startingAt: start) = 0 ifFalse: [ ^index ].
	^ exceptionBlock value
