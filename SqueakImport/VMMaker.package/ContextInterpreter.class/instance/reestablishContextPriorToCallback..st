contexts
reestablishContextPriorToCallback: callbackContext
	"callbackContext is an activation of invokeCallback:stack:registers:jmpbuf:.  Its sender
	 is the interpreter's state prior to the callback.  Reestablish that state."
	| calloutContext |
	<export: true>
	(objectMemory fetchClassOf: callbackContext) ~~ (objectMemory splObj: ClassMethodContext) ifTrue:
		[^false].
	calloutContext := objectMemory fetchPointer: SenderIndex ofObject: callbackContext.
	self newActiveContext: calloutContext.
	^true