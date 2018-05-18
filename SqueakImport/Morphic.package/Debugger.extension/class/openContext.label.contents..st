*Morphic-opening
openContext: aContext label: aString contents: contentsStringOrNil 
	"Open a notifier in response to an error, halt, or notify. A notifier view just shows a short view of the sender stack and provides a menu that lets the user open a full debugger."
	"Simulation guard"
	<primitive: 19>
	ErrorRecursionGuard critical:
		[ ErrorRecursion not & Preferences logDebuggerStackToFile ifTrue:
			[ Smalltalk
				logSqueakError: aString
				inContext: aContext ].
		ErrorRecursion ifTrue:
			[ ErrorRecursion := false.
			self primitiveError: aString ].
		ErrorRecursion := true.
		self
			informExistingDebugger: aContext
			label: aString.
		(Debugger context: aContext)
			openNotifierContents: contentsStringOrNil
			label: aString.
		ErrorRecursion := false].
	Processor activeProcess suspend 