debugging
debugContext: aContext label: aString contents: contents 
	"Open a debugger on the given context."
	self default
		ifNil: [(self confirm: 'Debugger request -- proceed?')
				ifFalse: [Processor terminateActive].
			^ self].
	^ self default
		debugContext: aContext
		label: aString
		contents: contents