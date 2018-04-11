new api - sessions
serialNumber

	| topazOutput |
	topazOutput := self run: 'GsSession currentSession serialNumber'.
	
	^ self convertToInteger: (topazOutput at: 1)