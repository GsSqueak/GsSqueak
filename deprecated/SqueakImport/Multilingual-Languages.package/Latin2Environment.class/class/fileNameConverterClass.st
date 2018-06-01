subclass responsibilities
fileNameConverterClass

	(#('Win32') includes: Smalltalk platformName) 
		ifTrue: [^CP1250TextConverter ].

	^ ISO88592TextConverter.

