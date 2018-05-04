*EnvironmentsEnv7-declaring
undeclare: aSymbol 
	^ (undeclared bindingOf: aSymbol)
		ifNil: [undeclared add: aSymbol => nil]
