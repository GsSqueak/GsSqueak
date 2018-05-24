*Kernel-Processes-accessing
calleeOf: aContext
	"Return the context whose sender is aContext.  Return nil if aContext is on top.  Raise error if aContext is not in process chain."

	self suspendedContext == aContext ifTrue: [^ nil].
	^ (self suspendedContext findContextSuchThat: [:c | c sender == aContext])
		ifNil: [self error: 'aContext not in process chain']
