testing
isEmpty
	"Answer whether any objects have been sent through the receiver and 
	not yet received by anyone."

	^readPosition = writePosition