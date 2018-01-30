exceptions
on: exceptionOrExceptionSet do: handlerAction
	"Evaluate the receiver in the scope of an exception handler."
	| handlerActive |
	<primitive: 199>
	handlerActive := true.
	^self value