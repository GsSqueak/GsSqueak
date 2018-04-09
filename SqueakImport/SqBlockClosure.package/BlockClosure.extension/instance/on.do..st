*SqBlockClosure-exceptions
on: exceptionOrExceptionSet do: handlerAction
	"Evaluate the receiver in the scope of an exception handler."

	| handlerActive |
	self halt.  "just a marker, fail and execute the following"
	handlerActive := true.
	^ self value
