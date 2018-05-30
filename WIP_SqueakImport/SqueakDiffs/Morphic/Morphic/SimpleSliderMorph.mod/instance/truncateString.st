menu
truncateString
	^ (truncate
		ifTrue: ['turn off truncation' translatedNoop]
		ifFalse: ['turn on truncation' translatedNoop])  translated