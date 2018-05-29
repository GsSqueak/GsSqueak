message handling
with: arg1 executeMethod: compiledMethod
	"Execute compiledMethod against the receiver and arg1"

	^ self withArgs: {arg1} executeMethod: compiledMethod
