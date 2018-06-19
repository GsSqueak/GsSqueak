handling
isNested
	"Determine whether the current exception handler is within the scope of another handler for the same exception."

	^ self _env0 isNested
