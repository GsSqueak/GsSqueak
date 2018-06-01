debugging
interrupt: aProcess label: aString 
	"Open a debugger on the given process and context."
	self default
		ifNil: [(self confirm: 'Debugger request -- proceed?')
				ifFalse: [aProcess terminate].
			^ self].
	^ self default interrupt: aProcess label: aString