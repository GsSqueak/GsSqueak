private-exceptions
handleSignal: exception
	"Sent to handler (on:do:) contexts only.  If my exception class (first arg) handles exception
	 and the handler is active then execute my handle block (second arg), otherwise forward
	 this message to the next handler context.  If none left, execute exception's defaultAction
	 (see nil>>handleSignal:)."

	| handlerActive val |
	"If the context has been returned from the handlerActive temp var may not be accessible."
	handlerActive := stackp >= 3 and: [(self tempAt: 3) == true].
	(((self tempAt: 1) handles: exception) and: [handlerActive]) ifFalse:
		[^self nextHandlerContext handleSignal: exception].

	exception privHandlerContext: self contextTag.
	self tempAt: 3 put: false.  "disable self while executing handle block"
	val := [(self tempAt: 2) cull: exception]
			ensure: [self tempAt: 3 put: true].
	self return: val  "return from self if not otherwise directed in handle block"
