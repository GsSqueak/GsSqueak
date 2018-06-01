private protocol
starttls
	Smalltalk at: #SqueakSSL ifAbsent:[self error: 'SqueakSSL is missing'].
	
	self sendCommand: self starttlsVerb.
	self checkResponse.
	self responseIsSuccess ifTrue: [
		stream := SqueakSSL secureSocketStream on: stream socket.
		stream sslConnectTo: self hostName.
		self connectionInfo at: #tlsActive put: true].