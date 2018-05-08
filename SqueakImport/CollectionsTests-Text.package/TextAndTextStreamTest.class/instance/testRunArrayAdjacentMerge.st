tests
testRunArrayAdjacentMerge

	"this demonstrates that adjancent runs with equal attributes are merged. "
	| runArray |
	runArray := RunArray new.
	runArray 
		addLast: TextEmphasis normal times: 5;
		addLast: TextEmphasis bold times: 5;
		addLast: TextEmphasis bold times: 5.
	self assert: (runArray runs size = 2). 