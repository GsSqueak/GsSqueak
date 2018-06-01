subclass responsibilities
systemConverterClass

	(#('Win32') includes: Smalltalk platformName) 
		ifTrue: [^CP1250TextConverter ].

	^ ISO88592TextConverter.
