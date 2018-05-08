tests
testRunArrayReversal

  	"this tests the reversal of a  RunArray "
	| runArray |
	runArray := RunArray new.
	runArray 
		addLast: TextEmphasis normal times: 5;
		addLast: TextEmphasis bold times: 5;
		addLast: TextEmphasis normal times: 5.
	self assert: (runArray reversed runs size = 3). 