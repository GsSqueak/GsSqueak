tests - evaluating
testEmptyBlocksAnswerNil
	"In the olden days ([:a :b|] value: #first value: #last) == #last..."
	{[]. [:a|]. [:a :b|]. [:a :b :c|]} do:
		[:block|
		self assert: (block cull: 1 cull: 2 cull: 3) equals: nil]