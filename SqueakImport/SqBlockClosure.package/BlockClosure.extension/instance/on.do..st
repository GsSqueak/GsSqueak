*SqBlockClosure-exceptions
on: exceptionOrExceptionSet do: handlerAction
	"Evaluate the receiver in the scope of an exception handler."

	| handlerActive |
	handlerActive := true.
	^ self value
