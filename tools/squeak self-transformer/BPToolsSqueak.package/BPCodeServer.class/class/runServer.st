as yet unclassified
runServer
	| symbol |

	TcpSocket ifNotNil: [self killServer].
	
	[[true] whileTrue: [
		TcpSocket := Socket newTCP.
		TcpSocket listenOn: self serverPort .
			Transcript show: 'succesfully created socket and started listening'.
			(TcpSocket waitForConnectionFor: 10000 ifTimedOut: [nil] ifRefused: [nil]) ifNotNil: [
			symbol := (self removeNewLineFromString: (TcpSocket receiveData)) asSymbol.
			self respondFor: symbol].
		TcpSocket close]] fork.
	
