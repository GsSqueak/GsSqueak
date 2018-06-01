subclass responsibilities
clipboardInterpreterClass

	(#('Win32') includes: Smalltalk platformName) 
		ifTrue: [^CP1250ClipboardInterpreter  ].

	^ ISO88592ClipboardInterpreter .
