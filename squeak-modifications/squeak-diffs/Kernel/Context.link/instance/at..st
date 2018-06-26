accessing
at: anIndex

	"Values of Arguments are stored from position 11 onwards in the StackFrame" 
	^ (self frameContents at: 10 + anIndex)
