tests - bitLogic
testBitReversal
	{ 0. 1. SmallInteger maxVal-1. SmallInteger maxVal. SmallInteger maxVal+1. (2 raisedTo: 64)-1091. (2 raisedTo: 64)-1090. (2 raisedTo: 64)-1 } do: 
		[ : fixture |
		| printedThenReversed reversedThenPrinted |
		printedThenReversed := (fixture printPaddedWith: $0 to: 64 base: 2) reversed.
		reversedThenPrinted := (fixture bitReverse: 64) printPaddedWith: $0 to: 64 base: 2.
		self assert: printedThenReversed = reversedThenPrinted ]