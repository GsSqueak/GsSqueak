tests
testRunArrayRunsAreNotMerged

	" this demonstrates that different runs are not merged "
	| runArray |
	runArray := RunArray new.
	runArray 
		addLast: TextEmphasis normal times: 5;
		addLast: TextEmphasis bold times: 5;
		addLast: TextEmphasis normal times: 5.
	self assert: (runArray runs size = 3). 