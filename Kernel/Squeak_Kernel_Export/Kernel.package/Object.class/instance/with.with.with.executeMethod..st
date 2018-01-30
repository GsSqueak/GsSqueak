message handling
with: arg1 with: arg2 with: arg3 executeMethod: compiledMethod
	"Execute compiledMethod against the receiver and arg1, arg2, & arg3"

	<primitive: 189>
	^ self withArgs: {arg1. arg2. arg3} executeMethod: compiledMethod