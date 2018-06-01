private
initiateSession
	"EHLO <SP> <domain> <CRLF>"

	self sendCommand: 'FEAT'.
	self checkResponse.
	
	self parseCapabilities: self lastResponse lines allButFirst allButLast.
