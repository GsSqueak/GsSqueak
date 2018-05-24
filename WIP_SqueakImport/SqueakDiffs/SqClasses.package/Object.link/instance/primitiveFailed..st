*SqClasses-error handling
primitiveFailed: selector
	"Announce that a primitive has failed and there is no appropriate 
	Smalltalk code to run."

	self error: selector asString, ' failed'
