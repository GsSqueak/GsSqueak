message handling
with: arg1 with: arg2 executeMethod: compiledMethod
	"Execute compiledMethod against the receiver and arg1 & arg2"

	<primitive: 189>
	^ self withArgs: {arg1. arg2} executeMethod: compiledMethod