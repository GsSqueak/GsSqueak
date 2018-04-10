debugging
debug: aProcess context: aContext label: aString contents: contents fullView: aBool 
	"Open a debugger on the given process and context."
	self default
		ifNil: [(self confirm: 'Debugger request -- proceed?')
				ifFalse: [Processor terminateActive].
			^ self].
	^ self default
		debug: aProcess
		context: aContext
		label: aString
		contents: contents
		fullView: aBool