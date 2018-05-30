subclass responsibilities
inputInterpreterClass

	(#('Win32') includes: Smalltalk platformName) 
		ifTrue: [^CP1250InputInterpreter ].

	^ ISO88592InputInterpreter.

