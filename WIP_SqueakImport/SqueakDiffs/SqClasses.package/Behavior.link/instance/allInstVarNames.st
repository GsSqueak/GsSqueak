accessing instances and variables
allInstVarNames
	"Answer an Array of the names of the receiver's instance variables. The 
	Array ordering is the order in which the variables are stored and 
	accessed by the interpreter."

	^ self _env0 allInstVarNames
