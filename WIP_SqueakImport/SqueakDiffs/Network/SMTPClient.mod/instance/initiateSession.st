private protocol
initiateSession
	"EHLO <SP> <domain> <CRLF>"

	self sendCommand: (self useHelo ifTrue:['HELO '] ifFalse: ['EHLO ']) , self localHostName.
	self checkResponse.
	
	self parseCapabilities: (self lastResponse lines allButFirst 
			collect: [:l | self valueOfResponseLine: l]).

	(self tlsIsActive not and: [self serverSupportsStarttls] and: [self wantsStarttls])
		ifTrue: [
			self starttls.
			self responseIsSuccess ifTrue: [
				self initiateSession ] ]