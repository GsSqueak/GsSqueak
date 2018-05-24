conversion
decodeZIfFail: failBlock

	self tupleSize ~= 0 ifTrue: [^ failBlock value].
	self dataStream next: 4 put: (self isBinary ifTrue: [0] ifFalse: [Character null]).
