new api - sessions
id

	| topazOutput |
	topazOutput := self run: 'GsSession sessionIdOfSerial: GsSession currentSession serialNumber'.
	
	^ self convertToInteger: (topazOutput at: 1)