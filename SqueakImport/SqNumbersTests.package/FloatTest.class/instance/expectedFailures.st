characterization
expectedFailures

	^ Smalltalk platformName = 'Win32'
		ifTrue: [#(testTimesTwoPowerGradualUnderflow)]
		ifFalse: [#()]