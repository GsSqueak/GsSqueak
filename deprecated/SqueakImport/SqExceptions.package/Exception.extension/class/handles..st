*SqExceptions-exceptionSelector
handles: exception
	"Determine whether an exception handler will accept a signaled exception."

	^ self _env0 handles: exception
