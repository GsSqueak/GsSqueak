private protocol
openPassiveDataConnection
	| portInfo list dataPort remoteHostAddress |
	self sendCommand: 'PASV'.
	self lookForCode: 227 ifDifferent: [:response | (TelnetProtocolError protocolInstance: self) signal: 'Could not enter passive mode: ' , response].
	portInfo := (self lastResponse findTokens: '()') at: 2.
	list := portInfo findTokens: ','.
	remoteHostAddress := NetNameResolver addressForName: (list at: 1)
					, '.'
					, (list at: 2) , '.'
					, (list at: 3) , '.'
					, (list at: 4) timeout: 30.
	dataPort := (list at: 5) asNumber * 256 + (list at: 6) asNumber.
	self openDataSocket: remoteHostAddress port: dataPort