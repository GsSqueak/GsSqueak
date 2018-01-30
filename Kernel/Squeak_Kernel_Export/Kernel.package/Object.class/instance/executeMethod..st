message handling
executeMethod: compiledMethod
	"Execute compiledMethod against the receiver with no args"

	<primitive: 189>
	^ self withArgs: #() executeMethod: compiledMethod