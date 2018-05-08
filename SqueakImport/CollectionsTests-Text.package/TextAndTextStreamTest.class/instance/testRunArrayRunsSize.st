tests
testRunArrayRunsSize

 	"this demonstrates that the size of a run array is the sum of the sizes of its runs. "
	| runArray |
	runArray := RunArray new.
  	runArray 
		addLast: TextEmphasis normal times: 5;
		addLast: TextEmphasis bold times: 5;
		addLast: TextEmphasis normal times: 5.
	self assert: (runArray size = 15). 